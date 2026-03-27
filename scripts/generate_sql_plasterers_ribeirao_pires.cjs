const fs = require('fs')

async function run() {
  try {
    const plasterers = JSON.parse(fs.readFileSync('plasterers_ribeirao_pires.json', 'utf8'))

    let sql = `-- Inserção de Gesseiros em Ribeirão Pires (Dados Reais)
-- Cidade: Ribeirão Pires
-- Categoria: Buscada via Subquery (Gesseiro / Drywall)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'gesseiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'gesseiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'gesseiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'gesseiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'gesseiro')
OR slug LIKE '%-ribeirao-pires' AND category = 'gesseiro';

`

    plasterers.forEach(p => {
      const name = p.name.replace(/'/g, "''")
      const address = p.address ? `'${p.address.replace(/'/g, "''")}'` : "'Ribeirão Pires, SP'"
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
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  ${neighborhood}, 
  ${address},
  ${p.whatsapp ? `'${p.whatsapp}'` : 'NULL'}, 
  ${p.phone ? `'${p.phone}'` : 'NULL'},
  ${p.email ? `'${p.email}'` : 'NULL'}, 
  ${p.website ? `'${p.website}'` : 'NULL'}, 
  true, 
  '${slug}',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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

    fs.writeFileSync('src/database/seeds/125_real_plasterers_ribeirao_pires.sql', sql)
    console.log('SQL generated at src/database/seeds/125_real_plasterers_ribeirao_pires.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
