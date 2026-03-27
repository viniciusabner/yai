
const fs = require('fs')
const crypto = require('crypto')

// Using a placeholder or fetched city ID; the SQL inserts use a subquery.
const cityId = '639f7af4-3e91-4db5-b463-71887eabbce8' // SCS placeholder/actual if known

const rawData = [
  // From Web Searches
  { name: 'Gesso SAT', phone: '1143187001', whatsapp: '11975734949', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'O Gesseiro SCS', phone: '11983630155', whatsapp: '11983630155', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Work Gesso', phone: '1142243054', whatsapp: '1142243054', address: 'Rua Osvaldo Cruz, 566', neighborhood: 'Osvaldo Cruz' },
  { name: 'Gesso Fkr', phone: '1142276534', whatsapp: '1142276534', address: 'Avenida Tijucussu, 308', neighborhood: 'Olímpico' },
  { name: 'DC MAIS Drywall', phone: '1144215665', whatsapp: '11987063707', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Dap Steel SCS', phone: '1134597275', whatsapp: '1134597275', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Arte Decorações em gesso', phone: '1144218706', whatsapp: '1144218706', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Atelier Do gesso', phone: '1142262861', whatsapp: '1142262861', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Comércio De gesso Cleiton', phone: '1142327381', whatsapp: '1142327381', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Divilam Comércio de divisórias', phone: '1142388786', whatsapp: '1142388786', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Master House SCT', phone: '1142388786', whatsapp: '11958757840', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'ConstruServices', phone: '1137446103', whatsapp: '1137446103', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Sinovo Construção Civil', phone: '1142290078', whatsapp: '1142290078', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },
  { name: 'Sotanques', phone: '1129170899', whatsapp: '1129170899', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },

  // From Seed 63 (Verified)
  { name: 'Gesso Caetano', phone: '11991627972', whatsapp: '11991627972', address: 'R. Baraldi, 293', neighborhood: 'Centro' },
  { name: 'Gesso Antão', phone: '1142381303', whatsapp: '1142381303', address: 'Rua Nelly Pellegrino, 389', neighborhood: 'Centro' },
  { name: 'Divisórias Futura', phone: '1142290315', whatsapp: '1142290315', address: 'Rua Tenente Antônio João, 163', neighborhood: 'Centro' },
  { name: 'Gesso E Cristal', phone: '1142216941', whatsapp: '1142216941', address: 'Rua São Paulo, 1404', neighborhood: 'Santa Paula' },
  { name: 'Gesso Lar Brasil', phone: '1142290672', whatsapp: '1142290672', address: 'Rua Tapajós, 882', neighborhood: 'Barcelona' },
  { name: 'Jomag Drywall', phone: '1142262243', whatsapp: '11996171090', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' },

  // From Seed 20 / 28 (Construction & Handyman serving Gesso)
  { name: 'Casa do Construtor SCS', phone: '1123764252', whatsapp: '11981202807', address: 'Rua João Pessoa, 288', neighborhood: 'Centro' },
  { name: 'Simplifique Engenharia', phone: '11988887777', whatsapp: '11988887777', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' }, // Removed placeholder down in filter
  { name: 'Raformas Reformas', phone: '11977776666', whatsapp: '11977776666', address: 'São Caetano do Sul, SP', neighborhood: 'Centro' } // Removed placeholder down in filter
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    // Remove if it's an obvious fake number I added to seed previously
    if (rawNumber.includes('9999') || rawNumber.includes('8888') || rawNumber.includes('7777') || rawNumber.includes('6666')) return false;
    return true;
});

// Deduplicate by phone
const uniqueData = []
const seen = new Set()
validData.forEach(item => {
  const key = (item.phone || item.whatsapp).replace(/\D/g, '')
  if (!seen.has(key)) {
    seen.add(key)
    uniqueData.push(item)
  }
})

// Note: Will output what was found as real, rejecting duplicates and placeholders.

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
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-sao-caetano',
  category: 'gesseiro',
  website: null,
  city_slug: 'sao-caetano-do-sul',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('plasterers_sao_caetano.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} plasterers in plasterers_sao_caetano.json`)
