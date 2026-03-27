import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseAnonKey) {
  console.warn('Missing Supabase environment variables. Please check your .env file.')
}

const customStorage = {
  getItem: (key: string) => {
    const isRemembered = localStorage.getItem('yai-remember-me') === 'true'
    const storage = isRemembered ? localStorage : sessionStorage
    return storage.getItem(key)
  },
  setItem: (key: string, value: string) => {
    const isRemembered = localStorage.getItem('yai-remember-me') === 'true'
    const storage = isRemembered ? localStorage : sessionStorage
    storage.setItem(key, value)
  },
  removeItem: (key: string) => {
    localStorage.removeItem(key)
    sessionStorage.removeItem(key)
  },
}

export const supabase = createClient(
  supabaseUrl || 'https://no-project.supabase.co',
  supabaseAnonKey || 'no-key',
  {
    auth: {
      persistSession: true,
      storage: customStorage,
      autoRefreshToken: true,
      detectSessionInUrl: true
    }
  }
)

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
