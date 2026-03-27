const fs = require('fs')
const crypto = require('crypto')

const cityId = '5ec9188e-e260-4cd9-ae8a-aff191c95bbd' // Placeholder for Santo Andre City ID

const rawData = [
  // Web Searches and valid previous seeds
  { name: 'Casa dos Vidros', phone: '1144282840', whatsapp: '1144282840', address: 'Av. Novo Horizonte, 117', neighborhood: 'Sacadura Cabral' },
  { name: 'ABC Central Vidros', phone: '1128965818', whatsapp: '11997429497', address: 'Av. D. Pedro I, 1864', neighborhood: 'Vila Pires' },
  { name: 'Safira Vidraçaria', phone: '11992224129', whatsapp: '11992224129', address: 'Santo André - SP', neighborhood: 'Jardim Santo André' },
  { name: 'Efraim Vidraçaria', phone: '11994269658', whatsapp: '11994269658', address: 'Santo André - SP', neighborhood: 'Vila Curuçá' },
  { name: 'Vidraçaria Santo André', phone: '11932204397', whatsapp: '11932204397', address: 'Santo André - SP', neighborhood: 'Jardim Utinga' },
  { name: 'ABC Vidro Max', phone: '1149961010', whatsapp: '11952039617', address: 'Santo André - SP', neighborhood: 'Centro' },
  { name: 'Abcd Vidraçaria', phone: '1142213334', whatsapp: '1142213334', address: 'Santo André - SP', neighborhood: 'Centro' },
  { name: 'Alfab Esquadrias de Alumínio e Vidro', phone: '1144575711', whatsapp: '1144575711', address: 'Santo André - SP', neighborhood: 'Centro' },
  { name: 'Alliance Vidros', phone: '1144224477', whatsapp: '1144224477', address: 'R. Tuiuti, 99', neighborhood: 'Jardim Bela Vista' },
  { name: 'Vidraçaria Paiva', phone: '11960133622', whatsapp: '11960133622', address: 'Santo André - SP', neighborhood: 'Centro' },
  { name: 'Cristal Line Vidros', phone: '1149921616', whatsapp: '11994892434', address: 'Rua José Lins do Rego, 307', neighborhood: 'Vila Valparaíso' },
  { name: 'MAX VIDROS', phone: '1144511255', whatsapp: '1144511255', address: 'Av. Dom Pedro I, 3713', neighborhood: 'Vila Luzita' },
  { name: 'Vidraçaria Decorama', phone: '1144728955', whatsapp: '1144728955', address: 'Av. Brasil, 534', neighborhood: 'Parque das Nações' },
  { name: 'Vidraçaria Gênesis', phone: '1144754439', whatsapp: '1144754439', address: 'Av. Martim Francisco, 1374', neighborhood: 'Jardim Utinga' },
  { name: 'J & G Vidros e Cristais', phone: '1149973487', whatsapp: '1149973487', address: 'Avenida Utinga, 367', neighborhood: 'Utinga' },
  { name: 'VERELUX INDÚSTRIA E COMÉRCIO DE VIDROS', phone: '1144633800', whatsapp: '1144633800', address: 'R. dos Coqueiros, 144', neighborhood: 'Campestre' },
  { name: 'Auto Vidros Jair', phone: '1144539932', whatsapp: '1144535858', address: 'R. Carijós, 560', neighborhood: 'Vila Alzira' },
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('9999') || rawNumber.includes('8888') || rawNumber.includes('7777') || rawNumber.includes('6666')) return false;
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
  type: 'company',
  city_id: cityId,
  category_id: null,
  neighborhood: p.neighborhood,
  address: p.address,
  whatsapp: p.whatsapp ? p.whatsapp.replace(/\D/g, '') : null,
  phone: p.phone ? p.phone.replace(/\D/g, '') : null,
  email: null,
  source: 'manual_google',
  active: true,
  created_at: new Date('2026-02-13T12:00:00').toISOString(),
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-santo-andre',
  category: 'vidraceiro',
  website: null,
  city_slug: 'santo-andre',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('glaziers_santo_andre.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} glaziers in glaziers_santo_andre.json`)
