
const fs = require('fs')
const crypto = require('crypto')

const rawData = [
  { name: 'Montador de Móveis Mauá', phone: '11961498143', whatsapp: '11961498143', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Águia Montagem', phone: '11981718913', whatsapp: '11981718913', address: 'Mauá, SP', neighborhood: 'Vila Bocaina' },
  { name: 'Rodrigo Pires Montador', phone: '11983119179', whatsapp: '11983119179', address: 'Mauá, SP', neighborhood: 'Parque São Vicente' },
  { name: 'POM Mauá', phone: '11984661136', whatsapp: '11984661136', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Metrópoles Montador', phone: '11945267021', whatsapp: '11945267021', address: 'Mauá, SP', neighborhood: 'Guapituba' },
  { name: 'Freitas Montador', phone: '11949090024', whatsapp: '11949090024', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Martelix Mauá', phone: '11995743555', whatsapp: '11995743555', address: 'Mauá, SP', neighborhood: 'Parque São Vicente' },
  { name: 'Cícero Jardim Zaíra', phone: '11986709949', whatsapp: '11986709949', address: 'Jardim Zaíra, Mauá', neighborhood: 'Jardim Zaíra' },
  { name: 'Gabriel Mattos', phone: '11945042992', whatsapp: '11945042992', address: 'Mauá, SP', neighborhood: 'Vila Assis' },
  { name: 'Montador Vila Magini', phone: '11942906615', whatsapp: '11942906615', address: 'Vila Magini, Mauá', neighborhood: 'Vila Magini' },
  { name: 'Sampa Móveis', phone: '11941628192', whatsapp: '11941628192', address: 'Mauá, SP', neighborhood: 'Vila Magini' },
  { name: 'Willians Santos', phone: '11959540923', whatsapp: '11959540923', address: 'Jardim Itapark, Mauá', neighborhood: 'Jardim Itapark' },
  { name: 'Montador Jardim Mauá', phone: '11990017107', whatsapp: '11990017107', address: 'Jardim Mauá, Mauá', neighborhood: 'Jardim Mauá' },
  { name: 'Montador Barão de Mauá', phone: '11944421697', whatsapp: '11944421697', address: 'Av. Barão de Mauá, Centro', neighborhood: 'Centro' },
  { name: 'Montador 24h Mauá', phone: '11986159815', whatsapp: '11986159815', address: 'Mauá, SP', neighborhood: 'Jardim Pedroso' },
  { name: 'Montador Vila Noêmia', phone: '1129660340', whatsapp: '1129660340', address: 'Vila Noêmia, Mauá', neighborhood: 'Vila Noêmia' }
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
  city_id: 'placeholder_maua_id', // Will be replaced in SQL generator query
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
  category: 'montador_moveis',
  website: null,
  city_slug: 'maua',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('furniture_assemblers_maua.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} assemblers in furniture_assemblers_maua.json`)
