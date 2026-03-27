import { getSessionId } from '../utils/session'
import { supabase, publicSupabase } from './supabase'

export interface Provider {
  id: string
  name: string
  type?: string
  city_id: string
  category_id?: string
  neighborhood: string
  address?: string
  whatsapp?: string
  phone: string
  email?: string
  source?: string
  active?: boolean
  created_at?: string
  slug?: string
  category?: string
  website?: string
  city_slug?: string
  state?: string
  creci?: string
  confirmed?: boolean
  description?: string
  rating?: number
  review_count?: number
  photos?: string[]
  opening_hours?: Record<string, string>
}



// Re-writing with ID to be safer
export async function getProvidersByCityIds(cityIds: string[], category?: string | null) {
    if (!cityIds || cityIds.length === 0) return [];

    // `cityIds` received from `CitySelectionModal` are already UUIDs from the 'cities' table.
    let query = publicSupabase.from('providers').select('*').in('city_id', cityIds)
    
    if (category) {
      query = query.eq('category', category)
    }
    
    const { data: providers, error: providersError } = await query
    if (providersError) throw providersError


    // 2. Fetch my confirmed events
    const sessionId = getSessionId()
    const { data: myEvents } = await supabase
      .from('contact_events')
      .select('provider_id')
      .eq('session_id', sessionId)
      .eq('event_type', 'whatsapp_confirmed')

    const confirmedProviderIds = new Set(myEvents?.map(e => e.provider_id) || [])

    // 3. Merge
    return providers.map(p => ({
      ...p,
      confirmed: confirmedProviderIds.has(p.id)
    })) as Provider[]
}

export async function logContactEvent(providerId: string, eventType: 'whatsapp_click' | 'whatsapp_confirmed') {
  const sessionId = getSessionId()
  const { error } = await supabase
    .from('contact_events')
    .insert({
      provider_id: providerId,
      event_type: eventType,
      session_id: sessionId
    })

  if (error) {
    console.error('Error logging contact event:', error)
  }
}

export async function claimProvider(providerId: string) {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('User not authenticated')

  const { error } = await supabase
    .from('providers')
    .update({ owner_id: user.id })
    .eq('id', providerId)
    .is('owner_id', null) // Only claim if unowned

  if (error) throw error
  return true
}

export async function getMyProviders() {
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return []

  const { data } = await supabase
    .from('providers')
    .select('*')
    .eq('owner_id', user.id)
  
  return data as Provider[]
}
