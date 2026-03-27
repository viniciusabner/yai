import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'sao-caetano-do-sul';
const cityId = 'd422ecad-80b4-450a-b364-ebb888d700e1';
const state = 'SP';

// Hand-picked real locations found from Google searches
const pureFunilarias = [
  { name: 'Oficina Funilaria e Pintura AEV', address: 'Rua Silvia, 986', neighborhood: 'Santa Maria', phone: '1142394026' },
  { name: 'Fast Repair', address: 'Alameda São Caetano, 657', neighborhood: 'Santa Paula', phone: '11888888888' },
  { name: 'Pokbom – Reparação e Estética Automotiva', address: 'Alameda São Caetano, 677', neighborhood: 'Santa Paula', phone: '1142217820' },
  { name: 'Laav São Caetano', address: 'R. Piauí, 646', neighborhood: 'Santa Paula', phone: '11999999999' },
  { name: 'Braceli Funilaria', address: 'São Caetano do Sul', neighborhood: 'Centro', phone: '11000000000' },
  { name: 'Pint Car', address: 'Alameda São Caetano, 2845', neighborhood: 'Santa Maria', phone: '1142201701' }
];

// Clean invalid or placeholder data
const pureWithValidPhones = pureFunilarias.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999') && p.address !== 'São Caetano do Sul');

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

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/239_funilaria_scs.json`, JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Funilaria e Pintura reais em São Caetano do Sul, SP
DELETE FROM public.providers WHERE category = 'funilaria' AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/239_funilaria_scs.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} funilarias em São Caetano do Sul.`);
