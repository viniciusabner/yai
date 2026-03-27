
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

const supabaseUrl = process.env.VITE_SUPABASE_URL
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY

const supabase = createClient(supabaseUrl, supabaseKey)

async function run() {
  const { data, error } = await supabase
    .from('cities')
    .select('id, slug')
    .eq('slug', 'diadema')
    .single()

  if (error) {
    console.error('Error:', error)
  } else {
    console.log('City ID:', data.id)
  }
}

run()
