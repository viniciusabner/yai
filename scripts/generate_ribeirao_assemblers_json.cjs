
const fs = require('fs')
const crypto = require('crypto')

const rawData = [
  { name: 'Montador Gabriel', phone: '11945042992', whatsapp: '11945042992', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Montador Metrópoles', phone: '11944421697', whatsapp: '11944421697', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Montador Estação', phone: '11945267021', whatsapp: '11945267021', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Montador Prefeito Valdírio', phone: '11973048490', whatsapp: '11973048490', address: 'Av. Prefeito Valdírio Prisco, Ribeirão Pires', neighborhood: 'Centro' },
  { name: 'JK Marido de Aluguel', phone: '11988794041', whatsapp: '11988794041', address: 'Ribeirão Pires, SP', neighborhood: 'Barro Branco' },
  { name: 'Montador Ouro Fino', phone: '11986159815', whatsapp: '11986159815', address: 'Ouro Fino Paulista, Ribeirão Pires', neighborhood: 'Ouro Fino Paulista' },
  { name: 'Montadora Mcasa', phone: '11992304602', whatsapp: '11992304602', address: 'Rua Reynaldo Manuel, Ribeirão Pires', neighborhood: 'Centro' },
  { name: 'WhatsApp Montador', phone: '19995085811', whatsapp: '19995085811', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Martelix RP', phone: '11995743555', whatsapp: '11995743555', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' }
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
  city_id: 'placeholder_ribeirao_id', // Will be replaced in SQL generator query
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
  category: 'montador_moveis',
  website: null,
  city_slug: 'ribeirao-pires',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('furniture_assemblers_ribeirao_pires.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} assemblers in furniture_assemblers_ribeirao_pires.json`)
