

const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')
const fs = require('fs')
const path = require('path')

dotenv.config()

const supabaseUrl = process.env.VITE_SUPABASE_URL
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseKey) {
  console.error('Missing Supabase credentials in .env')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)


async function run() {
  const sql = fs.readFileSync(path.join(process.cwd(), 'src/database/queries/check_coverage.sql'), 'utf8')
  
  // Note: RPC or direct query via library might not work for raw SQL if not enabled. 
  // But we can try to use a function or just query the views/tables directly.
  // Actually, standard client doesn't run raw SQL easily without an RPC. 
  // Let's try to simulate the query with standard SDK methods for now, or use a workaround.
  
  // Alternative: Read all providers and aggregate in JS. It's not huge data.
  
  const { data: providers, error: pError } = await supabase
    .from('providers')
    .select('category, city_id')
    
  const { data: cities, error: cError } = await supabase
    .from('cities')
    .select('id, name')

  if (pError || cError) {
    console.error('Error fetching data:', pError, cError)
    return
  }

  const coverage: Record<string, Record<string, number>> = {}

  cities.forEach(city => {
    coverage[city.name] = {}
  })

  providers.forEach(p => {
    const city = cities.find(c => c.id === p.city_id)
    if (city) {
      if (!coverage[city.name][p.category]) {
        coverage[city.name][p.category] = 0
      }
      coverage[city.name][p.category]++
    }
  })

  console.log('--- Coverage Report ---')
  for (const city in coverage) {
    console.log(`\nCity: ${city}`)
    const categories = coverage[city]
    if (Object.keys(categories).length === 0) {
      console.log('  No providers found.')
    } else {
        for (const cat in categories) {
            console.log(`  - ${cat}: ${categories[cat]}`)
        }
    }
  }
}

run()
