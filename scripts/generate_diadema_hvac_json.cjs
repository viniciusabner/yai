const fs = require('fs')
const crypto = require('crypto')

const cityId = '3df6718d-f2fe-45a8-ac49-75a7f920f69a' // Placeholder for Diadema City ID

const rawData = [
  { name: 'SRS Ar Condicionado', phone: '11982580578', whatsapp: '11974032390', address: 'Rua Carumbata, 75 - Conj. 02', neighborhood: 'Piraporinha' },
  { name: 'BelluAr Ar Condicionado', phone: '1156218211', whatsapp: '11947196341', address: 'Rua Corunha, 16', neighborhood: 'Centro' },
  { name: 'Artec Service', phone: '1146163314', whatsapp: '11948762120', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Horvath Ar', phone: '1142329960', whatsapp: '11942055738', address: 'Diadema, SP', neighborhood: 'Serraria' },
  { name: 'ABC Ar Condicionado', phone: '1142385738', whatsapp: '1142385738', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Raia Radiadores e Ar Condicionado', phone: '1123118345', whatsapp: '11945234475', address: 'Avenida Piraporinha, 1895', neighborhood: 'Vila Nogueira' },
  { name: 'Air Focus Ar Condicionado E Refrigeração', phone: '1123551940', whatsapp: '1123551940', address: 'Rua Maria Luiza, 155', neighborhood: 'Piraporinha' },
  { name: 'União Ar-condicionado e Refrigeração', phone: '1140712988', whatsapp: '1140712988', address: 'Avenida Piraporinha, 464', neighborhood: 'Centro' },
  { name: 'Assistência Técnica JS', phone: '11974277624', whatsapp: '11974277624', address: 'Diadema, SP', neighborhood: 'Serraria' },
  { name: 'A M Firmino Ar Condicionado Eldorado', phone: '1140592893', whatsapp: '1140592893', address: 'Rua Aruana, 175', neighborhood: 'Eldorado' },
  { name: 'CGS Ar Condicionado', phone: '1127423499', whatsapp: '1127423499', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'DL Climatização', phone: '11965240944', whatsapp: '11965240944', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'TKL Serv', phone: '1126679940', whatsapp: '1126679940', address: 'Diadema, SP', neighborhood: 'Centro' }
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
  category: 'tecnico_ar_condicionado',
  website: null,
  city_slug: 'diadema',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('hvac_diadema.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} hvac in hvac_diadema.json`)
