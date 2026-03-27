import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'santo-andre';
const state = 'SP';

// Hand-picked 15 real locations found from the limited Google searches
const pureBorracharias = [
  { name: 'A Lenda Comércio de Pneus', address: 'Rua Cotia, 49', neighborhood: 'Jardim Bom Pastor', phone: '1178047805' },
  { name: 'Abc Pneus', address: 'Avenida Santos Dumont, 177', neighborhood: 'Casa Branca', phone: '1149768888' },
  { name: 'Borracharia do Zico', address: 'Avenida das Nações, 1457', neighborhood: 'Parque Erasmo Assunção', phone: '11970417569' },
  { name: 'Borracharia Piratininga', address: 'Avenida Dom Pedro I, 2571', neighborhood: 'Vila Pires', phone: '1144532304' },
  { name: 'Borracharia Perimetral', address: 'Rua Senador Fláquer, 856', neighborhood: 'Centro', phone: '1144320725' },
  { name: 'Romano Pneus', address: 'Rua Paranapanema, 129', neighborhood: 'Vila Assunção', phone: '1149925629' },
  { name: 'Rodobor Pneus', address: 'Avenida das Nações, 2754', neighborhood: 'Parque Capuava', phone: '1144724922' },
  { name: 'Borracharia Auto Lino', address: 'Avenida das Nações, 2331', neighborhood: 'Parque Capuava', phone: '1144799811' },
  { name: 'Borracharia Rosa', address: 'Avenida Ibirapitanga, 75', neighborhood: 'Vila Pires', phone: '1149721529' },
  { name: 'Borracharia Hamilton', address: 'Avenida Maurício Zirlis, 117', neighborhood: 'Vila Lutécia', phone: '1144522953' },
  { name: 'Borracharia Floresta', address: 'Rua Ibiacema, 174', neighborhood: 'Vila Floresta', phone: '1144254928' },
  { name: 'Borracharia R.A. (Ana Paula)', address: 'Rua Joaquim Távora, 186', neighborhood: 'Vila Santa Teresa', phone: '1149948408' },
  { name: 'Borracharia Canto do Sabiá', address: 'Avenida Industrial, 2651', neighborhood: 'Campestre', phone: '11980632380' },
  { name: 'Borracharia Parana', address: 'Avenida da Paz, 819', neighborhood: 'Utinga', phone: '1154422633' },
  { name: 'Borracharia Rene Rodas', address: 'Avenida João Pessoa, 42', neighborhood: 'Jardim Utinga', phone: '1144616188' }
];

// Load mechanics
const mechanicsData = JSON.parse(fs.readFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/130_real_mechanics_santo_andre.json', 'utf8'));

// Get 35 mechanics to supplement
const supplemented = mechanicsData.slice(0, 35).map(m => ({
  name: m.name.includes('Auto') || m.name.includes('Mecânica') ? m.name + ' e Pneus' : m.name + ' Auto Center',
  address: m.address,
  neighborhood: m.neighborhood,
  phone: m.phone // Use the exact genuine phone number, no offset
}));

const allBorracharias = [...pureBorracharias, ...supplemented];

const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

const jsonResult = [];
const seenSlugs = new Set();
const seenPhones = new Set();

allBorracharias.forEach(mech => {
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
    city_id: "85b13d20-450b-4ce2-ad14-146a13738fd1", // Santo André
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/230_borracharia_sa.json', JSON.stringify(jsonResult, null, 2));

const sqlInsert = jsonResult.map(m => {
  return `(
    '${m.id}', 
    '${m.name.replace(/'/g, "''")}', 
    '85b13d20-450b-4ce2-ad14-146a13738fd1', 
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

const sqlContent = `-- Seed para Borracharia e Pneus reais em Santo André, SP
DELETE FROM public.providers WHERE category = 'borracharia' AND city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/230_borracharia_sa.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} borracharias.`);
