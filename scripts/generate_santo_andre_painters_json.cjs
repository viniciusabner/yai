
const fs = require('fs')
const crypto = require('crypto')

const cityId = '85b13d20-450b-4ce2-ad14-146a13738fd1' // Santo André

// Collected from previous searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'JA Pinturas', phone: '11966601567', whatsapp: '11982282868', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'Atlanta Pinturas', phone: '11940824490', whatsapp: '11940824490', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'Stoc Pinturas', phone: '1141171349', whatsapp: '11978225539', address: 'Rua Visconde de Mauá, 509', neighborhood: 'Vila Pires' },
  { name: 'WellColor', phone: '11986124461', whatsapp: '11986124461', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'A&C Pinturas em Geral', phone: '1145457595', whatsapp: '1145457595', address: 'Rua Tucuruma, 35', neighborhood: 'Vila Scarpelli' },
  { name: 'Inove Reformas e Pinturas', phone: '11952226462', whatsapp: '11952226462', address: 'Rua Carijós, 1856', neighborhood: 'Vila Linda' },
  { name: 'F&F Pinturas', phone: '11947234399', whatsapp: '11947234399', address: 'Rua das Figueiras, 465', neighborhood: 'Jardim' },
  { name: 'LC Pinturas', phone: '11995055088', whatsapp: '11995055088', address: 'Rua Oratório, 1600', neighborhood: 'Parque das Nações' },
  { name: 'Mogi Paint', phone: '11947225134', whatsapp: '11947225134', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'Pintura & Cia', phone: '11981559865', whatsapp: '11981559865', address: 'Rua Coronel Oliveira Lima, 45', neighborhood: 'Centro' },
  { name: 'ABC Pinturas', phone: '1149909999', whatsapp: '11999991111', address: 'Av. Portugal, 100', neighborhood: 'Centro' }, // Removed verified but suspicious generic number if unverified
  { name: 'Santo André Cores', phone: '1144365555', whatsapp: '11988882222', address: 'Rua General Glicério, 200', neighborhood: 'Centro' } // Removed verified but suspicious
]

// Filter out suspicious ones manually or ensure distinct real ones.
// The list above has some generics. Let's use the explicit ones from the file I read and filter.

// Refined list based on the JSON view earlier:
const verifiedData = [
  { name: 'JA Pinturas', phone: '11966601567', whatsapp: '11982282868', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'Atlanta Pinturas', phone: '11940824490', whatsapp: '11940824490', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'Stoc Pinturas', phone: '1141171349', whatsapp: '11978225539', address: 'Rua Visconde de Mauá, 509', neighborhood: 'Vila Pires' },
  { name: 'WellColor', phone: '11986124461', whatsapp: '11986124461', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'A&C Pinturas em Geral', phone: '1145457595', whatsapp: '1145457595', address: 'Rua Tucuruma, 35', neighborhood: 'Vila Scarpelli' },
  { name: 'Inove Reformas e Pinturas', phone: '11952226462', whatsapp: '11952226462', address: 'Rua Carijós, 1856', neighborhood: 'Vila Linda' },
  { name: 'F&F Pinturas', phone: '11947234399', whatsapp: '11947234399', address: 'Rua das Figueiras, 465', neighborhood: 'Jardim' },
  { name: 'LC Pinturas', phone: '11995055088', whatsapp: '11995055088', address: 'Rua Oratório, 1600', neighborhood: 'Parque das Nações' },
  { name: 'Mogi Paint', phone: '11947225134', whatsapp: '11947225134', address: 'Santo André, SP', neighborhood: 'Santo André' },
  { name: 'Pintura & Cia', phone: '11981559865', whatsapp: '11981559865', address: 'Rua Coronel Oliveira Lima, 45', neighborhood: 'Centro' },
  { name: 'Start Pinturas', phone: '11932312077', whatsapp: '11932312077', address: 'Santo André, SP', neighborhood: 'Jardim' },
  { name: 'Alpha Pinturas', phone: '11987654321', whatsapp: '11987654321', address: 'Rua das Monções, 50', neighborhood: 'Jardim' }, // Placeholder-like? 123456789. Removing.
  { name: 'Pintor Bairro Jardim', phone: '11998877665', whatsapp: '11998877665', address: 'Bairro Jardim, Santo André', neighborhood: 'Jardim' } // Placeholder-like? Removing.
]

const finalData = [
   { name: 'JA Pinturas', phone: '11966601567', whatsapp: '11982282868', address: 'Santo André, SP', neighborhood: 'Santo André' },
   { name: 'Atlanta Pinturas', phone: '11940824490', whatsapp: '11940824490', address: 'Santo André, SP', neighborhood: 'Santo André' },
   { name: 'Stoc Pinturas', phone: '1141171349', whatsapp: '11978225539', address: 'Rua Visconde de Mauá, 509', neighborhood: 'Vila Pires' },
   { name: 'WellColor', phone: '11986124461', whatsapp: '11986124461', address: 'Santo André, SP', neighborhood: 'Santo André' },
   { name: 'A&C Pinturas em Geral', phone: '1145457595', whatsapp: '1145457595', address: 'Rua Tucuruma, 35', neighborhood: 'Vila Scarpelli' },
   { name: 'Inove Reformas e Pinturas', phone: '11952226462', whatsapp: '11952226462', address: 'Rua Carijós, 1856', neighborhood: 'Vila Linda' },
   { name: 'F&F Pinturas', phone: '11947234399', whatsapp: '11947234399', address: 'Rua das Figueiras, 465', neighborhood: 'Jardim' },
   { name: 'LC Pinturas', phone: '11995055088', whatsapp: '11995055088', address: 'Rua Oratório, 1600', neighborhood: 'Parque das Nações' },
   { name: 'Mogi Paint', phone: '11947225134', whatsapp: '11947225134', address: 'Santo André, SP', neighborhood: 'Santo André' },
   { name: 'Pintura & Cia', phone: '11981559865', whatsapp: '11981559865', address: 'Rua Coronel Oliveira Lima, 45', neighborhood: 'Centro' },
   { name: 'Start Pinturas', phone: '11932312077', whatsapp: '11932312077', address: 'Santo André, SP', neighborhood: 'Jardim' }
]


const jsonOutput = finalData.map(p => ({
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
  created_at: new Date().toISOString(),
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-santo-andre',
  category: 'pintor',
  website: null,
  city_slug: 'santo-andre',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('painters_santo_andre.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} painters in painters_santo_andre.json`)
