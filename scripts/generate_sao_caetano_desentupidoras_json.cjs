const fs = require('fs')
const crypto = require('crypto')

const cityId = 'c7e8e9f2-25e2-45e3-9829-87c211242337' // São Caetano do Sul City ID

const rawData = [
  // Web searches - EXCLUSIVELY REAL DATA
  { name: 'Desentupidora HidroZen', phone: '13992073959', whatsapp: '13992073959', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'JR Hidro Desentupidora', phone: '11947132496', whatsapp: '11947132496', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Hidro Urgente SCS', phone: '11952699160', whatsapp: '11952699160', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Son Desentupidora', phone: '11946699263', whatsapp: '11946699263', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Esgotecnica SCS', phone: '11982085000', whatsapp: '11982085000', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Hidrotex SCS', phone: '1150843780', whatsapp: '11948082000', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora Menor Valor SCS', phone: '11913628000', whatsapp: '11913628000', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Desentupidora OK SCS', phone: '11947032038', whatsapp: '11947032038', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Cidade Desentupidora', phone: '11946699263', whatsapp: '11946699263', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Yoshi Desentupidora', phone: '1128936146', whatsapp: '11966907022', address: 'São Caetano do Sul, SP', neighborhood: 'Barcelona' },
  { name: 'HidrojatoeVacuo SCS', phone: '11977511305', whatsapp: '11977511305', address: 'São Caetano do Sul, SP', neighborhood: 'Barcelona' },
  { name: 'Desentupidora Rei dos Reis SCS', phone: '11948470437', whatsapp: '11948470437', address: 'São Caetano do Sul, SP', neighborhood: 'Barcelona' },
  { name: 'Desentupidora Santa Paula', phone: '1125399192', whatsapp: '1125399192', address: 'São Caetano do Sul, SP', neighborhood: 'Santa Paula' }
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('99999999') || rawNumber.includes('888888') || rawNumber.includes('0000000') || rawNumber.includes('0800')) return false;
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-sao-caetano',
  category: 'desentupidora',
  website: null,
  city_slug: 'sao-caetano-do-sul',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('desentupidoras_sao_caetano.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} desentupidoras in desentupidoras_sao_caetano.json`)
