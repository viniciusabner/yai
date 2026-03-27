const fs = require('fs')
const crypto = require('crypto')

const cityId = '3df6718d-f2fe-45a8-ac49-75a7f920f69a' // Placeholder for Diadema City ID

const rawData = [
  { name: 'Vidraçaria Diadema', phone: '1140512733', whatsapp: '1140512733', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Glass Play', phone: '11946059710', whatsapp: '11946059710', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Amplo Vidros e Espelhos', phone: '1140554430', whatsapp: '1140554430', address: 'R. Corunha, 67', neighborhood: 'Centro' },
  { name: 'Artefama Esquadrias e Vidraçaria', phone: '1140568719', whatsapp: '11967138717', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Efraim Vidraçaria', phone: '11994269658', whatsapp: '11994269658', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria SP Box', phone: '11911767390', whatsapp: '11911767390', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vidracaria Bom Preco', phone: '1140435885', whatsapp: '1140435885', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vidracaria Marilene', phone: '1140664431', whatsapp: '1140664431', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vini Vidro Artes', phone: '1140754055', whatsapp: '1140754055', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'ABC Vidros MSR', phone: '1140710940', whatsapp: '1140710940', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'MB Vidros', phone: '1126680562', whatsapp: '1126680562', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Quality Vidros', phone: '1140434329', whatsapp: '1140434329', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Cristal', phone: '1140435712', whatsapp: '1140435712', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Divibox', phone: '1140761994', whatsapp: '11972286704', address: 'R. Antônio Dias Adorno, 855', neighborhood: 'Vila Nogueira' },
  { name: 'Vidraçaria Leopoldo', phone: '1140676277', whatsapp: '1140676277', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Piraporinha', phone: '1140662244', whatsapp: '11985614838', address: 'Av. Piraporinha, 1612', neighborhood: 'Piraporinha' },
  { name: 'Vidraçaria Central', phone: '1140562500', whatsapp: '11947854444', address: 'Av. Nossa Senhora das Graças, 1001', neighborhood: 'Serraria' },
  { name: 'Ramos Esquadrias', phone: '1140714677', whatsapp: '11999911009', address: 'Rua Antônio Dias Adorno 718', neighborhood: 'Vila Nogueira' },
  { name: 'Vidratoo', phone: '1140562609', whatsapp: '1140562609', address: 'Diadema, SP', neighborhood: 'Serraria' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-diadema',
  category: 'vidraceiro',
  website: null,
  city_slug: 'diadema',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('glaziers_diadema.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} glaziers in glaziers_diadema.json`)
