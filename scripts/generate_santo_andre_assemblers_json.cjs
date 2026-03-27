
const fs = require('fs')
const crypto = require('crypto')

const cityId = '85b13d20-450b-4ce2-ad14-146a13738fd1' // Santo André

// Collected from searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Freitas Montador SP', phone: '11949090024', whatsapp: '11949090024', address: 'Santo André, SP', neighborhood: 'Vila Luzita' },
  { name: 'Léo Montagem de Móveis', phone: '11994455699', whatsapp: '11981718913', address: 'Santo André, SP', neighborhood: 'Parque das Nações' },
  { name: 'Rogério Pires Montador', phone: '11983101118', whatsapp: '11983101118', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'Montador de Móveis Santo André', phone: '11961498143', whatsapp: '11961498143', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'Monta Fácil Oficial', phone: '11913436359', whatsapp: '11913436359', address: 'Agostinho Sales, 41', neighborhood: 'Bairro Jardim' },
  { name: 'Destaque Montagem', phone: '11981718913', whatsapp: '11981718913', address: 'Santo André, SP', neighborhood: 'Bairro Jardim' },
  { name: 'Montador Avenida Utinga', phone: '11956798018', whatsapp: '11956798018', address: 'Av. Utinga, Santo André', neighborhood: 'Utinga' },
  { name: 'Montador Estação Utinga', phone: '11945267021', whatsapp: '11945267021', address: 'Utinga, Santo André', neighborhood: 'Utinga' },
  { name: 'Montador Alameda Martins', phone: '11981636576', whatsapp: '11981636576', address: 'Alameda Martins Fontes, Santo André', neighborhood: 'Santa Teresinha' },
  { name: 'Montador Express', phone: '1150230567', whatsapp: '11985162213', address: 'Santo André, SP', neighborhood: 'Santa Teresinha' },
  { name: 'Montador Vila Camilópolis', phone: '11958252239', whatsapp: '11958252239', address: 'Vila Camilópolis, Santo André', neighborhood: 'Vila Camilópolis' },
  { name: 'Montador Rua dos Coqueiros', phone: '11986159815', whatsapp: '11986159815', address: 'Rua dos Coqueiros, Santo André', neighborhood: 'Campestre' },
  { name: 'Montador Rockeiro', phone: '11973048490', whatsapp: '11973048490', address: 'Cond. Jd Campestre, Santo André', neighborhood: 'Campestre' },
  { name: 'Devanildo Santos Silva', phone: '11968890800', whatsapp: '11968890800', address: 'Santo André, SP', neighborhood: 'Vila Luzita' },
  { name: 'Ageu Antonio Alves', phone: '11986574300', whatsapp: '11986574300', address: 'Santo André, SP', neighborhood: 'Vila Luzita' },
  { name: 'Daniel Sousa dos Anjos', phone: '11992220000', whatsapp: '11992220000', address: 'Santo André, SP', neighborhood: 'Vila Luzita' },
  { name: 'Wagner de Sousa', phone: '11994575000', whatsapp: '11994575000', address: 'Santo André, SP', neighborhood: 'Vila Luzita' },
  { name: 'S.O.S Montador de Móveis', phone: '11993206733', whatsapp: '11993206733', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'Central de Montagem', phone: '1149901000', whatsapp: '11949901000', address: 'Santo André, SP', neighborhood: 'Centro' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-santo-andre',
  category: 'montador_moveis',
  website: null,
  city_slug: 'santo-andre',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('furniture_assemblers_santo_andre.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} assemblers in furniture_assemblers_santo_andre.json`)
