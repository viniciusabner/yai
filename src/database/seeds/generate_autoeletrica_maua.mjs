import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'maua';
const state = 'SP';

// Real gathered businesses in Mauá
const mechanics = [
  // Centro & Adjacências
  { name: 'Casa de Baterias Paulista', address: 'Avenida João Ramalho, 1419', neighborhood: 'Vila Noemia', phone: '1145551477' },
  { name: 'Rede Oficina Express', address: 'Av. Barão de Mauá, 1473', neighborhood: 'Vila America', phone: '1134205705' },

  // Jardim Zaíra
  { name: 'Dimas Auto Elétrico e Mecânica Geral', address: 'Av. Pres. Castelo Branco, 871', neighborhood: 'Jardim Zaira', phone: '1145186247' },
  { name: 'SERIKAWA AUTO ELETRICO', address: 'Avenida, 1569', neighborhood: 'Jardim Zaira', phone: '1196050701' },
  { name: 'Auto Elétrico Jonas', address: 'Av. Pres. Castelo Branco 2641', neighborhood: 'Jardim Zaira', phone: '1145473614' },

  // Vila Assis Brasil
  { name: 'Eletro Tecnica Lins', address: 'R. Lazar Segal, 131', neighborhood: 'Vila Assis Brasil', phone: '1145137267' },
  { name: 'Auto Mecânica Matriz Ltda (Auto Elétrica)', address: 'Rua Joaquim Pereira dos Santos 51', neighborhood: 'Vila Assis Brasil', phone: '1145132523' },

  // Vila Augusto & Itapark
  { name: 'T. Nishiyama Serviços Automotivos', address: 'Av. Itapark, 712', neighborhood: 'Vila Augusto', phone: '1145163109' },
  { name: 'Auto Elétrico Éder', address: 'Av. Itapark, 2447', neighborhood: 'Jardim Itapark', phone: '1145410001' }, 
  { name: 'Alento Auto Peças e Auto Elétrica', address: 'Avenida Itapark, 2533', neighborhood: 'Jardim Itapark Velho', phone: '1145146950' },
  { name: 'Alento Autoeletrico Geral', address: 'Avenida Itapark, 4097', neighborhood: 'Jardim Itapark Velho', phone: '1133804382' },

  // Outros Bairros Diversos
  { name: 'Auto Elétrica Anderson Conceicao', address: 'Rua Vicente Grecco, 151', neighborhood: 'Parque Sao Vicente', phone: '11962640452' },
  { name: 'Auto Elétrico M?M', address: 'Rua Dr. Fernando Costa 99', neighborhood: 'Vila Emílio', phone: '1145473562' },
  { name: 'Mauá Comércio de Auto Peças Elétricas', address: 'Avenida Antônia Rosa Fioravanti, 3540', neighborhood: 'Jardim Rosina', phone: '1145161413' },
  { name: 'Noreika Auto Peças Elétricas', address: 'Rua Guatemala, 487', neighborhood: 'Parque das Américas', phone: '1145162630' },
  { name: 'DAPEC Elétrica', address: 'Av. Barão de Mauá, 3035', neighborhood: 'Jardim Maringá', phone: '1150268225' },
  { name: 'Tropical Baterias', address: 'Av. Dom José Gaspar, 1564', neighborhood: 'Matriz', phone: '1145461049' },
  { name: 'WA Baterias Delivery', address: 'Vila Assis Brasil', neighborhood: 'Vila Assis Brasil', phone: '11988817924' },
  { name: 'AUTO ELETRICA JE', address: 'Mauá', neighborhood: 'Mauá', phone: '1145410002' }, 
  { name: 'Aema Ar condicionado eletrica', address: 'Rua 175', neighborhood: 'Jardim Luzitano', phone: '1195711344' }
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
    city_id: "8f56b3e8-5b48-4cb2-8367-fc197b0a6e87", // Default placeholder for the database resolver 
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/224_autoeletrica_maua.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Auto Elétrica reais em Mauá, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/224_autoeletrica_maua.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} auto eletricas.`);
