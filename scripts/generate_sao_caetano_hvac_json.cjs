const fs = require('fs')
const crypto = require('crypto')

const cityId = 'c7e8e9f2-25e2-45e3-9829-87c211242337' // Placeholder for SCS City ID

const rawData = [
  { name: 'Cold Quality', phone: '1143036227', whatsapp: '11992834907', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'HORVATH Ar Condicionado', phone: '1142329960', whatsapp: '1127864264', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Rey do Ar Condicionado (Grupo 4S)', phone: '1128915777', whatsapp: '1141174113', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Manutenção Ar Condicionado Carrier SBC/SCS', phone: '1139025938', whatsapp: '11962311982', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'ABC Ar Condicionado', phone: '1142385738', whatsapp: '1142385738', address: 'São Caetano do Sul, SP', neighborhood: 'Santa Paula' },
  { name: 'Gelar SP', phone: '11942500551', whatsapp: '11942500551', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Climagel', phone: '11946182237', whatsapp: '11946182237', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'EkoClimax', phone: '11971054922', whatsapp: '11971054922', address: 'São Caetano do Sul, SP', neighborhood: 'Cerâmica' },
  { name: 'JCC Ar Condicionado', phone: '08006068137', whatsapp: '08006068137', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Refrimar Assistência Técnica', phone: '1142328270', whatsapp: '1142328270', address: 'Rua Coronel Camisão, 273', neighborhood: 'Oswaldo Cruz' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-sao-caetano',
  category: 'tecnico_ar_condicionado',
  website: null,
  city_slug: 'sao-caetano-do-sul',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('hvac_sao_caetano.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} hvac in hvac_sao_caetano.json`)
