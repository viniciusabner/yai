import { supabase } from './supabase'

export interface City {
  id: string
  name: string
  slug: string
}

export async function getCities() {
  const { data, error } = await supabase
    .from('cities')
    .select('*')
    .order('name')
  
  if (error) throw error
  return data as City[]
}
