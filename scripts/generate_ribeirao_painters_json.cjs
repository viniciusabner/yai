
const fs = require('fs')
const crypto = require('crypto')

const cityId = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' // Ribeirão Pires

// Collected from previous searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Visual Pinturas', phone: '11940361339', whatsapp: '11940361339', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Atlanta Pinturas', phone: '11940824490', whatsapp: '11940824490', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'HTL Brasil', phone: '1141237237', whatsapp: '11972016079', address: 'Rodovia Índio Tibiriçá, 2425', neighborhood: 'Ouro Fino Paulista' },
  { name: 'Nacional Cores', phone: '11990096403', whatsapp: '11990096403', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'JK Marido de Aluguel', phone: '11988794041', whatsapp: '11988794041', address: 'Ribeirão Pires, SP', neighborhood: 'Ouro Fino Paulista' },
  { name: 'André Pinturas', phone: '11958093106', whatsapp: '11958093106', address: 'R. Circular, 25', neighborhood: 'Santa Luzia' },
  { name: 'Pintor Jardim Caçula', phone: '1148251737', whatsapp: '1148251737', address: 'Rua Álvares de Azevedo, 141', neighborhood: 'Jardim Caçula' },
  { name: 'Decor Colors Ribeirão', phone: '11978913983', whatsapp: '11978913983', address: 'Av. Francisco Monteiro, 398', neighborhood: 'Centro' },
  { name: 'JA Pinturas', phone: '11982282868', whatsapp: '11982282868', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Lci Pintura', phone: '1123914195', whatsapp: '11947793775', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Kolli Pinturas', phone: '11951774005', whatsapp: '11951774005', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'GOC Construtora', phone: '1141125560', whatsapp: '1141125560', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Pintor Quarta Divisão', phone: '11988794042', whatsapp: '11988794042', address: 'Quarta Divisão, Ribeirão Pires', neighborhood: 'Quarta Divisão' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-ribeirao-pires',
  category: 'pintor',
  website: null,
  city_slug: 'ribeirao-pires',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('painters_ribeirao_pires.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} painters in painters_ribeirao_pires.json`)
