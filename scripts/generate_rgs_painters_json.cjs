
const fs = require('fs')
const crypto = require('crypto')

const cityId = 'ea516919-22d1-4508-8641-8eb9be709dd8' // Rio Grande da Serra

// Collected from searches - ONLY VERIFIED REAL CONTACTS
const rawData = [
  { name: 'Designer.com Pinturas', phone: '1148215909', whatsapp: '11963750086', address: 'Rua Deputado Silva Prado, 94', neighborhood: 'Parque Indaiá' },
  { name: 'Pintura e Reforma Aguinaldo', phone: '1148213655', whatsapp: '1148213655', address: 'Rua Prefeito Francisco Arnoni, 7', neighborhood: 'Centro' },
  { name: 'RL Revestimentos', phone: '1148268455', whatsapp: '1148268229', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'RPMendes Empreiteira', phone: '11914793603', whatsapp: '11914793603', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Crioserv Manutenção', phone: '1148215784', whatsapp: '1148215784', address: 'Estrada Pouso Alegre, 7', neighborhood: 'Parque Pouso Alegre' },
  { name: 'Marido de Aluguel RGS', phone: '1141144004', whatsapp: '1141144004', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Pedreiro e Pintor Venâncio', phone: '1148201011', whatsapp: '1148201011', address: 'Rua Venâncio Orsini, 112', neighborhood: 'Centro' },
  { name: 'GLG Pinturas', phone: '1127319596', whatsapp: '1127319596', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Lci Pintura', phone: '1123914195', whatsapp: '11947793775', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Cardoso Pinturas', phone: '1138672484', whatsapp: '11962200830', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'JA Pinturas', phone: '11982282868', whatsapp: '11982282868', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Atlanta Pinturas', phone: '11940824490', whatsapp: '11940824490', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-rio-grande-da-serra',
  category: 'pintor',
  website: null,
  city_slug: 'rio-grande-da-serra',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('painters_rio_grande.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} painters in painters_rio_grande.json`)
