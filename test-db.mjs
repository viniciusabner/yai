import { createClient } from '@supabase/supabase-js'

const supabase = createClient('https://rbgjzxncnsqqhhktvthw.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiZ2p6eG5jbnNxcWhoa3R2dGh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYwODQwNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZP1kFgTCUGiPDU9L8')

async function test() {
  const cityIds = ['santo-andre']
  const { data: dbCities } = await supabase.from('cities').select('id, slug, name').in('slug', cityIds)
  console.log('Cities found:', dbCities)
  
  const validIds = dbCities?.map(c => c.id) || []
  
  let q = supabase.from('providers').select('id, name, city_id, city_slug')
  
  if (validIds.length > 0) {
    q = q.or(`city_slug.in.(${cityIds.join(',')}),city_id.in.(${validIds.join(',')})`)
  } else {
    q = q.in('city_slug', cityIds)
  }
  
  q = q.eq('category', 'imobiliaria')
  
  const { data, error } = await q
  console.log('Providers from query:', data, error)
  
  // also fetch ALL providers just to see
  const { data: all } = await supabase.from('providers').select('id, name, city_slug, city_id').limit(10)
  console.log('All providers sample:', all)
}

test()
