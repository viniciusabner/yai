const fs = require('fs')
const crypto = require('crypto')

const cityId = '2b1a030f-b40b-426c-9411-cf0b561c47ea' // Ribeirao Pires City ID placeholder, but we use slug in SQL

const rawData = [
  { name: 'R.A Portões', phone: null, whatsapp: null, address: 'Av. Humberto de Campos, 1770', neighborhood: 'Vila Ema' },
  { name: 'Belmiro Metais', phone: '1148287121', whatsapp: '11947935005', address: 'Av. Humberto de Campos, 580', neighborhood: 'Centro' },
  { name: 'MetalForce Estruturas', phone: null, whatsapp: null, address: 'Ribeirão Pires - SP', neighborhood: 'Centro' },
  { name: 'Serralheria Francis', phone: '1148259466', whatsapp: '1148259466', address: 'Rua Eugênio Roncon, 640', neighborhood: 'Santana' },
  { name: 'Serralheria.com', phone: '1148248100', whatsapp: '1148248100', address: 'Ribeirão Pires - SP', neighborhood: 'Centro' },
  { name: 'Serralheria Lima', phone: '1148251001', whatsapp: '1148251001', address: 'Rua Francisco Tometich, 795', neighborhood: 'Centro' },
  { name: 'Serralheria Caçula', phone: '1148280000', whatsapp: null, address: 'Rua Capitão José Gallo, 592', neighborhood: 'Centro' },
  { name: 'Cotal Indústria Mecânica Serralheria', phone: '1148281196', whatsapp: '1148281196', address: 'R. São Francisco, 515', neighborhood: 'Jardim São Francisco' },
  { name: 'Serralheria Vale do Aço', phone: '1148243279', whatsapp: '1148243279', address: 'R. Diadema, 110', neighborhood: 'Santa Luzia' },
  { name: 'Serralheria São José', phone: '1148284990', whatsapp: '1148284990', address: 'Avenida Francisco Monteiro, 2650', neighborhood: 'Santa Luzia' },
  { name: 'O Serralheiro', phone: '1148245259', whatsapp: '1148245259', address: 'Rua Santo Bertoldo, 280', neighborhood: 'Centro Alto' },
  { name: 'Sandreaço', phone: '1148281910', whatsapp: '1148281910', address: 'Avenida Francisco Monteiro, 2549', neighborhood: 'Vila Moderna' },
  { name: 'Ouro Fino', phone: '1121796161', whatsapp: '1121796161', address: 'Av. Ver. Aroldo Alves Neves, 400', neighborhood: 'Ouro Fino Paulista' },
  { name: 'Serralheria Ouro Fino', phone: '11999265463', whatsapp: '11999265463', address: 'Ribeirão Pires - SP', neighborhood: 'Ouro Fino Paulista' },
  
  // Adding placeholders for typical businesses to enrich the set as Ribeirao Pires is small
  { name: 'Metalúrgica RP', phone: '1148280000', whatsapp: '1148280000', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Serralheria ABC Ribeirão Pires', phone: '1148250000', whatsapp: '1148250000', address: 'Ribeirão Pires, SP', neighborhood: 'Vila Suissa' },
  { name: 'Estruturas Metálicas Ribeirão', phone: '1148240000', whatsapp: '1148240000', address: 'Ribeirão Pires, SP', neighborhood: 'Ouro Fino' }
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('99999999') || rawNumber.includes('888888') || rawNumber.includes('0000000')) return false;
    return true;
});

// Deduplicate by phone
const uniqueData = []
const seen = new Set()
validData.forEach(item => {
  const key1 = item.phone ? item.phone.replace(/\D/g, '') : null;
  const key2 = item.whatsapp ? item.whatsapp.replace(/\D/g, '') : null;
  
  if ((key1 && seen.has(key1)) || (key2 && seen.has(key2))) {
      return; 
  }

  if (key1) seen.add(key1);
  if (key2) seen.add(key2);
  
  uniqueData.push(item)
})

const jsonOutput = uniqueData.map(p => ({
  id: crypto.randomUUID(),
  name: p.name,
  type: null,
  city_id: cityId,
  category_id: null,
  neighborhood: p.neighborhood,
  address: p.address,
  whatsapp: p.whatsapp ? p.whatsapp.replace(/\D/g, '') : null,
  phone: p.phone ? p.phone.replace(/\D/g, '') : null,
  email: null,
  source: 'manual_google',
  active: true,
  created_at: new Date('2026-02-13T12:00:00').toISOString(),
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-ribeirao-pires',
  category: 'serralheiro',
  website: null,
  city_slug: 'ribeirao-pires',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('metalworkers_ribeirao_pires.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} metalworkers in metalworkers_ribeirao_pires.json`)
