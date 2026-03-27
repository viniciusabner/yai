const fs = require('fs')

async function run() {
  try {
    const metalworkers = JSON.parse(fs.readFileSync('metalworkers_diadema.json', 'utf8'))

    let sql = `-- Inserção de Serralheiros (Estruturas Metálicas) em Diadema (Dados Reais)
-- Cidade: Diadema
-- Categoria: Buscada via Subquery (Serralheiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'serralheiro')
  OR slug LIKE '%-diadema' AND category = 'serralheiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'serralheiro')
  OR slug LIKE '%-diadema' AND category = 'serralheiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'serralheiro')
OR slug LIKE '%-diadema' AND category = 'serralheiro';

`

    metalworkers.forEach(p => {
      const name = p.name.replace(/'/g, "''")
      const address = p.address ? `'${p.address.replace(/'/g, "''")}'` : "'Diadema, SP'"
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
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  ${neighborhood}, 
  ${address},
  ${p.whatsapp ? `'${p.whatsapp}'` : 'NULL'}, 
  ${p.phone ? `'${p.phone}'` : 'NULL'},
  ${p.email ? `'${p.email}'` : 'NULL'}, 
  ${p.website ? `'${p.website}'` : 'NULL'}, 
  true, 
  '${slug}',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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

    fs.writeFileSync('src/database/seeds/144_real_metalworkers_diadema.sql', sql)
    console.log('SQL generated at src/database/seeds/144_real_metalworkers_diadema.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
