const fs = require('fs')
const crypto = require('crypto')

const cityId = '5ec9188e-e260-4cd9-ae8a-aff191c95bbd' // Placeholder for Mauá City ID

const rawData = [
  { name: 'ACW Ar Condicionado', phone: '1131815453', whatsapp: '11945046383', address: 'Rua Dom José Gaspar, 1204', neighborhood: 'Vila Noêmia' },
  { name: 'Samedi Refrigeração', phone: '1143099193', whatsapp: '11993271408', address: 'Rua San Juan, 92', neighborhood: 'Parque das Américas' },
  { name: 'Horvath Ar', phone: '1142329960', whatsapp: '11942055738', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'DL Climatização', phone: '11965240944', whatsapp: '11965240944', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'H-AR Soluções', phone: '11942055738', whatsapp: '11942055738', address: 'Mauá, SP', neighborhood: 'Centro' }, // duplicate of horvath phone? will be filtered
  { name: 'AG Climatização', phone: '1127049942', whatsapp: '11954000706', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Gelar SP', phone: '11942500551', whatsapp: '11942500551', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Wf Ar Condicionado', phone: '1122281805', whatsapp: '1122281805', address: 'R Campos Sales, 167', neighborhood: 'Vila Bocaina' },
  { name: 'Voltecn Instalações e Ar Condicionado', phone: '11998588369', whatsapp: '11998588369', address: 'R. Brás Cubas, 981', neighborhood: 'Vila Bocaina' },
  { name: 'M.D.K Refrigeração', phone: '1134584566', whatsapp: '1134584566', address: 'Rua Marechal Deodoro da Fonseca, 580', neighborhood: 'Parque São Vicente' },
  { name: 'Refrigeracao Amorim', phone: '1195325617', whatsapp: '1195325617', address: 'Rua Dona Áurea Oliveira da Silva, 58', neighborhood: 'Jardim Zaíra' },
  { name: 'Multiar Mecânica e Ar condicionado', phone: '11973586482', whatsapp: '11973586482', address: 'Av. Pres. Castelo Branco, 614', neighborhood: 'Jardim Zaíra' },
  { name: 'Arcool Manutenção', phone: '1152429354', whatsapp: '11984454406', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'ABC Ar Condicionado', phone: '1142385738', whatsapp: '1142385738', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'TKL Serv', phone: '1126679940', whatsapp: '1126679940', address: 'Mauá, SP', neighborhood: 'Centro' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-maua',
  category: 'tecnico_ar_condicionado',
  website: null,
  city_slug: 'maua',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('hvac_maua.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} hvac in hvac_maua.json`)
