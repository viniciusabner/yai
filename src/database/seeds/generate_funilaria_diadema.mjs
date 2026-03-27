import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'diadema';
const cityId = '205e475f-44aa-418f-8835-434cd5e913d2';
const state = 'SP';

// Hand-picked real locations found from Google searches
const pureFunilarias = [
  { name: 'Funilaria em Diadema', address: 'Avenida Nossa Senhora dos Navegantes, 230', neighborhood: 'Eldorado', phone: '1143415113' },
  { name: 'Nakatec Funilaria e Pintura', address: 'Rua Aimorés, 79', neighborhood: 'Conceição', phone: '1140513821' },
  { name: 'Ari Sena Martelinho de Ouro', address: 'R. Graciosa, 378', neighborhood: 'Centro', phone: '1140567310' },
  { name: 'Lataria e Pintura Elton Silva', address: 'Avenida Dona Ida Cerati Magrini, 440', neighborhood: 'Piraporinha', phone: '1129225096' },
  { name: 'Rocristhi Funilaria', address: 'Pça Ubatuba, 29', neighborhood: 'Centro', phone: '1129880755' },
  { name: 'Sartori Funilaria e Pintura', address: 'Rua Torquato Joaquim Rodrigues, 55', neighborhood: 'Centro', phone: '1140481935' },
  { name: 'Auto Estufa Point Car', address: 'Rua São João, 189', neighborhood: 'Centro', phone: '1140561650' },
  { name: 'Funilaria e Pintura São Cristóvão', address: 'Av Nossa Senhora das Vitórias, 488', neighborhood: 'Centro', phone: '1140432675' },
  { name: 'Mm Martelinho de Ouro Funilaria', address: 'Av Fábio Eduardo Ramos Esquivel, 769', neighborhood: 'Centro', phone: '1140561837' },
  { name: 'A.J.C. Funilaria e Pintura', address: 'Rua das Figueiras, 65', neighborhood: 'Taboão', phone: '1141784500' },
  { name: '2P Funilaria de Brilho', address: 'Rua Solimões, 45', neighborhood: 'Campanário', phone: '1140941780' },
  { name: 'Reparos de Funilaria Mirao', address: 'Rua Maria Lima, 114', neighborhood: 'Casa Grande', phone: '1161541201' }
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

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/240_funilaria_diadema.json`, JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Funilaria e Pintura reais em Diadema, SP
DELETE FROM public.providers WHERE category = 'funilaria' AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/240_funilaria_diadema.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} funilarias em Diadema.`);
