const fs = require('fs')
const crypto = require('crypto')

const cityId = '0b6186ee-83dd-4ce2-a079-c81ca80482de' // Placeholder for Ribeirao Pires City ID

const rawData = [
  // From Web Searches and existing valid seeds
  { name: 'O Gesseiro Ribeirão Pires', phone: '11983630155', whatsapp: '11983630155', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Gesso Juliana', phone: '1143747868', whatsapp: '1143738000', address: 'Av. Francisco Monteiro, 2434', neighborhood: 'Santa Luzia' },
  { name: 'Gesso Ribeirão', phone: '1148248161', whatsapp: '1148248161', address: 'Avenida Francisco Monteiro, 518', neighborhood: 'Centro' },
  { name: 'RM Gesso', phone: '1148236096', whatsapp: '11995513553', address: 'Rua Domingos Corrêa, 53', neighborhood: 'Parque Aliança' },
  { name: 'JMG Gesso Decorações', phone: '1148283546', whatsapp: '11943211967', address: 'Avenida Humberto de Campos, 1892', neighborhood: 'Vila Sueli' },
  { name: 'Mari Decorações em Gesso', phone: '1148258395', whatsapp: '1148258395', address: 'Rua Ipanema, 137', neighborhood: 'Santa Luzia' },
  { name: 'Gesso Guanabara', phone: '1148256633', whatsapp: '1148256633', address: 'Rua Capitão José Gallo, 1915', neighborhood: 'Centro' },
  { name: 'Manoel Neto Figueredo Gesso', phone: '1120627980', whatsapp: '1120627980', address: 'Rua Eça de Queirós, 202', neighborhood: 'Represa' },
  { name: 'Nilton Gesso', phone: '1148276694', whatsapp: '1148276694', address: 'Rua Leme, 93', neighborhood: 'Jardim Roncon' },
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('9999') || rawNumber.includes('8888') || rawNumber.includes('7777') || rawNumber.includes('6666')) return false;
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
  created_at: new Date('2026-02-13T12:00:00').toISOString(),
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-ribeirao-pires',
  category: 'gesseiro',
  website: null,
  city_slug: 'ribeirao-pires',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('plasterers_ribeirao_pires.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} plasterers in plasterers_ribeirao_pires.json`)
