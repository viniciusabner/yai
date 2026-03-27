import { supabase } from './supabase'
import { getSessionId } from '../utils/session'

export async function signInWithGoogle() {
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: 'google',
    options: {
      redirectTo: `${window.location.origin}/`, // Redirect back to home
    },
  })
  if (error) throw error
  return data
}

// @ts-ignore
export async function signInWithPassword(email: string, password: string, rememberMe = true) {
  // Set flag for custom storage proxy in supabase.ts
  localStorage.setItem('yai-remember-me', rememberMe ? 'true' : 'false')
  
  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password,
  })
  if (error) throw error
  return data
}

export async function signUpWithEmail(email: string, password: string, name: string, whatsapp: string) {
  const { data, error } = await supabase.auth.signUp({
    email,
    password,
    options: {
      data: {
        full_name: name,
        whatsapp: whatsapp,
      },
    },
  })
  if (error) throw error
  return data
}

export async function mergeAnonymousHistory() {
  const sessionId = getSessionId()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user || !sessionId) return

  // Find all events with this session_id AND no user_id
  // And update them to have the current user_id
  const { error } = await supabase
    .from('contact_events')
    .update({ user_id: user.id })
    .eq('session_id', sessionId)
    .is('user_id', null)

  if (error) {
    console.error('Error merging history:', error)
  } else {
    console.log('History merged successfully')
  }
}

export async function resetPasswordForEmail(email: string) {
  const { data, error } = await supabase.auth.resetPasswordForEmail(email, {
    redirectTo: `${window.location.origin}/update-password`,
  })
  if (error) throw error
  return data
}
