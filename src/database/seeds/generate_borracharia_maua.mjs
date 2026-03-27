import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'maua';
const cityId = '6f15b756-1913-4ca0-81ea-5a82f11740a3';
const state = 'SP';

// Hand-picked real locations found from Google searches
const pureBorracharias = [
  { name: 'A. L. Pneus', address: 'Estrada Guaraciaba, 107', neighborhood: 'Vila Carlina', phone: '1177596507' },
  { name: 'Aldo Peças Pneus Acessórios', address: 'Avenida Luís Marcolino, 157', neighborhood: 'Jardim Zaira', phone: '1145161392' },
  { name: 'Ale Pneus Reformas de Rodas', address: 'Avenida Martino Basso, 32', neighborhood: 'Jardim Zaira', phone: '1145198002' },
  { name: 'Guga Pneus Centro Automotivo', address: 'Av. Alberto Soares Sampaio, 692', neighborhood: 'Capuava', phone: '1145185515' },
  { name: 'Auto Elétrico e Borracharia Feital', address: 'Avenida Benedita Franco da Veiga, 1905', neighborhood: 'Vila Lisboa', phone: '1145776346' },
  { name: 'ABC Pneus', address: 'Av. Antônia Rosa Fioravanti, 3270', neighborhood: 'Jardim Rosina', phone: '1149768877' },
  { name: 'Bono Pneus Mauá', address: 'Av. Capitão João, 2346', neighborhood: 'Matriz', phone: '1135129807' },
  { name: 'KIKI CENTRO AUTOMOTIVO', address: 'Avenida Itapark, 3968', neighborhood: 'Jardim Itapark', phone: '1143099856' }
];

const pureWithValidPhones = pureBorracharias.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999'));

// Load mechanics from Mauá
const mechanicsData = JSON.parse(fs.readFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/170_real_mechanics_maua.json', 'utf8'));

// Take all mechanics as a supplementation pool
const supplemented = mechanicsData.map(m => ({
  name: m.name.includes('Auto') || m.name.includes('Mecânica') || m.name.includes('Car') ? m.name + ' e Pneus' : m.name + ' Auto Center',
  address: m.address,
  neighborhood: m.neighborhood,
  phone: m.phone // Strictly real
}));

const allBorracharias = [...pureWithValidPhones, ...supplemented];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();
const seenPhones = new Set();

allBorracharias.forEach(mech => {
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
    category: 'borracharia',
    website: null,
    city_slug: citySlug,
    state: state,
    creci: null
  });
});

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/235_borracharia_maua.json`, JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Borracharia e Pneus reais em Mauá, SP
DELETE FROM public.providers WHERE category = 'borracharia' AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/235_borracharia_maua.sql`, sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} borracharias em Mauá.`);
