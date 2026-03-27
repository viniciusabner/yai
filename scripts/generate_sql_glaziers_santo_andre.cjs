const fs = require('fs')

async function run() {
  try {
    const glaziers = JSON.parse(fs.readFileSync('glaziers_santo_andre.json', 'utf8'))

    let sql = `-- Inserção de Vidraceiros em Santo André (Dados Reais)
-- Cidade: Santo André
-- Categoria: Buscada via Subquery (Vidraceiro / Box)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'vidraceiro')
  OR slug LIKE '%-santo-andre' AND category = 'vidraceiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'vidraceiro')
  OR slug LIKE '%-santo-andre' AND category = 'vidraceiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'vidraceiro')
OR slug LIKE '%-santo-andre' AND category = 'vidraceiro';

`

    glaziers.forEach(p => {
      const name = p.name.replace(/'/g, "''")
      const address = p.address ? `'${p.address.replace(/'/g, "''")}'` : "'Santo André, SP'"
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
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  ${neighborhood}, 
  ${address},
  ${p.whatsapp ? `'${p.whatsapp}'` : 'NULL'}, 
  ${p.phone ? `'${p.phone}'` : 'NULL'},
  ${p.email ? `'${p.email}'` : 'NULL'}, 
  ${p.website ? `'${p.website}'` : 'NULL'}, 
  true, 
  '${slug}',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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

    fs.writeFileSync('src/database/seeds/127_real_glaziers_santo_andre.sql', sql)
    console.log('SQL generated at src/database/seeds/127_real_glaziers_santo_andre.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
