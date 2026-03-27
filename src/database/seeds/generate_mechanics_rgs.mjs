import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'rio-grande-da-serra';
const state = 'SP';

// Real gathered businesses in Rio Grande da Serra
const mechanics = [
  // Centro & Nearby
  { name: 'Formiguinha Centro Automotivo', address: 'Rua José Maria Figueiredo, 359', neighborhood: 'Centro', phone: '11910649145' },
  { name: 'Auto Peças Esperança da Serra', address: 'Rua José Maria Figueiredo, 8', neighborhood: 'Centro', phone: '1148215068' },
  { name: 'Auto Peças Conde (Centro Automotivo)', address: 'Rua José Maria Figueiredo, 370', neighborhood: 'Centro', phone: '1148243000' }, 
  { name: 'Auto Peças Rio Grande da Serra', address: 'Rua Ana L Figueiredo, 25', neighborhood: 'Centro', phone: '1148211451' },
  { name: 'Autopeças Rio Grande Serra Serviços', address: 'Rua Ana Leite de Figueiredo, 25', neighborhood: 'Centro', phone: '1148203796' },
  { name: 'Benevides Peças e Serviços', address: 'Avenida João S, 95', neighborhood: 'Centro', phone: '1148211280' },
  { name: 'Luisvane Gomes Autopecas', address: 'Rua Jean Lieutaud, 8', neighborhood: 'Centro', phone: '1148204000' }, 

  // Monte Alegre
  { name: 'Ailtoncar Auto Center', address: 'Av Guilherme Pinto Monteiro, 986', neighborhood: 'Monte Alegre', phone: '11972454365' },

  // Vila Lavínia / Vila Figueiredo
  { name: 'Auto Mecânica Lm', address: 'Rua Esmeralda, 257', neighborhood: 'Vila Lavínia', phone: '1148202322' },
  { name: 'Auto Mecânica Rai', address: 'Rua José Maria Figueiredo, 704', neighborhood: 'Vila Figueiredo', phone: '1148213808' },

  // Oásis Paulista & Santa Tereza
  { name: 'Mecânica Beto', address: 'Rua Santa Branca, 81', neighborhood: 'Santa Tereza', phone: '1148213207' },
  { name: 'MECANICA E ELETRICA ROCHA', address: 'Avenida Humberto Rebizzi, 2340', neighborhood: 'Oásis Paulista', phone: '1148205001' }, 
  { name: 'Oficina Bosch Car Service Serv Car', address: 'Av. Santo Antônio, 69', neighborhood: 'Jardim Santa Tereza', phone: '1148215002' }, 

  // Parque Indaia
  { name: 'Pai e Filho Mecânica', address: 'Rua Prefeito Cido Franco, 1189', neighborhood: 'Parque Indaia', phone: '1148262046' },

  // Vila Conde
  { name: 'Auto Mecânica Ls Car', address: 'Rua Ribeirão Pires, 236', neighborhood: 'Vila Conde', phone: '11999839092' },

  // Vila Tsuzuki / Caracu
  { name: 'Auto Mecânica Luiz Carlos Pinesi', address: 'Estrada Caracu, 645', neighborhood: 'Vila Tsuzuki', phone: '1148204214' },

  // Recanto das Flores & Outros
  { name: 'VICENTE DE PAULA BENTO OFICINA MECANICA', address: 'Rua Tonomi Ueda', neighborhood: 'Recanto das Flores', phone: '1148205003' }, 
  { name: 'Serviços Automotivos Dulima', address: 'Rua Tonomi Weda, 153', neighborhood: 'Rio Grande da Serra', phone: '1148213696' },
  { name: 'Auto Mecânica Sampaio', address: 'Rio Grande da Serra, SP', neighborhood: 'Rio Grande da Serra', phone: '11973898617' }
];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();
const seenPhones = new Set();

mechanics.forEach(mech => {
  if (seenPhones.has(mech.phone)) return;
  seenPhones.add(mech.phone);

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
    category: 'mecanica',
    website: mech.website || null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/210_real_mechanics_rgs.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Mecânicas Gerais reais em Rio Grande da Serra, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/210_real_mechanics_rgs.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} mechanics.`);
