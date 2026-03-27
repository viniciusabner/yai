
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

const supabaseUrl = process.env.VITE_SUPABASE_URL
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY

const supabase = createClient(supabaseUrl, supabaseKey)

async function run() {
  // Check distinct types
  const { data, error } = await supabase
    .from('providers')
    .select('type')
    .limit(50)
  
  if (error) {
    console.error('Error:', error)
  } else {
    // manual aggregation since we might not have select distinct permission or it's easier here
    const types = [...new Set(data.map(d => d.type))]
    console.log('Existing types:', types)
  }
}

run()
