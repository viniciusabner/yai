
const fs = require('fs')
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

async function run() {
  try {
    const painters = JSON.parse(fs.readFileSync('painters_maua.json', 'utf8'))

    let sql = `-- Inserção de Pintores em Mauá (Apenas Verificados)
-- Cidade ID: 6f15b756-1913-4ca0-81ea-5a82f11740a3
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'pintor')
  OR slug LIKE '%-maua'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'pintor')
  OR slug LIKE '%-maua'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'pintor')
OR slug LIKE '%-maua';

`

    painters.forEach(p => {
      const name = p.name.replace(/'/g, "''")
      const address = p.address.replace(/'/g, "''")
      const neighborhood = p.neighborhood.replace(/'/g, "''")
      const slug = p.slug

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
  '${neighborhood}', 
  '${address}',
  '${p.whatsapp}', 
  '${p.phone}', 
  ${p.email ? `'${p.email}'` : 'NULL'}, 
  ${p.website ? `'${p.website}'` : 'NULL'}, 
  true, 
  '${slug}',
  'Serviços de pintura profissional em Mauá', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
`
    })

    fs.writeFileSync('src/database/seeds/110_real_painters_maua.sql', sql)
    console.log('SQL generated at src/database/seeds/110_real_painters_maua.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
