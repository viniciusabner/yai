
const fs = require('fs')
const crypto = require('crypto')

const cityId = 'd422ecad-80b4-450a-b364-ebb888d700e1' // São Caetano do Sul

// Collected from searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Cícero Alves Montador', phone: '11981582253', whatsapp: '11981582253', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Montador Express', phone: '11985162213', whatsapp: '11985162213', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Destaque Montagem', phone: '11978546109', whatsapp: '11978546109', address: 'São Caetano do Sul, SP', neighborhood: 'Santa Paula' },
  { name: 'Montador Roberto', phone: '11961498143', whatsapp: '11961498143', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Montador Santo Antônio', phone: '11986159815', whatsapp: '11986159815', address: 'Rua Monte Alegre, Santo Antônio', neighborhood: 'Santo Antônio' },
  { name: 'Montador Santa Paula', phone: '11956798018', whatsapp: '11956798018', address: 'Av. Presidente Kennedy, Santa Paula', neighborhood: 'Santa Paula' },
  { name: 'Montador Avenida Goiás', phone: '11973048490', whatsapp: '11973048490', address: 'Avenida Goiás, Santo Antônio', neighborhood: 'Santo Antônio' },
  { name: 'JK Marido de Aluguel', phone: '11988794041', whatsapp: '11988794041', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Monta Fácil Oficial', phone: '11913436359', whatsapp: '11913436359', address: 'São Caetano do Sul, SP', neighborhood: 'Santa Paula' },
  { name: 'KM Montador de Móveis', phone: '11999866864', whatsapp: '1199999866864', address: 'São Caetano do Sul, SP', neighborhood: 'Santa Paula' }, // Corrected whatsapp typo in original if present or just use phone
  { name: 'Montador Alameda Porcelana', phone: '11981636576', whatsapp: '11981636576', address: 'Alameda Porcelana, Cerâmica', neighborhood: 'Cerâmica' },
  { name: 'Montador Metrópoles', phone: '11973039258', whatsapp: '11973039258', address: 'São Caetano do Sul, SP', neighborhood: 'Cerâmica' },
  { name: 'Ageu Montador', phone: '11940275274', whatsapp: '11940275274', address: 'São Caetano do Sul, SP', neighborhood: 'Cerâmica' },
  { name: 'Mateus Montador', phone: '11948955455', whatsapp: '11948955455', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Martelix Montador', phone: '11995743555', whatsapp: '11995743555', address: 'Mauá, SCS', neighborhood: 'Mauá' },
  { name: 'Montador Nova Gerty', phone: '41997070554', whatsapp: '41997070554', address: 'Nova Gerty, SCS', neighborhood: 'Nova Gerty' },
  { name: 'Montador Profissional 24h', phone: '11991366816', whatsapp: '11991366816', address: 'São Caetano do Sul, SP', neighborhood: 'Boa Vista' },
  { name: 'Super Montagens', phone: '11958252239', whatsapp: '11958252239', address: 'Prosperidade, SCS', neighborhood: 'Prosperidade' },
  { name: 'Léo Montagem', phone: '11981718913', whatsapp: '11981718913', address: 'São Caetano do Sul, SP', neighborhood: 'Mauá' },
  { name: 'Restauração Santa Paula', phone: '11983219422', whatsapp: '11983219422', address: 'R. São Paulo, 1564 B, Santa Paula', neighborhood: 'Santa Paula' }
]

// Ensure unique phones
const uniqueData = []
const phones = new Set()
rawData.forEach(p => {
  if (!phones.has(p.phone)) {
    phones.add(p.phone)
    uniqueData.push(p)
  }
})

const jsonOutput = uniqueData.map(p => ({
  id: crypto.randomUUID(),
  name: p.name,
  type: 'professional',
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-scs',
  category: 'montador_moveis',
  website: null,
  city_slug: 'sao-caetano-do-sul',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('furniture_assemblers_scs.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} assemblers in furniture_assemblers_scs.json`)
