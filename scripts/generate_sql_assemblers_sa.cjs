
const fs = require('fs')
const { createClient } = require('@supabase/supabase-js')
const dotenv = require('dotenv')

dotenv.config()

async function run() {
  try {
    const assemblers = JSON.parse(fs.readFileSync('furniture_assemblers_santo_andre.json', 'utf8'))

    let sql = `-- Inserção de Montadores de Móveis em Santo André (Apenas Verificados)
-- Cidade ID: (Buscado via Subquery ou 85b13d20-450b-4ce2-ad14-146a13738fd1)
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') 
    OR city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') 
    OR city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM providers 
WHERE (
  city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') 
  OR city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1'
) 
AND category = 'montador_moveis';

`

    assemblers.forEach(p => {
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
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  '${neighborhood}', 
  '${address}',
  '${p.whatsapp}', 
  '${p.phone}', 
  ${p.email ? `'${p.email}'` : 'NULL'}, 
  ${p.website ? `'${p.website}'` : 'NULL'}, 
  true, 
  '${slug}',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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

    fs.writeFileSync('src/database/seeds/113_real_furniture_assemblers_santo_andre.sql', sql)
    console.log('SQL generated at src/database/seeds/113_real_furniture_assemblers_santo_andre.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
