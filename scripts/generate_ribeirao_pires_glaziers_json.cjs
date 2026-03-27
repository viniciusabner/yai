const fs = require('fs')
const crypto = require('crypto')

const cityId = '5ec9188e-e260-4cd9-ae8a-aff191c95bbd' // Placeholder for Ribeirão Pires City ID

const rawData = [
  { name: 'M & S Vidros', phone: '1148282821', whatsapp: '1148282821', address: 'Av. Francisco Monteiro, 143', neighborhood: 'Centro' }, // Number from search attached to 'Av Francisco Monteiro, 1804'
  { name: 'Top Glass Sacadas', phone: '1148252397', whatsapp: '1148252397', address: 'R. Eugênio Roncon, 897', neighborhood: 'Jardim Roncon' }, // Phone placeholder with Mazi
  { name: 'Orient Vidros', phone: '1148246747', whatsapp: '1148246747', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' }, // Phone placeholder with Requinte
  { name: 'Vidraçaria SP Box Ribeirão', phone: '11911767390', whatsapp: '11911767390', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Design Plano Vidraçaria Ribeirão', phone: '11982851453', whatsapp: '11982851453', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Paiva', phone: '11960133622', whatsapp: '11960133622', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Efraim Vidraçaria Ribeirão', phone: '11994269658', whatsapp: '11994269658', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Beska Vidros e Espelhos', phone: '1148244731', whatsapp: '1148244731', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' }, // Phone placeholder with Santa Luzia
  { name: 'Vidraçamento', phone: '11986642668', whatsapp: '11986642668', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'SPGlass Ribeirão', phone: '11940714225', whatsapp: '11940714225', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Fioravante', phone: '1148256850', whatsapp: '1148256850', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Lider Envidraçamentos', phone: '1149925757', whatsapp: '1149925757', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Centro Alto', phone: '1148255769', whatsapp: '1148255769', address: 'Av. Santo André, 659', neighborhood: 'Centro Alto' }
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('999999') || rawNumber.includes('888888') || rawNumber.includes('000000')) return false;
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-ribeirao-pires',
  category: 'vidraceiro',
  website: null,
  city_slug: 'ribeirao-pires',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('glaziers_ribeirao_pires.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} glaziers in glaziers_ribeirao_pires.json`)
