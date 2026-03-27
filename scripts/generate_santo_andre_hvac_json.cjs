const fs = require('fs')
const crypto = require('crypto')

const cityId = 'bb65710d-7049-43c7-9519-72fd7a2d6771' // Placeholder for Santo Andre City ID

const rawData = [
  { name: 'Cold Quality', phone: '1143036227', whatsapp: '11992834907', address: 'Santo André, SP', neighborhood: 'Centro' }, // From seed and search
  { name: 'ABC Ar Condicionado', phone: '1142385738', whatsapp: '1142385738', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'Técnico Ar-Condicionado Santo André Carrier', phone: '1136443392', whatsapp: '11962311982', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'JDR Ar Condicionado', phone: '11917336444', whatsapp: '11917336444', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'HORVATH Ar Condicionado', phone: '1142329960', whatsapp: '1142329960', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'O Rey do Ar Condicionado (Grupo 4S)', phone: '1128915777', whatsapp: '1141174113', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'Eletrônica Giovani', phone: '1144267746', whatsapp: '1144267746', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'JC Assistência Técnica', phone: '1123648076', whatsapp: '11981065931', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'ABC Tecnoar', phone: '1144274245', whatsapp: '11940826711', address: 'Santo André, SP', neighborhood: 'Campestre' },
  { name: 'Assistência Profissional Eletrodomésticos Vila Luzita', phone: '1120169215', whatsapp: '11997327309', address: 'Santo André, SP', neighborhood: 'Vila Luzita' },
  { name: 'D Clima Ar Condicionado', phone: '11949993022', whatsapp: '11949993022', address: 'Santo André, SP', neighborhood: 'Centro' },
  { name: 'ABR Refrigerações Comercial', phone: '1149756944', whatsapp: '11984840104', address: 'R. Iugoslávia, 122', neighborhood: 'Parque das Nações' },
  { name: 'Climart Ar Condicionado', phone: '11982429946', whatsapp: '11982429946', address: 'Santo André, SP', neighborhood: 'Centro' }, // from seed
  { name: 'Assistência Técnica Electronews', phone: '1136443392', whatsapp: '1136443392', address: 'Santo André, SP', neighborhood: 'Centro' } // Shared number with carrier above, will be dup-filtered
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-santo-andre',
  category: 'tecnico_ar_condicionado',
  website: null,
  city_slug: 'santo-andre',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('hvac_santo_andre.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} hvac in hvac_santo_andre.json`)
