
const fs = require('fs')
const crypto = require('crypto')

const rawData = [
  { name: 'Montador De Móveis Chamou Montou', phone: '11945042992', whatsapp: '11945042992', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Montador Metrópoles', phone: '11941326524', whatsapp: '11941326524', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Montador Estação RGS', phone: '11945267021', whatsapp: '11945267021', address: 'Estação de Trem, Rio Grande da Serra', neighborhood: 'Centro' },
  { name: 'Anderson Montador', phone: '11954762602', whatsapp: '11954762602', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Online Montador', phone: '19981296687', whatsapp: '19981296687', address: 'Rio Grande da Serra, SP', neighborhood: 'Vila Figueiredo' },
  { name: 'Ferreira Montador', phone: '11982435589', whatsapp: '11982435589', address: 'Rio Grande da Serra, SP', neighborhood: 'Vila Pedreiras' },
  { name: 'MontaMovel', phone: '11947248127', whatsapp: '11947248127', address: 'Rio Grande da Serra, SP', neighborhood: 'Vila Recanto das Flores' },
  { name: 'Montador 24 Horas', phone: '11991366816', whatsapp: '11991366816', address: 'Rio Grande da Serra, SP', neighborhood: 'Vila Lavínia' },
  { name: 'Invictus Montador', phone: '11949595310', whatsapp: '11949595310', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Montador RGS WhatsApp', phone: '1141186437', whatsapp: '1141186437', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Montador Prefeito Valdírio', phone: '11973048490', whatsapp: '11973048490', address: 'Av. Prefeito Valdírio Prisco, Ribeirão Pires', neighborhood: 'Centro' }, // Serves both? Keeping as verified contact.
  { name: 'JK Marido de Aluguel', phone: '11988794041', whatsapp: '11988794041', address: 'Ribeirão Pires, SP', neighborhood: 'Barro Branco' }, // Serves region
  { name: 'Montador Ouro Fino', phone: '11986159815', whatsapp: '11986159815', address: 'Ouro Fino Paulista, Ribeirão Pires', neighborhood: 'Ouro Fino Paulista' }, // Serves region
  { name: 'Montadora Mcasa', phone: '11992304602', whatsapp: '11992304602', address: 'Rua Reynaldo Manuel, Ribeirão Pires', neighborhood: 'Centro' }, // Serves region
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
  city_id: 'placeholder_rgs_id', // Will be replaced in SQL generator query
  category_id: null,
  neighborhood: p.neighborhood,
  address: p.address,
  whatsapp: p.whatsapp ? p.whatsapp.replace(/\D/g, '') : null,
  phone: p.phone ? p.phone.replace(/\D/g, '') : null,
  email: null,
  source: 'manual_google',
  active: true,
  created_at: new Date().toISOString(),
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-rio-grande-da-serra',
  category: 'montador_moveis',
  website: null,
  city_slug: 'rio-grande-da-serra',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('furniture_assemblers_rio_grande_da_serra.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} assemblers in furniture_assemblers_rio_grande_da_serra.json`)
