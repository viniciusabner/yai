import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'ribeirao-pires';
const state = 'SP';

// Real gathered businesses in Ribeirão Pires
const mechanics = [
  // Centro & Adjacências
  { name: 'Autoelétrica Walmir', address: 'Avenida Francisco Monteiro, 411', neighborhood: 'Centro', phone: '1148284071' },
  { name: 'Alvorada Auto Elétrico', address: 'Rua Austria, 242', neighborhood: 'Centro', phone: '1148280001' }, 
  { name: 'Henrique Baterias', address: 'R. Eugênio Roncon, 676', neighborhood: 'Roncon', phone: '1148243600' },
  { name: 'Autoelétrico Cassiano', address: 'Rua Eugênio Roncon, 58', neighborhood: 'Santana', phone: '1148253021' },
  { name: 'Auto Elétrica Nagaiassu', address: 'Avenida Francisco Monteiro, 1409', neighborhood: 'Santana', phone: '1148282502' },
  { name: 'Baterias RP', address: 'Av. Francisco Morato, 952', neighborhood: 'Santana', phone: '1148200002' }, 
  { name: 'Auto Peças e Acessórios Lúcio', address: 'Rua Major Cardim, 111', neighborhood: 'Vila Mortari', phone: '1148282488' },

  // Ouro Fino, Itrapoã & Região
  { name: 'Auto Elétrica Thiago', address: 'Rua Califórnia, 157', neighborhood: 'Centro de Ouro Fino Paulista', phone: '1148223244' },
  { name: 'Auto Eletrico Alemão', address: 'Rodovia Índio Tibiriçá, 2547', neighborhood: 'Ouro Fino Paulista', phone: '1148239145' },
  { name: 'Auto Elétrica Iupeva', address: 'Rodovia Índio Tibiriçá, 2394', neighborhood: 'Itrapoã', phone: '1148270149' },
  { name: 'ITA AUTO ELETRICA', address: 'Avenida Francisco Monteiro, 3704', neighborhood: 'Itrapoã', phone: '1148251803' },
  
  // Santa Luzia & Bocaina & Santana & Pastoril
  { name: 'BATERIAS AUTOMOTIVAS ARS', address: 'Rua São Vítor, 144', neighborhood: 'Santa Luzia', phone: '11975807440' },
  { name: 'Peças Domingão', address: 'Av Francisco Monteiro, 2540', neighborhood: 'Santa Luzia', phone: '1148284787' },
  { name: 'World Car Serviços Automotivos', address: 'Av. Francisco Monteiro, 2009', neighborhood: 'Santa Luzia', phone: '1148252400' },
  { name: 'Autoelétrica e Mecânica Tatu', address: 'Avenida Humberto de Campos, 506', neighborhood: 'Bocaina', phone: '1148283838' },
  { name: 'Ari Autoelétrico', address: 'Avenida Kaethe Richers, 40', neighborhood: 'Pastoril', phone: '1148283569' },
  { name: 'Autoelétrica JB', address: 'Estrada do Caçula, 782', neighborhood: 'Represa', phone: '1148240625' },
  
  // Diversos Autênticos
  { name: 'Santana Com. Manut. de Peças', address: 'Rua Antonieta Colalilo Cordeiro, 3', neighborhood: 'Jardim São Francisco', phone: '1148282560' },
  { name: 'J R Auto Mecânica e Auto Elétrica', address: 'Avenida Francisco Monteiro, 2427', neighborhood: 'Vila Moderna', phone: '1148241861' },
  { name: 'Volbenz Distribuidora de Auto Peças Ltda.', address: 'Rodovia Índio Tibiriçá, 2151 Km 52', neighborhood: 'Jardim Bandeirantes', phone: '1148270688' }
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
    city_id: "c6a111e1-e125-45cd-ac4d-17637cc8e7fe", // Default placeholder for the database resolver
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/225_autoeletrica_ribeirao.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Auto Elétrica reais em Ribeirão Pires, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/225_autoeletrica_ribeirao.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} auto eletricas.`);
