import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseAnonKey) {
  console.warn('Missing Supabase environment variables. Please check your .env file.')
}


const customStorage = {
  getItem: (key: string) => {
    console.log('[SUPABASE_STORAGE] Reading key:', key)
    const value = localStorage.getItem(key)
    if (!value) return null
    if (key.includes('auth-token')) {
      try {
        const data = JSON.parse(value)
        if (data.expires_at) {
          console.log('[SUPABASE_STORAGE] Detected auth-token with expiry:', new Date(data.expires_at * 1000).toISOString())
          // Force expiry to 2030 to prevent local loop
          data.expires_at = 1893456000 
          console.log('[SUPABASE_STORAGE] Hacking expiry to 2030 for local stability.')
        }
        return JSON.stringify(data)
      } catch (e) { return value }
    }
    return value
  },
  setItem: (key: string, value: string) => {
    console.log('[SUPABASE_STORAGE] Setting key:', key)
    localStorage.setItem(key, value)
  },
  removeItem: (key: string) => {
    console.log('[SUPABASE_STORAGE] Removing key:', key)
    localStorage.removeItem(key)
  },
}

export const supabase = createClient(
  supabaseUrl || 'https://no-project.supabase.co',
  supabaseAnonKey || 'no-key',
  {
    auth: {
      persistSession: true,
      storage: customStorage,
      autoRefreshToken: false,
      detectSessionInUrl: true
    }
  }
)

// export const supabase = createClient(
//   supabaseUrl,
//   supabaseAnonKey,
//   {
//     auth: {
//       persistSession: true,
//       autoRefreshToken: true,
//       detectSessionInUrl: true,
//     }
//   }
// )

export const publicSupabase = createClient(
  supabaseUrl || 'https://no-project.supabase.co',
  supabaseAnonKey || 'no-key',
  {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
      detectSessionInUrl: false
    }
  }
)
