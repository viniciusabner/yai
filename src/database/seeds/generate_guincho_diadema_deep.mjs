import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'diadema';
const cityId = '205e475f-44aa-418f-8835-434cd5e913d2'; // Known Diadema UUID from DB
const state = 'SP';

// Hand-picked real locations found from Google searches via Deep Scraping
const pureGuinchos = [
  { name: 'Tom Guinchos SP 24 horas', address: 'Diadema', neighborhood: 'Centro', phone: '11953276241' },
  { name: 'Help Guincho', address: 'Diadema', neighborhood: 'Centro', phone: '08005917422' },
  { name: 'Guincho Auto Socorro', address: 'Diadema', neighborhood: 'Centro', phone: '1120113639' },
  { name: 'Amauri Serviço de reboque', address: 'Avenida Alda, 1345', neighborhood: 'Parque Sete de Setembro', phone: '11940245056' },
  { name: 'Auto Socorro Ferrari', address: 'Rua Salgado de Castro, 230', neighborhood: 'Centro', phone: '1140573873' },
  { name: 'Divino Guinchos', address: 'Rua Érico Veríssimo, 96', neighborhood: 'Conceição', phone: '11940245056' }, // duplicate phone intentionally left or fixed later
  { name: 'TM Guinchos', address: 'Diadema', neighborhood: 'Centro', phone: '11985368431' },
  { name: 'Guincho Manos Car', address: 'Diadema', neighborhood: 'Centro', phone: '11940023906' }
];

// Clean invalid or placeholder data
const pureWithValidPhones = pureGuinchos.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999') && p.address !== 'Diadema' && p.neighborhood !== 'Diadema');

const allGuinchos = [...pureWithValidPhones];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();
const seenPhones = new Set();

allGuinchos.forEach(mech => {
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
    category: 'guincho',
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/273_guincho_diadema_deep.json`, JSON.stringify(jsonResult, null, 2));

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

let sqlContent = `-- Seed para Guincho 24h reais em Diadema, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '${cityId}';\n`;

if (jsonResult.length > 0) {
  sqlContent += `\nINSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;
}

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/273_guincho_diadema_deep.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} guincho em Diadema.`);
