import { supabase } from './supabase'

export interface City {
  id: string
  name: string
  slug: string
}

export async function getCities() {
  console.log('entrou no getCities')
  console.log('supabase', supabase)

  // const { data, error } = await supabase.auth.getSession()
  // console.log('SESSION', data, error)

  const { data, error } = await supabase
    .from('cities')
    .select('*')
    .order('name')

  console.log('data getCities', data)
  console.log('error getCities', error)

  if (error) throw error
  return data as City[]
}
