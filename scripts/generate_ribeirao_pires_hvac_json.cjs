const fs = require('fs')
const crypto = require('crypto')

const cityId = '6f2e8648-735c-4cd5-8e3b-b27b4e945c71' // Placeholder for Ribeirão Pires City ID

const rawData = [
  { name: 'WG Ar Condicionado', phone: '11970917294', whatsapp: '11970917294', address: 'Rua Antônio da Costa Luciano, 222', neighborhood: 'Centro' },
  { name: 'Casa do Ar Condicionado', phone: '1142438101', whatsapp: '1142438101', address: 'Rua Doutor Felício Laurito, 294', neighborhood: 'Centro' },
  { name: 'Horvath Ar', phone: '1142329960', whatsapp: '11942055738', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Mr Ar Condicionado', phone: '11986843617', whatsapp: '11986843617', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'ABC Ar Condicionado', phone: '1142385738', whatsapp: '1142385738', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Gelar SP', phone: '11942500551', whatsapp: '11942500551', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'Manutenção Ar Condicionado Carrier Ribeirão', phone: '1139025938', whatsapp: '11962311982', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'M Techar Instalação e Manutenção', phone: '1148251157', whatsapp: '11973580627', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' },
  { name: 'H-AR Soluções', phone: '11942055738', whatsapp: '11942055738', address: 'Ribeirão Pires, SP', neighborhood: 'Centro' } // duplicate of horvath phone? will be filtered
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-ribeirao-pires',
  category: 'tecnico_ar_condicionado',
  website: null,
  city_slug: 'ribeirao-pires',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('hvac_ribeirao_pires.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} hvac in hvac_ribeirao_pires.json`)
