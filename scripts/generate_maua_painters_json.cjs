
const fs = require('fs')
const crypto = require('crypto')

const cityId = '6f15b756-1913-4ca0-81ea-5a82f11740a3' // Mauá

// Collected from previous searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Lci Pintura', phone: '1123914195', whatsapp: '11947793775', address: 'Av. Juscelino Kubitschek, 1455', neighborhood: 'Centro' },
  { name: 'JA Pinturas', phone: '11982282868', whatsapp: '11982282868', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Maxcolor Pinturas', phone: '11984910187', whatsapp: '11984900683', address: 'Rua Girassol, 246', neighborhood: 'Loteamento Industrial Coral' },
  { name: 'AJ Empreiteira', phone: '11977535336', whatsapp: '11977535336', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'A5web Pintor', phone: '17981002981', whatsapp: '17981002981', address: 'R. Manoel Pedro Júnior', neighborhood: 'Vila Bocaina' },
  { name: 'Visual Pinturas', phone: '11940361339', whatsapp: '11940361339', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Kolli Pinturas', phone: '11951774005', whatsapp: '11951774005', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'GOC Construtora', phone: '1141125560', whatsapp: '1141125560', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'GOK Construtora', phone: '11940098978', whatsapp: '11940098978', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Pinturas Residências', phone: '11981423084', whatsapp: '11981423084', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Domenico Funilaria e Pintura', phone: '1145142897', whatsapp: '1145142897', address: 'Rua João Pessoa, 45', neighborhood: 'Vila Bocaina' },
  { name: 'Funilaria e Pintura Versatt', phone: '1145555996', whatsapp: '1145555996', address: 'Rua Presidente Arthur da Costa e Silva, 35', neighborhood: 'Parque São Vicente' },
  { name: 'FL Pinturas', phone: '1123757818', whatsapp: '11972568271', address: 'Rua Antônio Viana de Freitas, s/n', neighborhood: 'Jardim Zaíra' },
  { name: 'Valter Marques Alves', phone: '1145452751', whatsapp: '1145452751', address: 'Avenida Saturnino João da Silva, 32', neighborhood: 'Jardim Zaíra' },
  { name: 'MP Pinturas', phone: '11947648448', whatsapp: '11947648448', address: 'R. Ricardo Mariano dos Santos, 146', neighborhood: 'Jardim Zaíra' },
  { name: 'Master Tintas', phone: '1134204840', whatsapp: '11994320478', address: 'Avenida Itapark, 4377', neighborhood: 'Vila Bocaina' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-maua',
  category: 'pintor',
  website: null,
  city_slug: 'maua',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('painters_maua.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} painters in painters_maua.json`)
