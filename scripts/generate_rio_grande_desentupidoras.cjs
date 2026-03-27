const fs = require('fs')
const crypto = require('crypto')

const cityId = crypto.randomUUID() // Only used for JSON, SQL uses subquery

const rawData = [
  // Web Searches - EXCLUSIVELY REAL DATA
  { name: 'Bio Soluções', phone: '1132110000', whatsapp: '1132110000', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora em RGS', phone: '11920597774', whatsapp: '11920597774', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Santec Desentupidora', phone: '11940007818', whatsapp: '11940007818', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Hidromix Desentupidora', phone: '1158194555', whatsapp: '1158194555', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Chamou Chegou', phone: '11952699160', whatsapp: '11952699160', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Local', phone: '1156689000', whatsapp: '1156689000', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Brasileira', phone: '1146372538', whatsapp: '1146372538', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Compasan', phone: '1151971503', whatsapp: '1151971503', address: 'Rio Grande da Serra, SP', neighborhood: 'Parque América' },
  { name: 'Ubaservice Desentupimento', phone: '12991697309', whatsapp: '12991697309', address: 'Rio Grande da Serra, SP', neighborhood: 'Vila São João' },
  { name: 'DeltaPrag RGS', phone: '1155222000', whatsapp: '11947275351', address: 'Rio Grande da Serra, SP', neighborhood: 'Parque América' },
  { name: 'Desentupidora Hidroleste RGS', phone: '11961652024', whatsapp: '11961652024', address: 'Rio Grande da Serra, SP', neighborhood: 'Parque América' },
  { name: 'Desentupidora RGS 24 Horas', phone: '11941822206', whatsapp: '11941822206', address: 'Rio Grande da Serra, SP', neighborhood: 'Parque América' },
  { name: 'Desentupidora Esgoto Limpo', phone: '1129921000', whatsapp: '1129921000', address: 'Rio Grande da Serra, SP', neighborhood: 'Recanto das Rosas' },
  { name: 'ON Desentupidora', phone: '11991166588', whatsapp: '11991166588', address: 'Rio Grande da Serra, SP', neighborhood: 'Recanto das Rosas' },
  { name: 'Ótima Desentupidora RGS', phone: '11978595935', whatsapp: '11978595935', address: 'Rio Grande da Serra, SP', neighborhood: 'Recanto das Rosas' },
  { name: 'Limpa Fossa RGS', phone: '1151989630', whatsapp: '1151989630', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Tecnojato', phone: '11961608000', whatsapp: '11961608000', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Sadesp Desentupidora', phone: '11970715000', whatsapp: '11970715000', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Resolve Já', phone: '11942917080', whatsapp: '11942917080', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-rio-grande-da-serra',
  category: 'desentupidora',
  website: p.website || null,
  city_slug: 'rio-grande-da-serra',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('desentupidoras_rio_grande_da_serra.json', JSON.stringify(jsonOutput, null, 2))

// Generate SQL
let sql = "-- Inserção de Desentupidoras (Saneamento) em Rio Grande da Serra (Dados Reais)\n" +
"-- Cidade: Rio Grande da Serra\n" +
"-- Categoria: Buscada via Subquery (Desentupidora)\n\n" +
"-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria\n" +
"DELETE FROM contact_events\n" +
"WHERE provider_id IN (\n" +
"  SELECT id FROM providers \n" +
"  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'desentupidora')\n" +
"  OR slug LIKE '%-rio-grande-da-serra' AND category = 'desentupidora'\n" +
");\n\n" +
"DELETE FROM conversations\n" +
"WHERE provider_id IN (\n" +
"  SELECT id FROM providers \n" +
"  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'desentupidora')\n" +
"  OR slug LIKE '%-rio-grande-da-serra' AND category = 'desentupidora'\n" +
");\n\n" +
"DELETE FROM providers \n" +
"WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'desentupidora')\n" +
"OR slug LIKE '%-rio-grande-da-serra' AND category = 'desentupidora';\n\n";

jsonOutput.forEach(p => {
  const name = p.name.replace(/'/g, "''")
  const address = p.address ? "'" + p.address.replace(/'/g, "''") + "'" : "'Rio Grande da Serra, SP'"
  const neighborhood = p.neighborhood ? "'" + p.neighborhood.replace(/'/g, "''") + "'" : "'Centro'"
  const slug = p.slug

  sql += "INSERT INTO providers (\n" +
    "  id, name, city_id, category_id, category, neighborhood, address, \n" +
    "  whatsapp, phone, email, website, active, slug, \n" +
    "  description, rating, source, created_at\n" +
    ") VALUES (\n" +
    "  '" + p.id + "', \n" +
    "  '" + name + "', \n" +
    "  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), \n" +
    "  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), \n" +
    "  'desentupidora', \n" +
    "  " + neighborhood + ", \n" +
    "  " + address + ",\n" +
    "  " + (p.whatsapp ? "'" + p.whatsapp + "'" : "NULL") + ", \n" +
    "  " + (p.phone ? "'" + p.phone + "'" : "NULL") + ",\n" +
    "  " + (p.email ? "'" + p.email + "'" : "NULL") + ", \n" +
    "  " + (p.website ? "'" + p.website + "'" : "NULL") + ", \n" +
    "  true, \n" +
    "  '" + slug + "',\n" +
    "  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', \n" +
    "  5.0, \n" +
    "  'manual_google',\n" +
    "  '" + p.created_at + "'\n" +
    ") ON CONFLICT (slug) DO UPDATE SET \n" +
    "  name = EXCLUDED.name,\n" +
    "  phone = EXCLUDED.phone,\n" +
    "  whatsapp = EXCLUDED.whatsapp,\n" +
    "  active = EXCLUDED.active,\n" +
    "  description = EXCLUDED.description,\n" +
    "  rating = EXCLUDED.rating,\n" +
    "  address = EXCLUDED.address,\n" +
    "  neighborhood = EXCLUDED.neighborhood;\n\n";
})

fs.writeFileSync('src/database/seeds/154_real_desentupidoras_rio_grande_da_serra.sql', sql)
console.log('JSON and SQL generated successfully.')
