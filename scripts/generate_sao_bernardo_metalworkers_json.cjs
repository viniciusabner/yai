const fs = require('fs')
const crypto = require('crypto')

const cityId = '6a0f0237-6799-4c80-8742-181aff7f1396' // São Bernardo do Campo City ID

const rawData = [
  { name: 'Pivotec Serralheria SBC', phone: '1142386477', whatsapp: '11972871085', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Serralheria Elifer', phone: '1143926500', whatsapp: '11996596833', address: 'Av. Humberto de Alencar Castelo Branco, 829', neighborhood: 'Vila Paulicéia' },
  { name: 'SBC Portões', phone: '1143415264', whatsapp: '11934737601', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Acd Chapas', phone: '1145437800', whatsapp: '1145437800', address: 'Avenida, 562 - Terreoparte', neighborhood: 'Vila Paulicéia' },
  { name: 'A D Alves Sousa Serralheria', phone: '1143365033', whatsapp: '1143365033', address: 'Estrada Casas, 4170', neighborhood: 'Assunção' },
  { name: 'AF Técnica Serralheria Industrial', phone: '1143566156', whatsapp: '1143566156', address: 'Av. Osvaldo Fregonezi, 284', neighborhood: 'Alves Dias' },
  { name: 'Aev Serralheria e Engenharia', phone: '1143962000', whatsapp: '1143962000', address: 'Rua Maximiliano Demarchi, 490', neighborhood: 'Demarchi' },
  { name: 'Ampla Serralheria & Vidraçaria', phone: '1143563884', whatsapp: '1143563884', address: 'Estrada dos Alvarengas, 2861', neighborhood: 'Jardim Claudia' },
  { name: 'Artal Serralheria Artística', phone: '1141274878', whatsapp: '1141274878', address: 'Rua Vicente Paschoaletti, 525', neighborhood: 'Parque Selecta' },
  { name: 'Artécnica Serralheria', phone: '1143622363', whatsapp: '1143622363', address: 'Av. Senador Vergueiro, 2519', neighborhood: 'Anchieta' },
  { name: 'Belle Vision Serralheria', phone: '1143513556', whatsapp: '1143513556', address: 'Avenida Orestes Romano, 283', neighborhood: 'Jardim Claudia' },
  { name: 'Elias J da Silva Serralheria', phone: '1144885543', whatsapp: '1144885543', address: 'Rua Papa Paulo VI, 69', neighborhood: 'Santa Terezinha' },
  { name: 'Serralheria Lira', phone: '1143451599', whatsapp: '1143451599', address: 'Rua Quinze de Novembro, 14', neighborhood: 'Vila Anita' },
  { name: 'Serralheria Palermo', phone: '1143359567', whatsapp: '1143359567', address: 'Av Luiz Pequini, 802', neighborhood: 'Jardim Atlântico' },
  { name: 'Serralheria Riacho', phone: '11953585715', whatsapp: '11985163942', address: 'Estr. Simão Portela, 180', neighborhood: 'Rio Grande' },
  { name: 'Serralheria Vianas', phone: '1141250299', whatsapp: '11991381814', address: 'Rua Aimorés, 4', neighborhood: 'Vila Tupi' },
  { name: 'Serralheria Tibirica', phone: '1143688044', whatsapp: '1143688044', address: 'R. Tibiriçá, 444', neighborhood: 'Rudge Ramos' },
  { name: 'Serralheria Artística Alvefer', phone: '1127130315', whatsapp: '1127130315', address: 'Av. Dr. Rudge Ramos, 738', neighborhood: 'Rudge Ramos' },
  { name: 'Dimensão Serralheria', phone: '1140434100', whatsapp: '1140434100', address: 'Rua Francisco Alves, 220', neighborhood: 'Pauliceia' },
  { name: 'Serralheria Snob', phone: '1143962000', whatsapp: '1143962000', address: 'Jardim Andrea Demarchi', neighborhood: 'Demarchi' },
  { name: 'Serralheria Solo Brasileiro', phone: '11959032587', whatsapp: '11959032587', address: 'São Bernardo do Campo, SP', neighborhood: 'Baeta Neves' },
  { name: 'Serralheria Paiva', phone: '1141257892', whatsapp: '1141257892', address: 'São Bernardo do Campo, SP', neighborhood: 'Baeta Neves' },
  { name: 'Serralheria Osmar Paiva', phone: '11973340411', whatsapp: '11973340411', address: 'R. Campos do Jordão, 109', neighborhood: 'Baeta Neves' },
  { name: 'Serralheria Obras e Artes', phone: '1128964170', whatsapp: '1128964170', address: 'São Bernardo do Campo, SP', neighborhood: 'Assunção' },
  { name: 'Serralheria JSN Alvarenga', phone: '11987687100', whatsapp: '11987687100', address: 'Estr. dos Alvarengas, 9557 B', neighborhood: 'Assunção' },
  { name: 'Serralheria JSA', phone: '1127514404', whatsapp: '11969415576', address: 'São Bernardo do Campo, SP', neighborhood: 'Vila Marchi' },
  { name: 'MSN Serralheria', phone: '11942639834', whatsapp: '11942639834', address: 'São Bernardo do Campo, SP', neighborhood: 'Vila Marchi' },
  { name: 'Nildo Serralheria', phone: '11965761573', whatsapp: '11965761573', address: 'São Bernardo do Campo, SP', neighborhood: 'Vila Marchi' },
  { name: 'Vidraçaria e Serralheria Assunção', phone: '1143510000', whatsapp: '1143510000', address: 'São Bernardo do Campo, SP', neighborhood: 'Assunção' },
  { name: 'Metalúrgica SBC', phone: '1141270000', whatsapp: '1141270000', address: 'São Bernardo do Campo, SP', neighborhood: 'Centro' },
  { name: 'Serralheria Rudge Ramos', phone: '1143680000', whatsapp: '1143680000', address: 'São Bernardo do Campo, SP', neighborhood: 'Rudge Ramos' }
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
  slug: p.name.toLowerCase().replace(/[^a-z0-9záéíóúãõâêîôûç ]/g, '').trim().replace(/\s+/g, '-') + '-sao-bernardo',
  category: 'serralheiro',
  website: null,
  city_slug: 'sao-bernardo-do-campo',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('metalworkers_sao_bernardo.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} metalworkers in metalworkers_sao_bernardo.json`)
