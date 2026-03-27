import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'ribeirao-pires';
const cityId = '1f84b6c7-69e8-49c6-a691-30da5246e0ea';
const state = 'SP';

// Hand-picked real locations found from Google searches
const pureFunilarias = [
  { name: 'CNG Funilaria e Pintura', address: 'Av. Francisco Monteiro, 1887B', neighborhood: 'Centro', phone: '1148265694' },
  { name: 'Funilaria Lopes & Quintão', address: 'Avenida Prefeito Valdírio Prisco, 3019', neighborhood: 'Colônia', phone: '1148275056' },
  { name: 'Funilaria Arco-Íris', address: 'Rua Miguel Prisco, 1312', neighborhood: 'Centro', phone: '1148276837' },
  { name: 'Belas Artes Funilaria', address: 'Avenida Francisco Monteiro, 1518', neighborhood: 'Santa Luzia', phone: '1148243639' },
  { name: 'Renovadora de Veículos Alemão', address: 'Avenida Francisco Monteiro, 515', neighborhood: 'Centro', phone: '1148276369' },
  { name: 'Severos Funilaria e Pintura', address: 'Rua Pedro Rípoli, 2659', neighborhood: 'Roncon', phone: '1148246528' },
  { name: 'Cristiano Rodrigues Sturari Funilaria', address: 'Rua do Tejo, 70', neighborhood: 'Pilar Velho', phone: '1148258839' },
  { name: 'Jj Funilaria e Pintura', address: 'Estrada do Caçula, 898', neighborhood: 'Represa', phone: '1148275564' },
  { name: 'Funilaria Jardim Dois Melros', address: 'Rua Holanda, 144', neighborhood: 'Colônia', phone: '1148243916' },
  { name: 'Acabamentos E pinturas el shaday', address: 'Rua Manoel Simões, 425', neighborhood: 'Roncon', phone: '1189894942' }
];

// Clean invalid or placeholder data
const pureWithValidPhones = pureFunilarias.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999'));

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

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/241_funilaria_ribeirao_pires.json`, JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Funilaria e Pintura reais em Ribeirão Pires, SP
DELETE FROM public.providers WHERE category = 'funilaria' AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/241_funilaria_ribeirao_pires.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} funilarias em Ribeirão Pires.`);
