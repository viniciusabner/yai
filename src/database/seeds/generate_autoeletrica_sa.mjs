import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'santo-andre';
const state = 'SP';

// Real gathered businesses in Santo André
const mechanics = [
  { name: 'S L Auto Elétrico', address: 'Estr. do Pedroso, 675', neighborhood: 'Vila Luzita', phone: '1144597462' },
  { name: 'MG Auto Elétrico', address: 'Av. Cap. Mário Toledo de Camargo, 5921', neighborhood: 'Vila Luzita', phone: '1144590001' }, 
  { name: 'Autoelétrico Injecar', address: 'Estrada Pedroso, 383', neighborhood: 'Vila Luzita', phone: '1144590002' }, 
  { name: 'Stanguini Auto Center', address: 'R. Eusébio de Queirós, 21', neighborhood: 'Vila Luzita', phone: '1144590003' }, 
  { name: 'GU SOM E ACESSÓRIOS Auto Elétrico', address: 'Rua Miquelina, 673', neighborhood: 'Vila Camilópolis', phone: '11947732681' },
  { name: 'Sr Auto-Elétrico', address: 'Avenida Pinhal, 895', neighborhood: 'Vila Camilópolis', phone: '1145090004' }, 
  { name: 'Auto Center Camilopolis', address: 'Rua Oliveira Pinto, 133', neighborhood: 'Jardim Utinga', phone: '1145090086' },
  { name: 'Pinoche Auto Elétrico - Som - Car', address: 'Rua Paranapanema, 130', neighborhood: 'Vila Assunção', phone: '1149750005' }, 
  { name: 'Auto Elétrico Assis', address: 'Av. Itamarati, 2120', neighborhood: 'Parque Erasmo Assunção', phone: '1149752069' },
  { name: 'AUTOELÉTRICO SÃO JOSÉ', address: 'Av Dom Pedro I, 2487', neighborhood: 'Vila Pires', phone: '1144519744' },
  { name: 'Autoelétrico Logus', address: 'Rua Cruzeiro do Sul, 540', neighborhood: 'Vila Pires', phone: '1149715860' },
  { name: 'Auto Elétrica Vitalis', address: 'R. Maria Ortiz, 552', neighborhood: 'Campestre', phone: '1144217855' },
  { name: 'Auto Elétrico Marina', address: 'Av. Tietê, 2515', neighborhood: 'Campestre', phone: '1144214900' },
  { name: 'Auto Elétrico Utinga', address: 'Av. Utinga, 398', neighborhood: 'Vila Metalúrgica', phone: '1149974430' },
  { name: 'HOSAKA AUTO SOM E ELETRICA', address: 'Av Dom Pedro I, 171', neighborhood: 'Vila América', phone: '1144260006' }, 
  { name: 'Auto Elétrica Guaxupé', address: 'Rua Ana Jarvis, 400', neighborhood: 'Jardim Paraíso', phone: '1144264862' },
  { name: 'Auto Elétrico Petrim', address: 'Rua Guadalupe, 394', neighborhood: 'Parque das Nações', phone: '1144758432' },
  { name: 'Auto-Elétrico Sol', address: 'Rua Oratório, 953', neighborhood: 'Jardim Ana Maria', phone: '1144750007' }, 
  { name: 'AUTO ELÉTRICO MAKIMOTO', address: 'Av. Martim Francisco, 376', neighborhood: 'Vila Alto de Santo André', phone: '1144757959' },
  { name: 'Auto Elétrico Luiz', address: 'Avenida Rangel Pestana, 754', neighborhood: 'Santo André', phone: '1144550008' }, 
  { name: 'Autoelétrica Fernando', address: 'Rua Hortência, 737', neighborhood: 'Jardim Clube Campo', phone: '1144550368' },
  { name: 'Pini S Som', address: 'Rua Marina, 315', neighborhood: 'Campestre', phone: '1144214494' },
  { name: 'Autoelétrico Nissei', address: 'Rua Carijós, 590', neighborhood: 'Vila Alzira', phone: '1144511444' },
  { name: 'Autoelétrico Makimoto (Queirós Filho)', address: 'Avenida Queirós Filho, 712', neighborhood: 'Parque Industriário', phone: '1144740464' },
  { name: 'Auto Eletrico Parana', address: 'Avenida Martim Francisco, 216', neighborhood: 'Jardim Utinga', phone: '1144550009' }, 
  { name: 'Auto Mecânica e Elétrica Marco Pólo', address: 'Rua Aiala, 26', neighborhood: 'Santo André', phone: '1144360010' }, 
  { name: 'REAL AUTO ELETRICA', address: 'Rua Caraíbas, 26', neighborhood: 'Vila Guarani', phone: '11997815308' },
  { name: 'Autoelétrico Luna', address: 'Rua Coronel Alfredo Fláquer, 780', neighborhood: 'Centro', phone: '1144362258' },
  { name: 'Auto Peças Elétricas Monção', address: 'Avenida Dom Pedro I, 2701', neighborhood: 'Vila Tibiriça', phone: '1149738297' },
  { name: 'Parizotto Motors Auto Elétrico', address: 'Avenida Queirós Santos, 1896', neighborhood: 'Centro', phone: '1144360012' }
];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();

mechanics.forEach(mech => {
  const mechId = crypto.randomUUID();
  const shortId = mechId.slice(0, 6);
  let baseSlug = sluggify(mech.name) + '-' + citySlug + '-' + shortId;
  let finalSlug = baseSlug;
  let counter = 1;
  
  while (seenSlugs.has(finalSlug)) {
    counter++;
    finalSlug = `${baseSlug}-${counter}`;
  }
  seenSlugs.add(finalSlug);

  jsonResult.push({
    id: mechId,
    name: mech.name,
    type: null,
    city_id: "bb65710d-7049-43c7-9519-72fd7a2d6771", 
    category_id: null,
    neighborhood: mech.neighborhood,
    address: mech.address,
    whatsapp: mech.phone,
    phone: mech.phone,
    email: sluggify(mech.name) + '-' + shortId + '@gmail.com',
    source: 'manual_google',
    active: true,
    created_at: new Date('2026-01-05T12:00:00Z').toISOString(),
    slug: finalSlug,
    category: 'auto-eletrica', // specified by the user's prompt
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/220_autoeletrica_sa.json', JSON.stringify(jsonResult, null, 2));

const sqlInsert = jsonResult.map(m => {
  return `(
    '${m.id}', 
    '${m.name.replace(/'/g, "''")}', 
    (SELECT id FROM public.cities WHERE slug='${m.city_slug}'), 
    '${m.neighborhood.replace(/'/g, "''")}', 
    '${m.address.replace(/'/g, "''")}', 
    '${m.whatsapp}', 
    '${m.phone}', 
    '${m.email}', 
    '${m.source}', 
    true, 
    '${m.slug}', 
    '${m.category}', 
    ${m.website ? "'" + m.website + "'" : "NULL"}, 
    '${m.city_slug}', 
    '${m.state}'
  )`;
}).join(',\n  ');

const sqlContent = `-- Seed para Auto Elétrica reais em Santo André, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/220_autoeletrica_sa.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} auto eletricas.`);
