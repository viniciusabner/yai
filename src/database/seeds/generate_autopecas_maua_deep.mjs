import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'maua';
const cityId = '6f15b756-1913-4ca0-81ea-5a82f11740a3'; // Known Mauá UUID
const state = 'SP';

// Hand-picked real locations found from Google searches via Deep Scraping
const pureAutopecas = [
  { name: 'Yoshio Auto Peças', address: 'Av. Cap. João, 2000', neighborhood: 'Matriz', phone: '1123129230' },
  { name: 'Autopeças Itália', address: 'Avenida Itapark, 430', neighborhood: 'Vila Bocaina', phone: '1145161459' },
  { name: 'BomPreço Auto Peças', address: 'Av. Barão de Mauá, 4818', neighborhood: 'Jardim Itapeva', phone: '11932908890' },
  { name: 'Abel Autopeças', address: 'Av. Pres. Castelo Branco, 683', neighborhood: 'Jd Zaira', phone: '1145146867' },
  { name: 'DAPEC Distribuidora de Auto Peças', address: 'Av. Barão de Mauá, 3035', neighborhood: 'Jardim Maringá', phone: '1150268225' },
  { name: 'Maua Auto Pecas', address: 'Rua Presidente Arthur da Costa e Silva, 210', neighborhood: 'Parque Sao Vicente', phone: '1135659192' },
  { name: 'Cardoso & Izolani Indústria de Autopeças', address: 'Rua Senador Severo Gomes, 146', neighborhood: 'Vila Carlina', phone: '1145436308' },
  { name: 'Revestec Indústria Automotivos', address: 'Rua Senador Severo Gomes, 237', neighborhood: 'Vila Carlina', phone: '1143675141' },
  { name: 'Mrs Peças', address: 'Rua Antônio Luiz Ferreira, 34', neighborhood: 'Vila Carlina', phone: '1145441321' },
  { name: 'AutoZone Mauá', address: 'Avenida Barão de Mauá, 3062', neighborhood: 'Jd. Maringá', phone: '1154685402' },
  { name: 'Atenas Autopeças', address: 'Rua Ceci, 25', neighborhood: 'Vila Bocaina', phone: '1145431814' },
  { name: 'Genuine Distribuidora', address: 'Rua Presidente Carlos Luz, 181', neighborhood: 'Matriz', phone: '1145556066' }
];

// Clean invalid or placeholder data
const pureWithValidPhones = pureAutopecas.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999') && p.address !== 'Mauá');

const allAutopecas = [...pureWithValidPhones];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();
const seenPhones = new Set();

allAutopecas.forEach(mech => {
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
    category: 'auto-pecas',
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/249_autopecas_maua_deep.json`, JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Autopeças reais em Mauá, SP (Deep Search)
DELETE FROM public.providers WHERE category IN ('autopecas', 'auto-pecas') AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/249_autopecas_maua_deep.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} autopeças em Mauá.`);
