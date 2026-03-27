const fs = require('fs')
const crypto = require('crypto')

const cityId = 'e21a22bd-f1db-4ce4-acb2-e1d1ebc96d99' // Placeholder for SCS City ID

const rawData = [
  { name: 'Vidraçaria SP Box', phone: '11911767390', whatsapp: '11911767390', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Efraim Vidraçaria', phone: '11994269658', whatsapp: '11994269658', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'RR Espelhos', phone: '1143184800', whatsapp: '11983019850', address: 'Rua Alegre, 1155', neighborhood: 'Barcelona' },
  { name: 'Alameda Glass', phone: '1142206056', whatsapp: '11998641425', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Minelli (Ateliê Vidros)', phone: '1142260363', whatsapp: '1142260363', address: 'Av. Conde Francisco Matarazzo, 624', neighborhood: 'Fundação' },
  { name: 'Box De vidro LM', phone: '1126295744', whatsapp: '1126295744', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'BrasilGlass', phone: '1142241563', whatsapp: '1142241563', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Vidros Regina', phone: '1142246692', whatsapp: '1142246692', address: 'Av. Sen. Roberto Símonsen, 1289', neighborhood: 'Cerâmica' },
  { name: 'São Caetano Glass', phone: '1135651064', whatsapp: '1135651064', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'SHOW GLASS', phone: '1150680960', whatsapp: '11947659593', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Ofir Glass', phone: '11939350298', whatsapp: '11939350298', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Kza Box Vidros', phone: '1123761688', whatsapp: '11993061688', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'GMS Vidros', phone: '11951080449', whatsapp: '11951080449', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Pacaembu Vidros', phone: '1142248999', whatsapp: '11974210069', address: 'Rua Conceição, 506', neighborhood: 'Santo Antônio' },
  { name: 'Vidraçaria A.B.C.D.', phone: '1142241315', whatsapp: '1142241315', address: 'Av. Goiás, 1780', neighborhood: 'Santa Paula' },
  { name: 'Vidraçaria Barcelona', phone: '1142283097', whatsapp: '1142283097', address: 'Rua Taipas, 613', neighborhood: 'Barcelona' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-sao-caetano',
  category: 'vidraceiro',
  website: null,
  city_slug: 'sao-caetano-do-sul',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('glaziers_sao_caetano.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} glaziers in glaziers_sao_caetano.json`)
