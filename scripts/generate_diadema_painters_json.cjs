
const fs = require('fs')
const crypto = require('crypto')

const cityId = '205e475f-44aa-418f-8835-434cd5e913d2' // Diadema

// Collected from previous searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'J.A Pinturas e Reformas', phone: '11982282868', whatsapp: '11982282868', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Atlanta Pinturas', phone: '11940824490', whatsapp: '11940824490', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'HTL Brasil', phone: '1141237237', whatsapp: '11972016079', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'A5web Pintor', phone: '17981002981', whatsapp: '17981002981', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'A S Grafiato', phone: '1140913576', whatsapp: '1140913576', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Hml Pinturas', phone: '1140590467', whatsapp: '1140590467', address: 'Rua Caranguejo, 129', neighborhood: 'Eldorado' },
  { name: 'Kadi Pinturas', phone: '1140911077', whatsapp: '1140911077', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Luizão Pintor', phone: '1140752014', whatsapp: '1140752014', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Marcos Pinturas', phone: '1140771082', whatsapp: '1140771082', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Martins Serviço de Pinturas', phone: '1140591504', whatsapp: '1140591504', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'MRP Reformas', phone: '1134124053', whatsapp: '1134124053', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Pinturas Fortaleza', phone: '1140772446', whatsapp: '1140772446', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'RFY Pinturas', phone: '1140919880', whatsapp: '1140919880', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'SS Pintura', phone: '1140714833', whatsapp: '1140714833', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Tupi Limpeza e Pintura', phone: '1140753368', whatsapp: '1140753368', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'GBL Pinturas Eletrostáticas', phone: '11932312077', whatsapp: '11932312077', address: 'Diadema, SP', neighborhood: 'Piraporinha' },
  { name: 'Pintor Piraporinha', phone: '1123752486', whatsapp: '1123752486', address: 'Rua Frei Caneca, 53', neighborhood: 'Piraporinha' },
  { name: 'A Casa da Pintura', phone: '1125966666', whatsapp: '1125966666', address: 'Avenida Piraporinha, 1111', neighborhood: 'Piraporinha' },
  { name: 'Colore Technical Parts', phone: '1140445083', whatsapp: '1140445083', address: 'Av. Piraporinha, 246', neighborhood: 'Piraporinha' },
  { name: 'KJ Pinturas', phone: '1184706097', whatsapp: '1184706097', address: 'Rua 13', neighborhood: 'Eldorado' },
  { name: 'Uenderson Souza', phone: '1140493019', whatsapp: '1140493019', address: 'Rua Camarupim, 184', neighborhood: 'Eldorado' },
  { name: 'Pablo Miguel Silva', phone: '1144050665', whatsapp: '1144050665', address: 'Rua Cachalote, 358', neighborhood: 'Eldorado' },
  { name: 'Color House Pinturas', phone: '11980675510', whatsapp: '11980675510', address: 'Diadema, SP', neighborhood: 'Canhema' },
  { name: 'Pintor Centro', phone: '1135930724', whatsapp: '1135930724', address: 'Rua Orense, 41', neighborhood: 'Centro' },
  { name: 'Equipe Cesar', phone: '11992495177', whatsapp: '11992495177', address: 'Diadema, SP', neighborhood: 'Centro' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-diadema',
  category: 'pintor',
  website: null,
  city_slug: 'diadema',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('painters_diadema.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} painters in painters_diadema.json`)
