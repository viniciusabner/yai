const fs = require('fs')
const crypto = require('crypto')

const cityId = '6a0f0237-6799-4c80-8742-181aff7f1396' // Placeholder for SBC City ID

const rawData = [
  { name: 'Grupo Horvath Ar', phone: '1127864264', whatsapp: '1127864264', address: 'São Bernardo do Campo, SP', neighborhood: 'Vila Gonçalves' },
  { name: 'Armadri Refrigeração', phone: '1141224792', whatsapp: '1141224792', address: 'Rua Penha, 4', neighborhood: 'Centro' },
  { name: 'Futura Ar Condicionado', phone: '1143428129', whatsapp: '1143428129', address: 'Rua Herbert Souza, 173', neighborhood: 'Assunção' },
  { name: 'Ice Air Ar Condicionado', phone: '1143622006', whatsapp: '1143622006', address: 'Rua Dr. Gabriel Nicolau, 565', neighborhood: 'Rudge Ramos' },
  { name: 'Plimapec Comércio Manutenção', phone: '1143673361', whatsapp: '1143673361', address: 'Rua José Aníbal Colleoni, 130', neighborhood: 'Rudge Ramos' },
  { name: 'RF Refrigeração', phone: '1141043674', whatsapp: '1141043674', address: 'Estrada Alvarengas, 2933', neighborhood: 'Alvarenga' },
  { name: 'Técnico Ar-Condicionado SBC Carrier', phone: '1136443392', whatsapp: '11962311982', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'H-AR SOLUÇÕES', phone: '11942055738', whatsapp: '11942055738', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Tempo Bom Ar Condicionado', phone: '1143528727', whatsapp: '11940079379', address: 'Rua Pirapitingui, 108', neighborhood: 'Rudge Ramos' },
  { name: 'Gelar SP', phone: '11942500551', whatsapp: '11942500551', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'AG Climatização SBC', phone: '1127049942', whatsapp: '11954000706', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Refrigeração Banfrio', phone: '1141224499', whatsapp: '11989211833', address: 'Rua dos Americanos, 120/124', neighborhood: 'Baeta Neves' },
  { name: 'Bagertech Instalação e Manutenção', phone: '1142352750', whatsapp: '1142352750', address: 'São Bernardo do Campo, SP', neighborhood: 'Assunção' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-sao-bernardo',
  category: 'tecnico_ar_condicionado',
  website: null,
  city_slug: 'sao-bernardo-do-campo',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('hvac_sao_bernardo.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} hvac in hvac_sao_bernardo.json`)
