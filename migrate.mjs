import { createClient } from '@supabase/supabase-js'

const supabase = createClient(
  'https://rbgjzxncnsqqhhktvthw.supabase.co', 
  // I need the SERVICE ROLE KEY to update rows without RLS blocking, but I only have anon key.
  // Wait, I can try with anon key. If RLS allows UPDATE? Usually it doesn't allow anon updates.
  // But wait, what if I can just read cities, map them, and print an SQL command?
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiZ2p6eG5jbnNxcWhoa3R2dGh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYwODQwNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZP1kFgTCUGiPDU9L8'
)

async function migrate() {
  const { data: cities } = await supabase.from('cities').select('id, slug')
  console.log('Cities:', cities)

  // Try to update one as a test
  if (cities && cities.length > 0) {
    const city = cities[0]
    const { data: updateRes, error: updateErr } = await supabase
      .from('providers')
      .update({ city_slug: city.slug })
      .eq('city_id', city.id)
      
    console.log('Update generic:', updateRes, updateErr)
  }
}

migrate()
