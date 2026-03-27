const fs = require('fs')
const crypto = require('crypto')

const cityId = '666bbbc3-14dd-46ea-9759-b88bf92b95fa' // Mauá City ID

const rawData = [
  // From Seed Data
  { name: 'DM Portões', phone: null, whatsapp: null, address: 'Mauá - SP', neighborhood: 'Vila Guarani' },
  { name: 'D Ferro Goval', phone: '1140481040', whatsapp: '11988420026', address: 'Mauá - SP', neighborhood: 'Centro' },
  { name: 'Serralheria Solo Brasileiro', phone: null, whatsapp: null, address: 'Mauá - SP', neighborhood: 'Jardim Mauá' },
  { name: 'Teixeirão Serviços', phone: null, whatsapp: null, address: 'Mauá - SP', neighborhood: 'Centro' },
  { name: 'Serralheria Bronzatti', phone: '1145552886', whatsapp: '1145552886', address: 'Rua João, 2120', neighborhood: 'Centro' },
  { name: 'Metálicas 1000', phone: null, whatsapp: null, address: 'Mauá - SP', neighborhood: 'Centro' },
  { name: 'Alemão Serralheria', phone: '1145782699', whatsapp: '1145782699', address: 'R. Natal Bagnara, 97', neighborhood: 'Jardim Bela Vista' },
  { name: 'Alltec Serralheria', phone: '1145764479', whatsapp: '1145764479', address: 'Av. Barão de Mauá, 2599', neighborhood: 'Jardim Mauá' },
  { name: 'Arte em Ferro Serralheria', phone: '1145450542', whatsapp: '1145450542', address: 'Av. Itapark - RP10', neighborhood: 'Centro' },
  { name: 'Casa do Serralheiro', phone: '1145472955', whatsapp: '1145472955', address: 'R. Guatemala, 85', neighborhood: 'Parque das Américas' },
  { name: 'Serralheria Decom', phone: '1128834341', whatsapp: '1128834341', address: 'Av. Pres. Castelo Branco, 828', neighborhood: 'Jardim Zaira' },
  { name: 'DJN Serralheria', phone: '1127621411', whatsapp: '1127621411', address: 'Rua João Carlos Azevedo, 1332', neighborhood: 'Parque Bandeirantes' },
  { name: 'EPM Serralheria', phone: '11986254798', whatsapp: '11986254798', address: 'R. Elza Jorge, 1212', neighborhood: 'Jardim Esperança' },
  { name: 'Serralheria Liliane', phone: '11947959753', whatsapp: '11947959753', address: 'Estrada do Carneiro, 1954', neighborhood: 'Núcleo Sampaio Vidal' },
  { name: 'Serralheria do Beto', phone: '1137137711', whatsapp: '1137137711', address: 'Rua Carlos Campos, 326', neighborhood: 'Jardim Mauá' },
  { name: 'Serralheria Bom Preço', phone: '1145162659', whatsapp: '1145162659', address: 'Av. Presidente Castelo Branco, 2220', neighborhood: 'Jardim Zaira' },

  // New Data
  { name: 'Gilson Serralheria', phone: '11943434827', whatsapp: '11943434827', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Inovart Comunicação visual e serralheria', phone: '11973044543', whatsapp: '11973044543', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Je Global', phone: '1145492315', whatsapp: '1145492315', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Jl Serralherias', phone: '1145134914', whatsapp: '1145134914', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Kaynan Montagem', phone: '1145783520', whatsapp: '1145783520', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'D&S Serralheria', phone: '11972320160', whatsapp: '11972320160', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Luks Serralheria', phone: '1128669889', whatsapp: '1128669889', address: 'Rua Antônio Matrone, 463', neighborhood: 'Jardim Mauá' },
  { name: 'Mediarts', phone: '11977497930', whatsapp: '11977497930', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Polymaj Serralheria', phone: '1145772778', whatsapp: '1145772778', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Presil Serralheria', phone: '1145162890', whatsapp: '1145162890', address: 'Avenida Washington Luiz, 2631', neighborhood: 'Vila Magini' },
  { name: 'Serra Ports GM', phone: '1145443433', whatsapp: '1145443433', address: 'Avenida Jair Balo, 34', neighborhood: 'Alto do Boa Vista' },
  { name: 'Serralheria Pontes', phone: '1145161177', whatsapp: '1145161177', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Serralheria Juliana', phone: '1145454620', whatsapp: '1145454620', address: 'Mauá, SP', neighborhood: 'Jardim Zaira' },
  { name: 'Serralheria G H T', phone: '1144546760', whatsapp: '1144546760', address: 'Mauá, SP', neighborhood: 'Jardim Zaira' },
  { name: 'Serralheria Lucas', phone: '1145455583', whatsapp: '1145455583', address: 'Mauá, SP', neighborhood: 'Jardim Zaira' },
  { name: 'Serralheria Trinca Ferro', phone: '1145417998', whatsapp: '1145417998', address: 'Mauá, SP', neighborhood: 'Jardim Zaira' },
  { name: 'Godefer Portões Automáticos', phone: '1145413010', whatsapp: '1145413010', address: 'Mauá, SP', neighborhood: 'Jardim Zaira' },
  { name: 'Serralheria João Carlos', phone: '1145146099', whatsapp: '1145146099', address: 'Mauá, SP', neighborhood: 'Jardim Zaira' },
  { name: 'Tecfer Serralheria Artística', phone: '1145552899', whatsapp: '1145552899', address: 'R Arthur da Costa e Silva, 235', neighborhood: 'Parque São Vicente' },
  { name: 'Serralheria Canaã', phone: '11950357032', whatsapp: '11950357032', address: 'R. Pres. Venceslau Braz, 64', neighborhood: 'Parque São Vicente' },
  { name: 'S.R. Serralheria', phone: '1128019744', whatsapp: '1128019744', address: 'R. Pres. Carlos Luz, 177', neighborhood: 'Parque São Vicente' },
  { name: 'Serralheria J.J.N.M.', phone: '1145430799', whatsapp: '1145430799', address: 'Mauá, SP', neighborhood: 'Vila Magini' },
  { name: 'MB Serralheria', phone: '11959891040', whatsapp: '11959891040', address: 'Mauá, SP', neighborhood: 'Vila Magini' },
  { name: 'Assis Inox Serralheria', phone: '11997992112', whatsapp: '11997992112', address: 'Mauá, SP', neighborhood: 'Vila Magini' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-maua',
  category: 'serralheiro',
  website: null,
  city_slug: 'maua',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('metalworkers_maua.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} metalworkers in metalworkers_maua.json`)
