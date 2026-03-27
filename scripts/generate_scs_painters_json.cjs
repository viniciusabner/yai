
const fs = require('fs')
const crypto = require('crypto')

const cityId = 'd422ecad-80b4-450a-b364-ebb888d700e1' // São Caetano do Sul

// Collected from previous searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Lci Pintura', phone: '1123914195', whatsapp: '11947793775', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Atlanta Pinturas', phone: '11940824490', whatsapp: '11940824490', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'JA Pinturas', phone: '11982282868', whatsapp: '11982282868', address: 'São Caetano do Sul, SP', neighborhood: 'Cerâmica' },
  { name: 'Nacional Cores', phone: '11990096403', whatsapp: '11990096403', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Kolli Pinturas', phone: '11951774005', whatsapp: '11951774005', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Grupo Viana', phone: '11939561754', whatsapp: '11939561754', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Athenaz Pinturas', phone: '11983263456', whatsapp: '11983263456', address: 'Rua Julieta Soares, s/n', neighborhood: 'Santa Paula' },
  { name: 'Color House Pinturas', phone: '11980675510', whatsapp: '11980675510', address: 'São Caetano do Sul, SP', neighborhood: 'Cerâmica' }
]

const jsonOutput = rawData.map(p => ({
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-sao-caetano',
  category: 'pintor',
  website: null,
  city_slug: 'sao-caetano-do-sul',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('painters_sao_caetano.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} painters in painters_sao_caetano.json`)
