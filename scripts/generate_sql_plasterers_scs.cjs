
const fs = require('fs')
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

async function run() {
  try {
    const plasterers = JSON.parse(fs.readFileSync('plasterers_sao_caetano.json', 'utf8'))

    let sql = `-- Inserção de Gesseiros em São Caetano do Sul (Dados Reais)
-- Cidade: São Caetano do Sul
-- Categoria: Buscada via Subquery (Gesseiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'gesseiro')
  OR slug LIKE '%-sao-caetano' AND category = 'gesseiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'gesseiro')
  OR slug LIKE '%-sao-caetano' AND category = 'gesseiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'gesseiro')
OR slug LIKE '%-sao-caetano' AND category = 'gesseiro';

`

    plasterers.forEach(p => {
      const name = p.name.replace(/'/g, "''")
      const address = p.address ? `'${p.address.replace(/'/g, "''")}'` : "'São Caetano do Sul, SP'"
      const neighborhood = p.neighborhood ? `'${p.neighborhood.replace(/'/g, "''")}'` : "'Centro'"
      const slug = p.slug

      sql += `
INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '${p.id}', 
  '${name}', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  ${neighborhood}, 
  ${address},
  '${p.whatsapp}', 
  '${p.phone}', 
  ${p.email ? `'${p.email}'` : 'NULL'}, 
  ${p.website ? `'${p.website}'` : 'NULL'}, 
  true, 
  '${slug}',
  'Serviços de gesso e drywall em São Caetano do Sul', 
  5.0, 
  'manual_google',
  '${p.created_at}'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;
`
    })

    fs.writeFileSync('src/database/seeds/122_real_plasterers_sao_caetano.sql', sql)
    console.log('SQL generated at src/database/seeds/122_real_plasterers_sao_caetano.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
