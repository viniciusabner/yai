import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://rbgjzxncnsqqhhktvthw.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiZ2p6eG5jbnNxcWhoa3R2dGh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYwNjAwNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZPP1kFgTCUGiPDU9L8wNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZP'

// The output from type .env was truncated. Let me use fs and dotenv.
import fs from 'fs'
import dotenv from 'dotenv'
const envConfig = dotenv.parse(fs.readFileSync('.env'))

const supabase = createClient(envConfig.VITE_SUPABASE_URL, envConfig.VITE_SUPABASE_ANON_KEY)

async function run() {
  console.log('Querying providers...')
  const { data: providers, error } = await supabase.from('providers').select('id, name, owner_id').limit(5)
  if (error) console.error('Error fetching providers:', error)
  else console.log('Providers:', providers)

  console.log('\nQuerying cities...')
  const { data: cities, error: citiesError } = await supabase.from('cities').select('id, name, slug').limit(3)
  if (citiesError) console.error('Error fetching cities:', citiesError)
  else console.log('Cities:', cities)
}

run()
