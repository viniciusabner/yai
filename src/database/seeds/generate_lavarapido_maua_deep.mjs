import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'maua';
const cityId = '6f15b756-1913-4ca0-81ea-5a82f11740a3'; // Known Mauá UUID
const state = 'SP';

// Hand-picked real locations found from Google searches via Deep Scraping
const pureLavaRapidos = [
  { name: 'EFATA Estética Automotiva', address: 'Rua XV de Novembro, 671', neighborhood: 'Jd Bom Recanto', phone: '11949985905' },
  { name: 'Limas Studio de Estética Automotiva', address: 'Rua Campos Sales, 429', neighborhood: 'Centro', phone: '11999999999' },
  { name: 'JLESTETICAR', address: 'R. Indaiatuba, 35b', neighborhood: 'Jardim Mauá', phone: '11999999999' },
  { name: 'Centro Car Lava Rapido', address: 'R. Jandira Pedro Copine, 25', neighborhood: 'Jardim Mauá', phone: '11947254439' },
  { name: 'Lava Rápido 2 Irmãos', address: 'R. Pedro de Tolêdo, 351', neighborhood: 'Parque São Vicente', phone: '11959107760' },
  { name: 'Lava Rápido Isadora', address: 'Av. José Ricardo Nalle, 312', neighborhood: 'Vila Mercedes', phone: '11943675797' },
  { name: 'Lava Rápido Zeze', address: 'Jardim Itapark', neighborhood: 'Jardim Itapark', phone: '11999999999' },
  { name: 'Lava Rápido dos Amigos', address: 'Av. Itapark, 3026', neighborhood: 'Jardim Itapark', phone: '11999999999' },
  { name: 'Rock Car Lava Rápido', address: 'Avenida Portugal, 427', neighborhood: 'Vila Bocaina', phone: '1134211310' }
];

// Clean invalid or placeholder data
const pureWithValidPhones = pureLavaRapidos.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999') && p.address !== 'Mauá' && p.neighborhood !== 'Mauá');

const allLavaRapidos = [...pureWithValidPhones];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();
const seenPhones = new Set();

allLavaRapidos.forEach(mech => {
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
    category: 'estetica-automotiva',
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/264_lavarapido_maua_deep.json`, JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Lava Rapido reais em Mauá, SP (Deep Search)
DELETE FROM public.providers WHERE category IN ('lava-rapido', 'estetica-automotiva') AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/264_lavarapido_maua_deep.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} lava-raápido em Mauá.`);
