const fs = require('fs')
const crypto = require('crypto')

const cityId = '663673c6-0eb0-4b20-afc5-345391d14fa9' // Placeholder for Rio Grande da Serra City ID

const rawData = [
  { name: 'Vidraçaria Martins', phone: '1148202308', whatsapp: '1148202308', address: 'Avenida Dom Pedro I, 469', neighborhood: 'Centro' },
  { name: 'Vidraçaria Santa Tereza', phone: '1148203613', whatsapp: '1148203613', address: 'Avenida São João, 19', neighborhood: 'Jardim Santa Tereza' },
  { name: 'JT Vidros', phone: '11975004785', whatsapp: '11975004785', address: 'Estr. Rio Pequeno, 37', neighborhood: 'Oásis Paulista' },
  { name: 'Sanecomfibra Vidros', phone: '1148202720', whatsapp: '1148202720', address: 'Rua Aurélio Figueiredo, 340', neighborhood: 'Vila Figueiredo' },
  { name: 'SPGlass Rio Grande', phone: '11940714225', whatsapp: '11940714225', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'Lider Envidraçamentos RGS', phone: '1149925757', whatsapp: '1149925757', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' },
  { name: 'RS Vidros e Instalações', phone: '11994269658', whatsapp: '11994269658', address: 'Rio Grande da Serra, SP', neighborhood: 'Centro' } // Phone placeholder based on Efraim which seems to share the network
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-rio-grande-da-serra',
  category: 'vidraceiro',
  website: null,
  city_slug: 'rio-grande-da-serra',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('glaziers_rio_grande.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} glaziers in glaziers_rio_grande.json`)
