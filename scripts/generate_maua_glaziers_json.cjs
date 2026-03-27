const fs = require('fs')
const crypto = require('crypto')

const cityId = '5ec9188e-e260-4cd9-ae8a-aff191c95bbd' // Placeholder for Mauá City ID

const rawData = [
  { name: 'Astec Vidros', phone: '1145413064', whatsapp: '1145413064', address: 'Rua Brás Cubas, 875', neighborhood: 'Vila Bocaina' },
  { name: 'Léo Box', phone: '1145132862', whatsapp: '11995468766', address: 'Avenida Clodoaldo Portugal Caribe, 514', neighborhood: 'Vila Noemia' },
  { name: '2 Irmãos Arte em Vidros', phone: '1145455701', whatsapp: '1145455701', address: 'Avenida Itapark, 3543', neighborhood: 'Jardim Itapark' },
  { name: 'Allsac Esquadrias e Vidraçaria', phone: '1145151783', whatsapp: '1145151783', address: 'Av. Barão de Mauá, 4326', neighborhood: 'Jardim São João' },
  { name: 'Art Decor vidros', phone: '11948012674', whatsapp: '11948012674', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Athenas Auto vidros', phone: '1145554055', whatsapp: '1145554055', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Brv Auto vidros', phone: '1145772052', whatsapp: '1145772052', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Casagrande Auto Vidros', phone: '1145442025', whatsapp: '1145442025', address: 'Av. Barão de Mauá, 2025', neighborhood: 'Vila América' },
  { name: 'CVS Vidros', phone: '1145482028', whatsapp: '11986542148', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Efraim Vidraçaria', phone: '11994269658', whatsapp: '11994269658', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Mauá', phone: '1123128416', whatsapp: '1123128416', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Três Américas', phone: '1145146321', whatsapp: '1145146321', address: 'Av. Brasil, 1607', neighborhood: 'Parque das Américas' },
  { name: 'Vidraçaria SP Box', phone: '11911767390', whatsapp: '11911767390', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'BETORET S Vidraçaria', phone: '1145471541', whatsapp: '1145146042', address: 'Avenida Presidente Castelo Branco, 2082', neighborhood: 'Jardim Zaíra' },
  { name: 'Ofir Glass Vidraçaria', phone: '11939350298', whatsapp: '11939350298', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'SPGlass', phone: '11940714225', whatsapp: '11940714225', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Vidraçaria Simão', phone: '1145163154', whatsapp: '1145163154', address: 'Av. Raimundo Eduardo da Silva, 64', neighborhood: 'Jardim Zaira' },
  { name: 'Shopping dos Vidros', phone: '1145445002', whatsapp: '1145445002', address: 'Avenida Castelo Branco', neighborhood: 'Jardim Zaira' },
  { name: 'Vidraçaria Três Irmãos', phone: '1145134688', whatsapp: '1145134688', address: 'Avenida Clodoaldo Portugal Caribe, 577', neighborhood: 'Vila Assis Brasil' },
  { name: 'Design Plano Vidraçaria', phone: '11982851453', whatsapp: '11982851453', address: 'Mauá, SP', neighborhood: 'Centro' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-maua',
  category: 'vidraceiro',
  website: null,
  city_slug: 'maua',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('glaziers_maua.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} glaziers in glaziers_maua.json`)
