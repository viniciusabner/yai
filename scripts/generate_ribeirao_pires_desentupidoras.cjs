const fs = require('fs')
const crypto = require('crypto')

const cityId = 'cc0d49f1-a128-4ad4-991f-0cf3a1a9e7a8' // Ribeirão Pires City ID

const rawData = [
  // Web Searches - EXCLUSIVELY REAL DATA
  { name: 'Desentupidora Mais Ribeirão Pires', phone: '11920597774', whatsapp: '11920597774', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'JBC Desentupidora', phone: '11968358991', whatsapp: '11968358991', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Rei do Esgoto Ribeirão Pires', phone: '11944699801', whatsapp: '11961652024', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Ribeirão Pires 24h', phone: '1138673710', whatsapp: '1138673710', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Cidade Desentupimento', phone: '11946699263', whatsapp: '11946699263', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora SP Ribeirão Pires', phone: '11947437000', whatsapp: '11947437000', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora RP Centro', phone: '11940007818', whatsapp: '11940007818', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Super Limp Desentupidora', phone: '11930710937', whatsapp: '11930710937', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Brasileira', phone: '1146372538', whatsapp: '1146372538', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Guardião Ouro Fino', phone: '1129127893', whatsapp: '1129127893', address: 'Ribeirão Pires, SP', neighborhood: 'Ouro Fino Paulista' },
  { name: 'Desentupidora Ouro Fino RP', phone: '11941822206', whatsapp: '11941822206', address: 'Ribeirão Pires, SP', neighborhood: 'Ouro Fino Paulista' },
  { name: 'Ótima Desentupidora', phone: '11978595935', whatsapp: '11978595935', address: 'Ribeirão Pires, SP', neighborhood: 'Quarta Divisão' },
  { name: 'Nova Capital Desentupidora Soma', phone: '11945030569', whatsapp: '11945030569', address: 'Ribeirão Pires, SP', neighborhood: 'Soma' },
  { name: 'Limpa Fossa Ribeirão Pires', phone: '1151973900', whatsapp: '1151973900', address: 'Ribeirão Pires, SP', neighborhood: 'Jardim Ribeirão Pires' },
  { name: 'Desentupidora Rei dos Reis RP', phone: '11948470437', whatsapp: '11948470437', address: 'Ribeirão Pires, SP', neighborhood: 'Jardim Ribeirão Pires' }
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('99999999') || rawNumber.includes('888888') || rawNumber.includes('0000000') || rawNumber.includes('0800') || rawNumber.includes('40037635')) return false;
    return true;
});

// Deduplicate by phone
const uniqueData = []
const seen = new Set()
validData.forEach(item => {
  const key1 = item.phone ? item.phone.replace(/\D/g, '') : null;
  const key2 = item.whatsapp ? item.whatsapp.replace(/\D/g, '') : null;
  
  if ((key1 && seen.has(key1)) || (key2 && seen.has(key2))) {
      return; 
  }

  if (key1) seen.add(key1);
  if (key2) seen.add(key2);
  
  uniqueData.push(item)
})

const jsonOutput = uniqueData.map(p => ({
  id: crypto.randomUUID(),
  name: p.name,
  type: null,
  city_id: cityId,
  category_id: null,
  neighborhood: p.neighborhood,
  address: p.address,
  whatsapp: p.whatsapp ? p.whatsapp.replace(/\D/g, '') : null,
  phone: p.phone ? p.phone.replace(/\D/g, '') : null,
  email: p.email || null,
  source: 'manual_google',
  active: true,
  created_at: new Date('2026-02-13T12:00:00').toISOString(),
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-ribeirao-pires',
  category: 'desentupidora',
  website: p.website || null,
  city_slug: 'ribeirao-pires',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('desentupidoras_ribeirao_pires.json', JSON.stringify(jsonOutput, null, 2))

// Generate SQL
let sql = `-- Inserção de Desentupidoras (Saneamento) em Ribeirão Pires (Dados Reais)
-- Cidade: Ribeirão Pires
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'desentupidora')
  OR slug LIKE '%-ribeirao-pires' AND category = 'desentupidora'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'desentupidora')
  OR slug LIKE '%-ribeirao-pires' AND category = 'desentupidora'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'desentupidora')
OR slug LIKE '%-ribeirao-pires' AND category = 'desentupidora';

`

jsonOutput.forEach(p => {
  const name = p.name.replace(/'/g, "''")
  const address = p.address ? "'" + p.address.replace(/'/g, "''") + "'" : "'Ribeirão Pires, SP'"
  const neighborhood = p.neighborhood ? "'" + p.neighborhood.replace(/'/g, "''") + "'" : "'Centro'"
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
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  ${neighborhood}, 
  ${address},
  ${p.whatsapp ? "'" + p.whatsapp + "'" : "NULL"}, 
  ${p.phone ? "'" + p.phone + "'" : "NULL"},
  ${p.email ? "'" + p.email + "'" : "NULL"}, 
  ${p.website ? "'" + p.website + "'" : "NULL"}, 
  true, 
  '${slug}',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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

fs.writeFileSync('src/database/seeds/153_real_desentupidoras_ribeirao_pires.sql', sql)
console.log('JSON and SQL generated successfully.')
