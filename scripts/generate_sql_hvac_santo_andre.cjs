const fs = require('fs')

async function run() {
  try {
    const hvacs = JSON.parse(fs.readFileSync('hvac_santo_andre.json', 'utf8'))

    let sql = `-- Inserção de Técnicos em Ar Condicionado em Santo André (Dados Reais)
-- Cidade: Santo André
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-santo-andre' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-santo-andre' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-santo-andre' AND category = 'tecnico_ar_condicionado';

`

    hvacs.forEach(p => {
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
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  ${neighborhood}, 
  ${address},
  ${p.whatsapp ? `'${p.whatsapp}'` : 'NULL'}, 
  ${p.phone ? `'${p.phone}'` : 'NULL'},
  ${p.email ? `'${p.email}'` : 'NULL'}, 
  ${p.website ? `'${p.website}'` : 'NULL'}, 
  true, 
  '${slug}',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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

    fs.writeFileSync('src/database/seeds/134_real_hvac_santo_andre.sql', sql)
    console.log('SQL generated at src/database/seeds/134_real_hvac_santo_andre.sql')

  } catch (err) {
    console.error('Error:', err)
  }
}

run()
