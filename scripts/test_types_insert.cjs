
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

const supabaseUrl = process.env.VITE_SUPABASE_URL
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY

const supabase = createClient(supabaseUrl, supabaseKey)

async function run() {
  console.log('Testing types...')
  
  const typesToTest = ['business', 'individual', 'agency', 'freelancer', 'company']

  for (const t of typesToTest) {
    const { error } = await supabase
      .from('providers')
      .insert({
        id: crypto.randomUUID(),
        name: 'Test ' + t,
        type: t,
        city_id: '85b13d20-450b-4ce2-ad14-146a13738fd1', // Santo Andre
        slug: 'test-' + t + '-' + Date.now(),
        active: false // avoid showing up in real searches
      })

    if (error) {
      console.log(`Type '${t}' failed:`, error.message)
    } else {
      console.log(`Type '${t}' succeeded!`)
      // clean up if needed, but RLS might block delete
    }
  }
}

run()
