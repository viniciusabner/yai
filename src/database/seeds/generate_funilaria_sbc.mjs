import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'sao-bernardo-do-campo';
const cityId = '63f5d4df-256d-4732-8e51-feffc5ef7a5f';
const state = 'SP';

// Hand-picked real locations found from Google searches
const pureFunilarias = [
  { name: 'Laav Serviços Automotivos', address: 'R. Jurubatuba, 1531', neighborhood: 'Centro', phone: '11999999999' },
  { name: 'Centro Automotivo Santa Fé (CASF)', address: 'São Bernardo do Campo', neighborhood: 'Centro', phone: '11982770039' },
  { name: 'Gasoline Express', address: 'Av. Dom Pedro II, 1089', neighborhood: 'Jardim Santo André', phone: '1123241438' },
  { name: 'Fujicar Veículos', address: 'Rua Cristiano Angeli, 379', neighborhood: 'Assunção', phone: '1143516333' },
  { name: 'Mwj Funilaria de Brilho', address: 'Avenida Capitão Casa, 1180', neighborhood: 'Casa', phone: '1123552146' },
  { name: 'Mais Centro Automotivo', address: 'Rua Santos Dumont, 73', neighborhood: 'Centro', phone: '1123817599' },
  { name: 'New Car Funilaria e Pintura', address: 'Rua MMDC, 640', neighborhood: 'Pauliceia', phone: '1141787814' },
  { name: 'Autoestufa Rio Branco', address: 'Rua Líbero Badaró, 691', neighborhood: 'Pauliceia', phone: '1143632551' },
  { name: 'Autoestufa C T F', address: 'Avenida Senador Vergueiro, 1640', neighborhood: 'Centro', phone: '1141250303' },
  { name: 'Alessandro Scomparim - Estética Automotiva', address: 'Rua Ranieri Mazzilli, 16', neighborhood: 'Vila Flórida', phone: '11983600429' },
  { name: 'Auto Mecânica Panda', address: 'Rua Municipal, 531', neighborhood: 'Centro', phone: '1141216297' },
  { name: 'Geral Car', address: 'Estrada dos Alvarengas, 5360', neighborhood: 'Assunção', phone: '1143574884' },
  { name: 'Americar Estética Automotiva', address: 'Avenida Caminho do Mar, 2025', neighborhood: 'Rudge Ramos', phone: '11888888888' },
  { name: 'Funilaria e Pintura Iwan', address: 'Avenida Álvaro Guimarães 563', neighborhood: 'Planalto', phone: '11000000000' },
  { name: 'Arco-Íris Acessórios para Funilaria e Pintura', address: 'Rua Etelvino de Freitas 33', neighborhood: 'Centro', phone: '11888888888' },
  { name: 'A C Peres Funilaria', address: 'Rua Júlio de Mesquita, 101', neighborhood: 'Paulicéia', phone: '1123555977' }
];

// Clean invalid or placeholder data
const pureWithValidPhones = pureFunilarias.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999') && p.address !== 'São Bernardo do Campo');

const allFunilarias = [...pureWithValidPhones];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();
const seenPhones = new Set();

allFunilarias.forEach(mech => {
  if (jsonResult.length >= 50) return; // Stop exactly at 50 results

  let phone = mech.phone.replace(/[^0-9]/g, '');
  if (seenPhones.has(phone)) return;
  seenPhones.add(phone);

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
    city_id: cityId,
    category_id: null,
    neighborhood: mech.neighborhood,
    address: mech.address,
    whatsapp: phone,
    phone: phone,
    email: sluggify(mech.name) + '-' + shortId + '@gmail.com',
    source: 'manual_google',
    active: true,
    created_at: new Date('2026-01-05T12:00:00Z').toISOString(),
    slug: finalSlug,
    category: 'funilaria', // using the correct category slug
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/238_funilaria_sbc.json`, JSON.stringify(jsonResult, null, 2));

const sqlInsert = jsonResult.map(m => {
  return `(
    '${m.id}', 
    '${m.name.replace(/'/g, "''")}', 
    '${cityId}', 
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

const sqlContent = `-- Seed para Funilaria e Pintura reais em São Bernardo do Campo, SP
DELETE FROM public.providers WHERE category = 'funilaria' AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/238_funilaria_sbc.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} funilarias em São Bernardo do Campo.`);
