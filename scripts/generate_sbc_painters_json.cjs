
const fs = require('fs')
const crypto = require('crypto')

const cityId = '63f5d4df-256d-4732-8e51-feffc5ef7a5f' // São Bernardo do Campo

const rawData = [
  { name: 'JH Pinturas', phone: '11997418377', whatsapp: '11997418377', address: 'Avenida Dom Jaime de Barros Câmara, 763', neighborhood: 'Planalto' },
  { name: 'J.A. Pinturas e Reformas', phone: '11982282868', whatsapp: '11982282868', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Ailton Pinturas', phone: '1143379280', whatsapp: '1143379280', address: 'Rua Fonte, 480', neighborhood: 'Centro' },
  { name: 'Black Gladietor Pinturas', phone: '11992148243', whatsapp: '11992148243', address: 'Rua João Silva, 291', neighborhood: 'Jardim Industrial' },
  { name: 'Davi Menezes Pintor', phone: '1134669093', whatsapp: '1134669093', address: 'Nova Petrópolis, s/n', neighborhood: 'Nova Petrópolis' },
  { name: 'Forte Pinturas e Reformas', phone: '1143341838', whatsapp: '1143341838', address: 'Rua João Cavinato, 94', neighborhood: 'Centro' },
  { name: 'J.L. Acabamentos e Pinturas', phone: '11961038246', whatsapp: '11961038246', address: 'Rua Mariana da Cunha Moda, 361', neighborhood: 'Cooperativa' },
  { name: 'JP Lar\'t Pinturas', phone: '1143304106', whatsapp: '1143304106', address: 'Rua Padres, 595', neighborhood: 'Centro' },
  { name: 'MAC ABC Pinturas', phone: '1141219360', whatsapp: '1141219360', address: 'Avenida Francisco Prestes Maia, 1052', neighborhood: 'Centro' },
  { name: 'Panorama Pinturas', phone: '1141773714', whatsapp: '1141773714', address: 'Rua Ida Leoni Cleto, 266', neighborhood: 'Centro' },
  { name: 'Pintura Letrão', phone: '1143511298', whatsapp: '1143511298', address: 'Rua Rolando Gambini, 846', neighborhood: 'Centro' },
  { name: 'GOC Construtora', phone: '1141125560', whatsapp: '1141125560', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'A.N. Pinturas', phone: '11959553506', whatsapp: '11959553506', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Nacional Cores', phone: '11990096403', whatsapp: '11990096403', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Dikar Pinturas', phone: '1143629700', whatsapp: '1143629700', address: 'Rua Marabá, 80', neighborhood: 'Rudge Ramos' },
  { name: 'AJ Pintura Predial', phone: '11977957363', whatsapp: '11977957363', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Master House Manutenções', phone: '1140001234', whatsapp: '1140001234', address: 'Paulicéia, SP', neighborhood: 'Paulicéia' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-sao-bernardo',
  category: 'pintor',
  website: null,
  city_slug: 'sao-bernardo-do-campo',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('painters_sao_bernardo.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} painters in painters_sao_bernardo.json`)
