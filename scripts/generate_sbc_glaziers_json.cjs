const fs = require('fs')
const crypto = require('crypto')

const cityId = 'a1fbd9a7-9513-406a-93f4-3452de40a6b7' // Placeholder for SBC City ID

const rawData = [
  { name: 'Vidraçaria SP Box', phone: '11911767390', whatsapp: '11911767390', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'O Rei do Box (Vidraçaria ABC)', phone: '11970118314', whatsapp: '11970118314', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Efraim Vidraçaria', phone: '11994269658', whatsapp: '11994269658', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Virtual Vidros', phone: '1143684176', whatsapp: '1143684176', address: 'Rua M.M.D.C., 244', neighborhood: 'Paulicéia' },
  { name: 'Vidraçaria Diamante', phone: '11919757949', whatsapp: '11919757949', address: 'R. José de Alencar, 72', neighborhood: 'Planalto' },
  { name: 'Jato Vidraçaria', phone: '1141218964', whatsapp: '11947351871', address: 'Av. Luiz Pequini, 1681', neighborhood: 'Santa Terezinha' },
  { name: 'Ofir Glass', phone: '11939350298', whatsapp: '11939350298', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Halvyr Vidros', phone: '1143566501', whatsapp: '1143566501', address: 'Av. Maria Servidei Demarchi, 494', neighborhood: 'Demarchi' },
  { name: 'Vidraçaria Assunção', phone: '1143514646', whatsapp: '1143514646', address: 'Rua Walte Calos Zanini, 149', neighborhood: 'Assunção' },
  { name: 'Mm Vidro', phone: '1141254944', whatsapp: '1141254944', address: 'Avenida Getúlio Vargas, 1615', neighborhood: 'Baeta Neves' },
  { name: 'Izabela Comércio de Vidros', phone: '1141217391', whatsapp: '1141217391', address: 'Av. Getúlio Vargas, 996', neighborhood: 'Baeta Neves' },
  { name: 'Estrutural Vidros', phone: '1143513978', whatsapp: '1143513978', address: 'Avenida Robert Kennedy, 3441', neighborhood: 'Planalto' },
  { name: 'Menha Vidros', phone: '1143418050', whatsapp: '1143418050', address: 'Rua Francisco Marotti, 73', neighborhood: 'Planalto' },
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-sao-bernardo',
  category: 'vidraceiro',
  website: null,
  city_slug: 'sao-bernardo-do-campo',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('glaziers_sao_bernardo.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} glaziers in glaziers_sao_bernardo.json`)
