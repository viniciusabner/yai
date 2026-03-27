
const fs = require('fs')
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

async function run() {
  try {
    const painters = JSON.parse(fs.readFileSync('painters_ribeirao_pires.json', 'utf8'))

    let sql = `-- Inserção de Pintores em Ribeirão Pires (Apenas Verificados)
-- Cidade ID: 1f84b6c7-69e8-49c6-a691-30da5246e0ea
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'pintor')
  OR slug LIKE '%-ribeirao-pires'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'pintor')
  OR slug LIKE '%-ribeirao-pires'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'pintor')
OR slug LIKE '%-ribeirao-pires';

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
  'Serviços de pintura profissional em Ribeirão Pires', 
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

    fs.writeFileSync('src/database/seeds/111_real_painters_ribeirao_pires.sql', sql)
    console.log('SQL generated at src/database/seeds/111_real_painters_ribeirao_pires.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
