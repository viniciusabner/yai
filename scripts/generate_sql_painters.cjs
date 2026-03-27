
const fs = require('fs')
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

async function run() {
  try {
    // Read JSON
    const painters = JSON.parse(fs.readFileSync('painters_santo_andre.json', 'utf8'))

    // Generate SQL
    let sql = `-- Inserção de Pintores em Santo André (Dados Reais)
-- Cidade ID: 85b13d20-450b-4ce2-ad14-146a13738fd1
-- Categoria: Buscada via Subquery (Pintor)

`

    painters.forEach(p => {
      // Escape single quotes
      const name = p.name ? p.name.replace(/'/g, "''") : ''
      const address = p.address ? `'${p.address.replace(/'/g, "''")}'` : 'NULL'
      const phone = p.phone ? `'${p.phone}'` : 'NULL'
      const whatsapp = p.whatsapp ? `'${p.whatsapp}'` : 'NULL'
      const email = p.email ? `'${p.email}'` : 'NULL'
      const website = p.website ? `'${p.website}'` : 'NULL'
      const neighborhood = p.neighborhood ? `'${p.neighborhood.replace(/'/g, "''")}'` : 'NULL'
      
      // Generate valid slug if not present
      const slug = p.slug || p.name.toLowerCase()
        .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
        .replace(/[^a-z0-9]+/g, '-')
        .replace(/^-+|-+$/g, '') + '-santo-andre'

      sql += `
INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '${p.id}', 
  '${name}', 
  '${p.city_id}', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  ${neighborhood}, 
  ${address},
  ${whatsapp}, 
  ${phone}, 
  ${email}, 
  ${website}, 
  true, 
  '${slug}',
  'Serviços de pintura profissional em Santo André', 
  5.0, 
  'manual_search'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
`
    })

    fs.writeFileSync('src/database/seeds/106_real_painters_santo_andre.sql', sql)
    console.log('SQL generated at src/database/seeds/106_real_painters_santo_andre.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
