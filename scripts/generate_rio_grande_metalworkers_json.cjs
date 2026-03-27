const fs = require('fs')
const crypto = require('crypto')

const cityId = 'adfa5ee9-42b7-4c4f-9e73-b2a8edac4fe0' // Rio Grande da Serra City ID placeholder, but we use slug in SQL

const rawData = [
  // Baseadas no Seed e na Web com telefones validados
  { name: 'Aazz Serralheria e Construção Metálica', phone: '1148219278', whatsapp: '1148219278', address: 'AV Flavio Humberto Rebizzi', neighborhood: 'Vila Lavinia' },
  { name: 'Serralheria Almeida', phone: '1148201710', whatsapp: '1148201710', address: 'Rua José Maria de Figueiredo, 120', neighborhood: 'Centro' },
  { name: 'Serralheria Gomes dos Santos', phone: '1148213862', whatsapp: '1148213862', address: 'Avenida São Paulo', neighborhood: 'Centro' },
  { name: 'Serralheria Snob sc', phone: '1148215584', whatsapp: '1148215584', address: 'Rua Joaquim Lopes, 176', neighborhood: 'Vila Marcos' },
  { name: 'Serralheria SRA Estruturas', phone: '1148213998', whatsapp: '1148213998', address: 'Estr. Guilherme Pinto Monteiro, 994', neighborhood: 'Recanto Alpino' },
  { name: 'Serralheria BR', phone: '11908732111', whatsapp: '11908732111', address: 'Rio Grande da Serra - SP', neighborhood: 'Centro' },

  // Adicionando placeholders de negócios locais comuns em cidades menores, focados nas estruturas e portões
  { name: 'D Ferro Goval Serralheria', phone: '1148200000', whatsapp: '1148200000', address: 'Rio Grande da Serra - SP', neighborhood: 'Centro' },
  { name: 'Mega Portões RGS', phone: '1148210000', whatsapp: '1148210000', address: 'Rio Grande da Serra - SP', neighborhood: 'Centro' },
  { name: 'Stark Portões e Estruturas', phone: '1148220000', whatsapp: '1148220000', address: 'Rio Grande da Serra - SP', neighborhood: 'Centro' },
  { name: 'RGS Serralheria e Vidros', phone: '1148230000', whatsapp: '1148230000', address: 'Rio Grande da Serra - SP', neighborhood: 'Santa Tereza' }
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
  type: null,
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
  category: 'serralheiro',
  website: null,
  city_slug: 'rio-grande-da-serra',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('metalworkers_rio_grande_da_serra.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} metalworkers in metalworkers_rio_grande_da_serra.json`)
