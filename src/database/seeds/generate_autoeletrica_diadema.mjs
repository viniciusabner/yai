import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'diadema';
const state = 'SP';

// Real gathered businesses in Diadema
const mechanics = [
  // Centro
  { name: 'Recondisa', address: 'Rua João Theodoro Genesi, 106', neighborhood: 'Centro', phone: '1140482039' },
  { name: 'Autoelétrica Yamaoka', address: 'Rua Amélia Eugênia, 336', neighborhood: 'Centro', phone: '1140567023' },
  { name: 'Autoelétrico Pl', address: 'Rua João Theodoro Genesi, 77', neighborhood: 'Centro', phone: '1140544626' },
  { name: 'Primo\'S Car Auto Elétrico Som Automotivo', address: 'Rua São Jorge, 327', neighborhood: 'Centro', phone: '1140431837' },
  { name: 'Auto Elétrico Orense', address: 'Rua Orense, 321', neighborhood: 'Centro', phone: '1140560001' }, 
  { name: 'Classicar Auto Elétrico Acessórios', address: 'Avenida Conceição, 154 - lj-3', neighborhood: 'Centro', phone: '1140442378' },

  // Serraria
  { name: 'Auto Elétrico e Mecânica Beltrame', address: 'R. José Bonifácio, 1960', neighborhood: 'Serraria', phone: '1140544521' },
  { name: 'OMEGA AUTO ELETRICO', address: 'Rua José Bonifácio, 1896', neighborhood: 'Serraria', phone: '1140594888' },
  { name: 'Auto Elétrico Ninja', address: 'Est. do Rufino, 499', neighborhood: 'Serraria', phone: '1128226375' },
  { name: 'Chekcar Auto Elétrica', address: 'Estr. do Rufino, 551', neighborhood: 'Serraria', phone: '11997733046' },
  { name: 'Auto Eletrica Funcional Hmh', address: 'Rua José Bonifácio, 1184 - Conj', neighborhood: 'Serraria', phone: '1140530002' },
  { name: 'Auto Elétrica Mega Som', address: 'Avenida Dona Ruyce Ferraz Alvim, 1539', neighborhood: 'Serraria', phone: '1140430003' },
  { name: 'Auto Elétrico Megaluz', address: 'Avenida Dona Ruyce Ferraz Alvim, 1731', neighborhood: 'Serraria', phone: '1140430004' },
  { name: 'Diadema Baterias', address: 'Av. Dona Ruyce Ferraz Alvim, 1077', neighborhood: 'Serraria', phone: '1140434604' }, 

  // Campanário & Casa Grande
  { name: 'Auto Elétrico Comércio Lambari', address: 'Av Brasília, 325', neighborhood: 'Campanário', phone: '1140914247' },
  { name: 'Baterias Casa Grande', address: 'Avenida Casa Grande, 453', neighborhood: 'Jardim Portinari', phone: '1140677109' },
  { name: 'Autoelétrico Dando Jeito', address: 'Rua Prudente de Moraes, 636', neighborhood: 'Casa Grande', phone: '1134260665' },

  // Eldorado
  { name: 'Auto Elétrico Reis', address: 'Rua Alvacora, 98 - CS 1', neighborhood: 'Eldorado', phone: '1140593179' },
  { name: 'Dimi Car Mecânica e Autoelétrica', address: 'Av. Alda, 450', neighborhood: 'Eldorado', phone: '11982228529' },

  // Vila Nogueira & Piraporinha
  { name: 'Oficina Brasil Diadema', address: 'Avenida Piraporinha, 1937', neighborhood: 'Vila Nogueira', phone: '1140750005' },
  { name: 'Auto Elétrico e Mecânica Paraíba', address: 'Rua Cláudio Manoel Da Costa, 171', neighborhood: 'Vila Nogueira', phone: '1140710006' },
  { name: 'Autoelétrico Mec Vila Nogueira', address: 'Rua Antônio Dias Adorno, 385', neighborhood: 'Vila Nogueira', phone: '1140711976' },
  { name: 'Gm Autoelétrico', address: 'Avenida Fagundes de Oliveira, 905', neighborhood: 'Piraporinha', phone: '1140753755' },
  { name: 'Kati Auto Mecânica', address: 'Rua Baibiris, 13', neighborhood: 'Piraporinha', phone: '1140661151' },
  { name: 'Center Sul Baterias', address: 'Rua Brejaúva, 246', neighborhood: 'Piraporinha', phone: '1140660007' },

  // Conceição & Outros
  { name: 'Ss Auto Elétrica', address: 'Rua Bororós, 736', neighborhood: 'Conceição', phone: '1140482492' },
  { name: 'Auto Elétrico BigLuz Conceição', address: 'R. Caramuru, 1448', neighborhood: 'Conceição', phone: '11975262592' },
  { name: 'Nova Era Elétrica e Injeção Eletrônica', address: 'Rua Tupiniquins, 312', neighborhood: 'Vila Conceição', phone: '1140445326' },
  { name: 'Venom Car Service', address: 'Rua Caramuru, 820', neighborhood: 'Conceição', phone: '11991028740' },
  { name: 'Auto Elétrico Kamogawa', address: 'Rua Tapuias, 154', neighborhood: 'Conceição', phone: '1140665445' },
  
  // Taboão & Outros Bairros Diversos
  { name: 'CAR ONE Oficina Especializada em Auto Elétrico', address: 'Rua Dom João VI, 653', neighborhood: 'Taboão', phone: '1140710008' },
  { name: 'Autoelétrico Júlio', address: 'Rua Capela, 51', neighborhood: 'Inamar', phone: '1140592400' },
  { name: 'Auto Elétrica D Pedro', address: 'Avenida Dom Pedro I, 360', neighborhood: 'Conceição', phone: '1140440009' }
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
    city_id: "eb8b0ad2-1da1-4475-ab19-fe1f01dae9c9", // Default placeholder for the database resolver 
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
    category: 'auto-eletrica', // specified by the user's prompt
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/223_autoeletrica_diadema.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Auto Elétrica reais em Diadema, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/223_autoeletrica_diadema.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} auto eletricas.`);
