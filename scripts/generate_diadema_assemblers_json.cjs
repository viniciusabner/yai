
const fs = require('fs')
const crypto = require('crypto')

const cityId = '205e475f-44aa-418f-8835-434cd5e913d2' // Diadema

// Collected from searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Montador Express', phone: '11985162213', whatsapp: '11985162213', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Montador Diadema Zap', phone: '19997570064', whatsapp: '19997570064', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Cícero Online Montador', phone: '11986709949', whatsapp: '11986709949', address: 'Canhema, Diadema', neighborhood: 'Canhema' },
  { name: 'Monta Fácil Oficial', phone: '11913436359', whatsapp: '11913436359', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Montador Diadema WhatsApp', phone: '11959215823', whatsapp: '11959215823', address: 'Diadema, SP', neighborhood: 'Piraporinha' },
  { name: 'Montador de Móveis Diadema', phone: '11986159815', whatsapp: '11986159815', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Daniel Os Verificados', phone: '31996902316', whatsapp: '31996902316', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Montador Profissional Diadema', phone: '11933136019', whatsapp: '11933136019', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Montador Vila Nogueira', phone: '11937253650', whatsapp: '11937253650', address: 'Av. Piraporinha, Vila Nogueira', neighborhood: 'Vila Nogueira' },
  { name: 'POM Diadema', phone: '11946244090', whatsapp: '11946244090', address: 'Diadema, SP', neighborhood: 'Vila Nogueira' },
  { name: 'Montador Serraria', phone: '11973048490', whatsapp: '11973048490', address: 'Serraria, Diadema', neighborhood: 'Serraria' },
  { name: 'Alves Montador', phone: '11981582253', whatsapp: '11981582253', address: 'Eldorado, Diadema', neighborhood: 'Eldorado' },
  { name: 'Carlos Alberto ABC', phone: '11967730798', whatsapp: '11967730798', address: 'Canhema, Diadema', neighborhood: 'Canhema' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-diadema',
  category: 'montador_moveis',
  website: null,
  city_slug: 'diadema',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('furniture_assemblers_diadema.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} assemblers in furniture_assemblers_diadema.json`)
