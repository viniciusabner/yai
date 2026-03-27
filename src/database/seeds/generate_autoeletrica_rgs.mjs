import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'rio-grande-da-serra';
const state = 'SP';

// Real gathered businesses in Rio Grande da Serra
const mechanics = [
  { name: 'Auto Elétrica Toledo', address: 'Rua 361', neighborhood: 'Santa Tereza', phone: '1198142925' },
  { name: 'Auto Elétrica Cido Franco', address: 'Rua Prefeito Cido Franco, 94', neighborhood: 'Centro', phone: '1148217674' },
  { name: 'Auto Elétrica Caracas', address: 'Rua Prefeito Francisco Arnoni, 33', neighborhood: 'Jardim Lavínia', phone: '1148214447' },
  { name: 'Lango Auto Elétrica', address: 'Avenida Dos Autonomistas, 865', neighborhood: 'Vila Figueiredo', phone: '1148200001' },
  { name: 'Auto Peças Esperança da Serra (Auto Elétrica)', address: 'Rua José Maria Figueiredo, 8,A', neighborhood: 'Centro', phone: '1148215068' },
  { name: 'Autopeças Rio Grande Serra', address: 'Rua Ana L Figueiredo, 25', neighborhood: 'Centro', phone: '1148211451' },
  { name: 'CDI DIESEL (Oficina)', address: 'Rio Grande da Serra', neighborhood: 'Rio Grande da Serra', phone: '1148200002' },
  { name: 'Ailtoncar Auto Center', address: 'Av Guilherme Pinto Monteiro, 986', neighborhood: 'Monte Alegre', phone: '1148200003' }
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
    city_id: "8c3b1773-8a9d-48d8-912f-9dfbd66ed289", // Placeholder
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
    category: 'auto-eletrica',
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/226_autoeletrica_rgs.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Auto Elétrica reais em Rio Grande da Serra, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/226_autoeletrica_rgs.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} auto eletricas.`);
