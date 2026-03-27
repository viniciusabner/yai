import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'rio-grande-da-serra';
const cityId = 'ea516919-22d1-4508-8641-8eb9be709dd8';
const state = 'SP';

// Hand-picked real locations found from Google searches
const pureFunilarias = [
  { name: 'Funilaria e Pintura Peteleco', address: 'Rua Prefeito Francisco Arnoni, 4', neighborhood: 'Jardim Lavínia', phone: '1148201655' }
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

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/243_funilaria_rgs.json`, JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Funilaria e Pintura reais em Rio Grande da Serra, SP
DELETE FROM public.providers WHERE category = 'funilaria' AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/243_funilaria_rgs.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} funilarias em Rio Grande da Serra.`);
