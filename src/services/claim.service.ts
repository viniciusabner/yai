import { supabase, publicSupabase } from './supabase'

export interface ProviderMatch {
  id: string
  name: string
  category: string
  city_slug: string
}

/**
 * Checks if there is an unclaimed provider in the DB matching the given email.
 * Returns the provider data if found, or null.
 */
export async function checkEmailProviderMatch(email: string): Promise<ProviderMatch | null> {
  console.log('[CLAIM_DEBUG] Calling checkEmailProviderMatch for:', email)
  const { data, error } = await publicSupabase
    .from('providers')
    .select('id, name, category, city_slug')
    .eq('email', email)
    .is('owner_id', null)
    .limit(1)
    .maybeSingle()
  console.log('[CLAIM_DEBUG] Query result:', { data, error })

  if (error) {
    console.error('Error checking email provider match:', error)
    return null
  }

  return data as ProviderMatch | null
}

/**
 * Claims a provider profile by assigning owner_id to the given userId.
 * Automatically called after the user confirms the claim banner.
 */
export async function claimProviderByEmail(providerId: string, userId: string): Promise<boolean> {
  const { error } = await supabase
    .from('providers')
    .update({ owner_id: userId })
    .eq('id', providerId)
    .is('owner_id', null) // Safety: only update if still unclaimed

  if (error) {
    console.error('Error claiming provider:', error)
    return false
  }

  return true
}
