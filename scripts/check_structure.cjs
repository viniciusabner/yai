
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

const supabaseUrl = process.env.VITE_SUPABASE_URL
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY

const supabase = createClient(supabaseUrl, supabaseKey)

async function run() {
  // Check categories structure
  const { data: catData, error: catError } = await supabase
    .from('categories')
    .select('*')
    .limit(1)
  
  if (catError) console.error('Error fetching categories:', catError)
  else console.log('Categories Sample:', catData)

  // Check providers structure
  const { data: provData, error: provError } = await supabase
    .from('providers')
    .select('*')
    .limit(1)

  if (provError) console.error('Error fetching providers:', provError)
  else console.log('Providers Sample:', provData)
}

run()
