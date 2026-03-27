
const fs = require('fs')
const crypto = require('crypto')

const cityId = '63f5d4df-256d-4732-8e51-feffc5ef7a5f' // São Bernardo do Campo

// Collected from searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Montador Express', phone: '11985162213', whatsapp: '11985162213', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Devanildo Santos Silva', phone: '11968890881', whatsapp: '11968890881', address: 'Vila São Pedro, SBC', neighborhood: 'Vila São Pedro' },
  { name: 'Montador de Móveis Roberto', phone: '11961498143', whatsapp: '11961498143', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'POM Brasil - Gabriel', phone: '11945042992', whatsapp: '11945042992', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Montador Metrópoles', phone: '11973039258', whatsapp: '11973039258', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Montador Alves Dias', phone: '11956798018', whatsapp: '11956798018', address: 'Av. Humberto A. Castelo Branco', neighborhood: 'Alves Dias' },
  { name: 'Montador 24 Horas', phone: '11991368160', whatsapp: '11991368160', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Super Montagens', phone: '11958252239', whatsapp: '11958252239', address: 'Rudge Ramos, SBC', neighborhood: 'Rudge Ramos' },
  { name: 'Montador Rudge Ramos', phone: '11986159815', whatsapp: '11986159815', address: 'Rua Harmonia, Rudge Ramos', neighborhood: 'Rudge Ramos' },
  { name: 'Freitas Montador', phone: '11949090024', whatsapp: '11949090024', address: 'São Bernardo do Campo, SP', neighborhood: 'Rudge Ramos' },
  { name: 'Montador Vila Baeta', phone: '11942906615', whatsapp: '11942906615', address: 'Vila Baeta Neves, SBC', neighborhood: 'Baeta Neves' },
  { name: 'Alves Montador', phone: '11981582253', whatsapp: '11981582253', address: 'São Bernardo do Campo, SP', neighborhood: 'Alves Dias' },
  { name: 'Montador de Móveis Paulista', phone: '11981636576', whatsapp: '11981636576', address: 'Taboão, SBC', neighborhood: 'Taboão' },
  { name: 'Montagem Top Planalto', phone: '11979715469', whatsapp: '11979715469', address: 'R. Oragnof, 60, Vila Jupiter', neighborhood: 'Planalto' },
  { name: 'Jossivan Montador', phone: '11996591707', whatsapp: '11996591707', address: 'Planalto, SBC', neighborhood: 'Planalto' },
  { name: 'POM NET', phone: '11984423676', whatsapp: '11984423676', address: 'São Bernardo do Campo, SP', neighborhood: 'Ferrazópolis' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-sbc',
  category: 'montador_moveis',
  website: null,
  city_slug: 'sao-bernardo-do-campo',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('furniture_assemblers_sbc.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} assemblers in furniture_assemblers_sbc.json`)
