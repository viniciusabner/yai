const fs = require('fs')
const crypto = require('crypto')

const cityId = 'e210519a-93e1-4560-843e-ffcbb6f10ad1' // Mauá City ID

const rawData = [
  // Web Searches - EXCLUSIVELY REAL DATA
  { name: 'Desentupidora Mauá 24h', phone: '1145415506', whatsapp: '1145415506', address: 'Mauá, SP', neighborhood: 'Parque das Américas' },
  { name: 'Desentupidora sampa Mauá', phone: '1125399192', whatsapp: '1125399192', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora BR Mauá', phone: '11920597774', whatsapp: '11920597774', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Chamou Chegou Mauá', phone: '11952699160', whatsapp: '11952699160', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora em SP Mauá', phone: '1123597531', whatsapp: '1123597531', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Mauá Desentupidora Pq São Vicente', phone: '1144263704', whatsapp: '11992002542', address: 'Mauá, SP', neighborhood: 'Parque São Vicente' },
  { name: 'Super Limp Desentupidora', phone: '11930710937', whatsapp: '11930710937', address: 'Mauá, SP', neighborhood: 'Parque São Vicente' },
  { name: 'Madalena Desentupidora Mauá', phone: '11946699263', whatsapp: '11946699263', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Peritec Desentupidora', phone: '11949275018', whatsapp: '11976770685', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Jardim Zaira', phone: '11930186000', whatsapp: '11930186000', address: 'Mauá, SP', neighborhood: 'Jardim Zaíra' },
  { name: 'Desentupidora Esgoto Limpo', phone: '1129921000', whatsapp: '1129921000', address: 'Mauá, SP', neighborhood: 'Jardim Zaíra' },
  { name: 'Desentupidora D5', phone: '1144103931', whatsapp: '11911731885', address: 'Mauá, SP', neighborhood: 'Jardim Zaíra' },
  { name: 'Trindade Desentupimento Guapituba', phone: '1137965814', whatsapp: '11982226770', address: 'Mauá, SP', neighborhood: 'Jardim Guapituba' },
  { name: 'Desentupidora HL', phone: '11961652024', whatsapp: '11961652024', address: 'Mauá, SP', neighborhood: 'Jardim Guapituba' },
  { name: 'Desentupidora Brasil SP', phone: '11958099316', whatsapp: '11958099316', address: 'Mauá, SP', neighborhood: 'Jardim Guapituba' },
  { name: 'RotorSystem Capuava', phone: '1144510933', whatsapp: '1144510933', address: 'Mauá, SP', neighborhood: 'Capuava' }
]


const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('99999999') || rawNumber.includes('888888') || rawNumber.includes('0000000') || rawNumber.includes('0800') || rawNumber.includes('40037635')) return false;
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-maua',
  category: 'desentupidora',
  website: null,
  city_slug: 'maua',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('desentupidoras_maua.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} desentupidoras in desentupidoras_maua.json`)
