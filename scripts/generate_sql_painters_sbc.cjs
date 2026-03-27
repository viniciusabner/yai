
const fs = require('fs')
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

async function run() {
  try {
    const painters = JSON.parse(fs.readFileSync('painters_sao_bernardo.json', 'utf8'))

    let sql = `-- Inserção de Pintores em São Bernardo do Campo (Apenas Verificados)
-- Cidade ID: 63f5d4df-256d-4732-8e51-feffc5ef7a5f
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'pintor')
  OR slug LIKE '%-sao-bernardo'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'pintor')
  OR slug LIKE '%-sao-bernardo'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'pintor')
OR slug LIKE '%-sao-bernardo';

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
  'Serviços de pintura profissional em São Bernardo do Campo', 
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

    fs.writeFileSync('src/database/seeds/107_real_painters_sao_bernardo.sql', sql)
    console.log('SQL generated at src/database/seeds/107_real_painters_sao_bernardo.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
