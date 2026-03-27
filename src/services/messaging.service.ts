import { supabase } from './supabase'

export interface Conversation {
  id: string
  provider_id: string
  created_at: string
  provider: {
    name: string
    neighborhood: string
    category?: string
  }
  last_message?: {
    content: string
    created_at: string
    read: boolean
    sender_id: string
  }
}

export interface Message {
  id: string
  conversation_id: string
  sender_id: string
  content: string
  read: boolean
  created_at: string
}

export async function getConversations() {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('User not authenticated')

  const { data, error } = await supabase
    .from('conversations')
    .select(`
      id,
      created_at,
      provider_id,
      provider:providers (
        name,
        neighborhood,
        category
      )
    `)
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })

  if (error) throw error

  // TODO: Fetch last message for each conversation manually or via view if performance needed
  // For now, we return basic conversation info
  return data as unknown as Conversation[]
}

import { getMyProviders } from './providers.service'

export async function getProviderConversations() {
  const providers = await getMyProviders()
  if (!providers.length) return []
  
  const providerIds = providers.map(p => p.id)

  const { data, error } = await supabase
    .from('conversations')
    .select(`
      id,
      created_at,
      user_id,
      provider:providers (
        name,
        neighborhood,
        category,
        owner_id
      )
    `)
    .in('provider_id', providerIds)
    .order('created_at', { ascending: false })

  if (error) throw error

  // Fetch user profiles manually since no direct FK exists to profiles table from conversations
  const userIds = [...new Set((data || []).map(c => c.user_id))]
  
  let profiles: any[] = []
  if (userIds.length > 0) {
    const { data: profilesData } = await supabase
      .from('profiles')
      .select('id, full_name')
      .in('id', userIds)
    profiles = profilesData || []
  }

  const profileMap = new Map(profiles.map(p => [p.id, p]))

  return data?.map(c => ({
    ...c,
    user: profileMap.get(c.user_id) || { full_name: 'Usuário Desconhecido' }
  }))
}

export async function getMessages(conversationId: string) {
  const { data, error } = await supabase
    .from('messages')
    .select('*')
    .eq('conversation_id', conversationId)
    .order('created_at', { ascending: true })

  if (error) throw error
  return data as Message[]
}

export async function sendMessage(conversationId: string, content: string) {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('User not authenticated')

  const { data, error } = await supabase
    .from('messages')
    .insert({
      conversation_id: conversationId,
      sender_id: user.id,
      content
    })
    .select()
    .single()

  if (error) throw error
  return data as Message
}

export async function startConversation(providerId: string, initialMessage: string) {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('User not authenticated')

  // 1. Check if conversation exists
  const { data: existing } = await supabase
    .from('conversations')
    .select('id')
    .eq('user_id', user.id)
    .eq('provider_id', providerId)
    .single()

  let conversationId = existing?.id

  // 2. Create if not exists
  if (!conversationId) {
    const { data: newConv, error: createError } = await supabase
      .from('conversations')
      .insert({
        user_id: user.id,
        provider_id: providerId
      })
      .select('id')
      .single()

    if (createError) throw createError
    conversationId = newConv.id
  }

  // 3. Send message
  await sendMessage(conversationId, initialMessage)

  return conversationId
}

export function subscribeToMessages(conversationId: string, onNewMessage: (msg: Message) => void) {
  return supabase
    .channel(`conversation:${conversationId}`)
    .on(
      'postgres_changes',
      {
        event: 'INSERT',
        schema: 'public',
        table: 'messages',
        filter: `conversation_id=eq.${conversationId}`
      },
      (payload) => {
        onNewMessage(payload.new as Message)
      }
    )
    .subscribe()
}

export async function sendMessageToProviders(providerIds: string[], content: string) {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('User not authenticated')

  // We can initiate all conversations in parallel
  const promises = providerIds.map(providerId => startConversation(providerId, content))
  
  const results = await Promise.allSettled(promises)
  
  const successful = results.filter(r => r.status === 'fulfilled').length
  return { successful, total: providerIds.length }
}

export async function getUnreadCount() {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return 0

  const { count, error } = await supabase
    .from('messages')
    .select('*', { count: 'exact', head: true })
    .eq('read', false)
    .neq('sender_id', user.id)

  if (error) {
    console.error('Error fetching unread count:', error)
    return 0
  }
  return count || 0
}

export async function markAsRead(conversationId: string) {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return

  const { error } = await supabase
    .from('messages')
    .update({ read: true })
    .eq('conversation_id', conversationId)
    .eq('read', false)
    .neq('sender_id', user.id)

  if (error) {
    console.error('Error marking messages as read:', error)
  }
}
