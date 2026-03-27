const fs = require('fs')
const crypto = require('crypto')

const cityId = 'bb65710d-7049-43c7-9519-72fd7a2d6771' // Placeholder, sql uses subquery

const rawData = [
  // From 64_diadema_plasterer.sql and Web Searches
  { name: 'Valmar Gesso', phone: '1140543608', whatsapp: '11976837157', address: 'Rua Manoel da Nóbrega, 1250', neighborhood: 'Centro' },
  { name: 'Diagessos', phone: '11952282686', whatsapp: '11945887841', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Gesso Félix', phone: '1140482151', whatsapp: '1140482151', address: 'Av. Sete de Setembro, 117', neighborhood: 'Centro' },
  { name: 'Art Centro Divisórias', phone: '1140445212', whatsapp: '1140445212', address: 'Rua José Bonifácio, 1974', neighborhood: 'Serraria' },
  { name: 'Art Gil Divisórias e Forros', phone: '1123753735', whatsapp: '1123753735', address: 'Avenida Fagundes de Oliveira, 827', neighborhood: 'Piraporinha' },
  { name: 'Divinil Divisórias', phone: '1140919951', whatsapp: '1140919951', address: 'Rua Baependy, 630', neighborhood: 'Campanário' },
  { name: 'Engemetal Montagens', phone: '1140754960', whatsapp: '1140754960', address: 'Rua Pedro Paulo Celestino, 155', neighborhood: 'Piraporinha' },
  { name: 'Gesso Marília', phone: '1140552525', whatsapp: null, address: 'Avenida Maria Leonor, 203', neighborhood: 'Centro' },
  { name: 'JR Gesso Santana', phone: '1123751069', whatsapp: '11953288775', address: 'R. Dona Maria Leite, 291', neighborhood: 'Vila Nogueira' },
  { name: 'GOC Construtora (Gesso)', phone: '1141125560', whatsapp: '1141125560', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: '2M Divisórias e Drywall', phone: '1122622011', whatsapp: '11996358886', address: 'Diadema, SP', neighborhood: 'Centro' },
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-diadema',
  category: 'gesseiro',
  website: null,
  city_slug: 'diadema',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('plasterers_diadema.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} plasterers in plasterers_diadema.json`)
