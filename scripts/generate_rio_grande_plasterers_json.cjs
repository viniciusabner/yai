const fs = require('fs')
const crypto = require('crypto')

const cityId = '663673c6-0eb0-4b20-afc5-345391d14fa9' // Placeholder for Rio Grande da Serra City ID

const rawData = [
  // From Web Searches and existing valid seeds
  { name: 'O Gesseiro', phone: '11983630155', whatsapp: '11983630155', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Drywall Ideal RGS', phone: '1143051247', whatsapp: '11982442385', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Ciasul Comercial (Atendimento ABC)', phone: '1144638800', whatsapp: '11947657252', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Gesso 3 Mil', phone: '1137663393', whatsapp: '1137141748', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Gesso Juliana Fábrica', phone: '1148276458', whatsapp: '1148276458', address: 'Av. Francisco Monteiro, 2375', neighborhood: 'Santa Luzia' },
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-rio-grande-da-serra',
  category: 'gesseiro',
  website: null,
  city_slug: 'rio-grande-da-serra',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('plasterers_rio_grande.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} plasterers in plasterers_rio_grande.json`)
