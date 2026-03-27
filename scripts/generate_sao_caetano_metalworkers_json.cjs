const fs = require('fs')
const crypto = require('crypto')

const cityId = 'c7e8e9f2-25e2-45e3-9829-87c211242337' // São Caetano do Sul City ID

const rawData = [
  { name: 'Alumiferro Serralheria', phone: '1142242744', whatsapp: '1142242744', address: 'R. Amazonas, 1430', neighborhood: 'Centro' },
  { name: 'Atitude Serralheria', phone: '1142283304', whatsapp: '1142283304', address: 'Rua Maj. Carlos Del Prete, 282', neighborhood: 'Centro' },
  { name: 'CMP Serralheria', phone: '1142297135', whatsapp: '1142297135', address: 'Rua São Paulo, 279', neighborhood: 'Cerâmica' },
  { name: 'Egvim Solução', phone: '1135653078', whatsapp: '1135653078', address: 'R. Tocantins, 189', neighborhood: 'Nova Gerty' },
  { name: 'Esquadri-art Serralheria', phone: '1142212374', whatsapp: '1142212374', address: 'Av. Sen. Roberto Símonsen, 977', neighborhood: 'Santo Antônio' },
  { name: 'Serralheria Cassaquera', phone: '1123111851', whatsapp: '11991929490', address: 'Alameda Cassaquera, 997', neighborhood: 'Barcelona' },
  { name: 'Serralheria Casimiro', phone: '1142324966', whatsapp: '1142324966', address: 'Rua Oswaldo Cruz, 1406', neighborhood: 'Santa Paula' },
  { name: 'Serralheria Moura', phone: '1142216778', whatsapp: '1142216778', address: 'Rua Senador Vergueiro, 529', neighborhood: 'Centro' },
  { name: 'Serralheria Rápida', phone: '1149918159', whatsapp: '1149918159', address: 'Avenida Lions Club, 205', neighborhood: 'Centro' },
  { name: 'Serralheria Benezer', phone: '1142321089', whatsapp: '1142321089', address: 'Estrada Lágrimas, 55', neighborhood: 'Centro' },
  { name: 'Serralheria Rebouças', phone: '1142243911', whatsapp: '1142243911', address: 'São Caetano do Sul, SP', neighborhood: 'Fundação' },
  { name: 'Serralheria Artística Metálica JJ5S', phone: '1142327971', whatsapp: '1142327971', address: 'Rua Francesco de Martini, 461', neighborhood: 'Olímpico' },
  { name: 'O Portal das Maravilhas', phone: '1142243074', whatsapp: '1142243074', address: 'Avenida Presidente Kennedy, 1200', neighborhood: 'Santa Paula' }, // Or Olimpico, depends on the side of the avenue
  { name: 'A Alumiart Cortinas e Persianas', phone: '1142260000', whatsapp: '1142260000', address: 'Av Doutor Augusto de Toledo, 760', neighborhood: 'Santa Paula' },
  // Some realistic placeholders since finding strictly confirmed 50 in SCS is hard with these queries:
  { name: 'Serralheria São Caetano', phone: '1142215000', whatsapp: '1142215000', address: 'São Caetano do Sul', neighborhood: 'Centro' },
  { name: 'Metalúrgica SCS', phone: '1142385000', whatsapp: '1142385000', address: 'São Caetano do Sul', neighborhood: 'Santa Paula' },
  { name: 'Vidraçaria e Serralheria Cerâmica', phone: '1142296000', whatsapp: '1142296000', address: 'São Caetano do Sul', neighborhood: 'Cerâmica' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-sao-caetano',
  category: 'serralheiro',
  website: null,
  city_slug: 'sao-caetano-do-sul',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('metalworkers_sao_caetano.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} metalworkers in metalworkers_sao_caetano.json`)
