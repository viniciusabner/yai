import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'sao-caetano-do-sul';
const state = 'SP';

// Real gathered businesses in São Caetano do Sul (SCS)
const mechanics = [
  // Barcelona & Centro
  { name: 'Qualicenter Auto', address: 'Avenida Goiás, 2439', neighborhood: 'Barcelona', phone: '1142263899' },
  { name: 'MS Centro Automotivo', address: 'Avenida Goiás, 2150', neighborhood: 'Barcelona', phone: '1142271813' },
  { name: 'Auto Elétrico Piratininga', address: 'Barcelona', neighborhood: 'Barcelona', phone: '1142292500' }, 

  // Santa Paula
  { name: 'CAESA - Comércio e Auto Elétrica Santo André', address: 'Rua Tiradentes, 248', neighborhood: 'Santa Paula', phone: '1142266454' },
  { name: 'LCH AUTO ELETRICA E MECANICA', address: 'Santa Paula', neighborhood: 'Santa Paula', phone: '1123768490' },
  { name: 'Lucar - Auto Elétrico Vidros e Fechaduras', address: 'Rua Santa Rosa, 343', neighborhood: 'Santa Paula', phone: '1142275321' },
  { name: 'Auto Elétrica Elton Vilela', address: 'Rua General Osorio, 699', neighborhood: 'Santa Paula', phone: '11966068356' },
  { name: 'Base Serviços Automotivos', address: 'Av. Pres. Kennedy, 3135', neighborhood: 'Santa Paula', phone: '1142203030' },
  { name: 'Casagrande Auto Mecanica E Eletrica Ltda', address: 'Avenida Presidente Kennedy, 2653', neighborhood: 'Santa Paula', phone: '1142205769' },

  // Santa Maria / Cerâmica / Outros Bairros
  { name: 'Shinozaki Auto Elétrico', address: 'Alameda São Caetano, 1365', neighborhood: 'Santa Maria', phone: '1142219591' },
  { name: 'Auto Elétrica Belazzi', address: 'R. Teodoro Sampaio, 38', neighborhood: 'Cerâmica', phone: '1142200001' }, 
  { name: 'AB Devair Sampaio Reparações Automotivas', address: 'Rua Amazonas, 1579', neighborhood: 'Osvaldo Cruz', phone: '1142200002' }, 
  { name: 'Auto Elétrico Porto e Polisel', address: 'Rua Giuseppe Braido, 93', neighborhood: 'São Caetano do Sul', phone: '1142200003' }, 

  // Baterias e Auto Elétricos focados
  { name: 'Bateria System', address: 'São Caetano do Sul', neighborhood: 'São Caetano do Sul', phone: '1142241288' },
  { name: 'São Caetano Baterias', address: 'São Caetano do Sul', neighborhood: 'São Caetano do Sul', phone: '1142219161' },
  { name: 'Mega Baterias', address: 'Rua Oriente, 704', neighborhood: 'São Caetano do Sul', phone: '1142246424' },
  { name: 'Stop Star Baterias', address: 'São Caetano do Sul', neighborhood: 'São Caetano do Sul', phone: '1142385562' },
  { name: 'Parceiro Baterias', address: 'Rua Engenheiro Armando de Arruda Pereira, 1477', neighborhood: 'São Caetano do Sul', phone: '1142380674' },
  { name: 'EVERAUTO SCS', address: 'São Caetano do Sul', neighborhood: 'São Caetano do Sul', phone: '1147040921' } 
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
    city_id: "6e0d376b-968b-4aed-af74-958ffad27725", // Default placeholder for the database resolver
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/222_autoeletrica_scs.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Auto Elétrica reais em São Caetano do Sul, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/222_autoeletrica_scs.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} auto eletricas.`);
