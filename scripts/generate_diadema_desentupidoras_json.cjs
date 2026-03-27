const fs = require('fs')
const crypto = require('crypto')

const cityId = '6661a9ac-741b-41ce-83a3-dc42013f9829' // Diadema City ID

const rawData = [
  // Web Searches - EXCLUSIVELY REAL DATA
  { name: 'Desentupidora Norte Sul 24 Horas', phone: '11992643291', whatsapp: '11992643291', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Sakay', phone: '1150586000', whatsapp: '11958137999', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora SP Diadema', phone: '11947437000', whatsapp: '11947437000', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Rede de Esgoto Diadema', phone: '11920597774', whatsapp: '11920597774', address: 'Diadema, SP', neighborhood: 'Serraria' },
  { name: 'Ótima Desentupidora Diadema', phone: '11978595935', whatsapp: '11978595935', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Hidro New ABC Diadema', phone: '1144364596', whatsapp: '1144364596', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Sapopemba Desentupidora Diadema', phone: '11946699263', whatsapp: '11946699263', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Nova Capital Desentupidora Plantão 24 Horas', phone: '11945030569', whatsapp: '11945030569', address: 'Diadema, SP', neighborhood: 'Vila Lídia' },
  { name: 'HidrojatoeVacuo Centro Diadema', phone: '11977511305', whatsapp: '11977511305', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora 24h Diadema', phone: '11952699160', whatsapp: '11952699160', address: 'Diadema, SP', neighborhood: 'Piraporinha' },
  { name: 'Desentupidora Diadema SP', phone: '11987767059', whatsapp: '11987767059', address: 'Diadema, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Piraporinha 24h', phone: '11970715000', whatsapp: '11970715000', address: 'Diadema, SP', neighborhood: 'Piraporinha' },
  { name: 'Desentupidora Piraporinha', phone: '11969531500', whatsapp: '11969531500', address: 'Diadema, SP', neighborhood: 'Piraporinha' },
  { name: 'Desentupidora xyz Eldorado', phone: '11947259077', whatsapp: '11947259077', address: 'Diadema, SP', neighborhood: 'Eldorado' },
  { name: 'Desentupidora de Pias Eldorado', phone: '11947376456', whatsapp: '11947376456', address: 'Diadema, SP', neighborhood: 'Eldorado' },
  { name: 'RotorSystem Campanário', phone: '1144510933', whatsapp: '1144510933', address: 'Diadema, SP', neighborhood: 'Campanário' },
  { name: 'Martec Desentupidora Campanário', phone: '1142115252', whatsapp: '11940025075', address: 'Diadema, SP', neighborhood: 'Campanário' },
  { name: 'Trindade Desentupimento', phone: '1137965814', whatsapp: '11982226770', address: 'Diadema, SP', neighborhood: 'Campanário' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-diadema',
  category: 'desentupidora',
  website: null,
  city_slug: 'diadema',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('desentupidoras_diadema.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} desentupidoras in desentupidoras_diadema.json`)
