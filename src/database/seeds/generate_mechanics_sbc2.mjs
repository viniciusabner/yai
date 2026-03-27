import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'sao-bernardo-do-campo';
const state = 'SP';

const mechanics = [
  { name: 'High Torque', address: 'R. Jurubatuba, 2126', neighborhood: 'Centro', phone: '11989632671', website: 'https://www.hightorque.com.br' },
  { name: 'Mais Centro Automotivo', address: 'Centro', neighborhood: 'Centro', phone: '1143399551' },
  { name: 'LOSSPACER AR CONDICIONADO', address: 'Av. Senador Vergueiro, 4762', neighborhood: 'Rudge Ramos', phone: '11941573782' },
  { name: 'Havema Oficina Mecânica', address: 'Avenida Caminho do Mar, 1830', neighborhood: 'Rudge Ramos', phone: '1143622420' },
  { name: 'Eletro Mecânica Ito', address: 'Avenida Caminho do Mar, 3110', neighborhood: 'Rudge Ramos', phone: '1143685222' },
  { name: 'Automecânica Rub Car', address: 'Rua Rafael Tomé, 106', neighborhood: 'Rudge Ramos', phone: '1143686721' },
  { name: 'Auto Mecânica Aparecida', address: 'Avenida Senador Vergueiro, 4558', neighborhood: 'Rudge Ramos', phone: '1143675624' },
  { name: 'Personal Mecânica', address: 'Rua Afonsina, 141', neighborhood: 'Rudge Ramos', phone: '1143621741' },
  { name: 'Nishiguchi Mecânica Elétrica', address: 'Avenida São João Batista, 289', neighborhood: 'Rudge Ramos', phone: '1141773042' },
  { name: 'Rs Mecânica e Autopeças', address: 'Rua Afonsina, 475', neighborhood: 'Rudge Ramos', phone: '1143688080' },
  { name: 'Ale Assistência Técnica', address: 'Rua da Abolição, 59', neighborhood: 'Rudge Ramos', phone: '1143684127' },
  { name: 'Automecânica Rodrighero', address: 'Rua Déa Fongaro, 50', neighborhood: 'Rudge Ramos', phone: '1143671280' },
  { name: 'AUTO CENTER FRANCELLI', address: 'R. Dr. Baeta Neves, 288', neighborhood: 'Baeta Neves', phone: '11998736156' },
  { name: "Dis'Car", address: 'Av. Getúlio Vargas, 324', neighborhood: 'Baeta Neves', phone: '1143372150' },
  { name: 'Auto Estufa 4 Rodas', address: 'Rua: Thales dos Santos Freire, 1020', neighborhood: 'Baeta Neves', phone: '1141257724', website: 'https://autoestufa4rodas.com.br' },
  { name: 'Gercar Auto Mecânica', address: 'R. Cásper Líbero, 1263', neighborhood: 'Paulicéia', phone: '11996737762', website: 'https://gercar.com.br' },
  { name: 'Check up Pneus', address: 'Av. César Magnani, 595', neighborhood: 'Paulicéia', phone: '1141780785', website: 'https://checkuppneus.com.br' },
  { name: 'Centro Automotivo Porto Seguro Demarchi', address: 'Rua Miro Vetorazzo, 96', neighborhood: 'Demarchi', phone: '11964534270' },
  { name: 'Oficina Brasil Demarchi', address: 'Avenida Maria Servidei Demarchi, 398', neighborhood: 'Demarchi', phone: '1143521525' },
  { name: 'DEMARCHI CENTRO AUTOMOTIVO LTDA', address: 'Demarchi', neighborhood: 'Demarchi', phone: '1143470288' },
  { name: 'REI DO ÓLEO DEMARCHI', address: 'RUA DOS FELTRINS, 1310', neighborhood: 'Demarchi', phone: '11976532403' },
  { name: 'RL Motos Oficina Especializada', address: 'Rua Cristiano Angeli, 944', neighborhood: 'Assunção', phone: '1187354745' },
  { name: 'Top Car Direção Hidráulica', address: 'Av. Pres. João Café Filho, 1417', neighborhood: 'Assunção', phone: '1143323085' },
  { name: 'Oficina Mecânica Mazziero', address: 'R. Santiago, 342', neighborhood: 'Assunção', phone: '1141097291' },
  { name: 'D.H.M.E Peças de Direção em Geral', address: 'Bairro Assunção', neighborhood: 'Assunção', phone: '1143525080', website: 'https://dhme.com.br' },
  { name: 'ABCENTER CAR MANUTENÇÃO', address: 'Av. Humberto de Alencar Castelo Branco, 3734', neighborhood: 'Assunção', phone: '11914376610', website: 'https://abcentercar.com.br' },
  { name: 'ABC Pneus Taboão', address: 'Av. do Taboão, 2425', neighborhood: 'Taboão', phone: '1149768877' },
  { name: 'Nova Ordem Taboão', address: 'Rua Turquia, 227', neighborhood: 'Taboão', phone: '1141785654' },
  { name: 'Oficina Brasil Taboão Carrefour', address: 'Avenida Taboão, 2000', neighborhood: 'Taboão', phone: '1141785102' },
  { name: 'Masb Car', address: 'Rua Doutor Vital Brasil, 1183', neighborhood: 'Taboão', phone: '1143634206' },
  { name: 'Star Motos Nova Petrópolis', address: 'Alameda Dom Pedro de Alcântara, 1490', neighborhood: 'Nova Petrópolis', phone: '1178953835' },
  { name: 'Auto Mecânica Gallego', address: 'R Irma Maria Monica, 83', neighborhood: 'Nova Petrópolis', phone: '1143550933' },
  { name: 'LV Garage', address: 'Rua Ernesta Pelosini 102', neighborhood: 'Nova Petrópolis', phone: '1143436459' },
  { name: 'Auto Fusca', address: 'Al. Dom Pedro de Alcântara 333', neighborhood: 'Nova Petrópolis', phone: '1141256495' },
  { name: 'Akikar', address: 'Rua Virgilio Miraglia 500', neighborhood: 'Nova Petrópolis', phone: '1141277605' },
  { name: 'Schulz Automotive', address: 'Estr. da Cooperativa 535', neighborhood: 'Nova Petrópolis', phone: '1141043636' },
  { name: 'Nicola Carburadores', address: 'Av Paulo Afonso, 574', neighborhood: 'Nova Petrópolis', phone: '1143300552' },
  { name: 'M Motors Alves Dias', address: 'Avenida Humberto Alencar Castelo Branco, 2443', neighborhood: 'Alves Dias', phone: '1143437206' },
  { name: 'Oficina Mecanica Cleisson Leite', address: 'Rua Maria João de Deus, 25', neighborhood: 'Alves Dias', phone: '1141098161' },
  { name: 'Hybrid Motors', address: 'Rua Alexandre Bonício, 558', neighborhood: 'Alves Dias', phone: '1141092418' },
  { name: 'MECANICA JG', address: 'Rua Delmiro Gouveia, 25', neighborhood: 'Jordanópolis', phone: '1141789022' },
  { name: 'Auto Mecanica Milton', address: 'Jordanópolis', neighborhood: 'Jordanópolis', phone: '1141733175' },
  { name: 'Fabio Chileno Car', address: 'Jordanópolis', neighborhood: 'Jordanópolis', phone: '11998886408' },
  { name: 'Street Car Jordanopolis', address: 'R. Clóvis Bevilacqua, 168', neighborhood: 'Jordanópolis', phone: '1143321957' },
  { name: 'Rumo Express', address: 'Planalto', neighborhood: 'Planalto', phone: '11911959181' },
  { name: 'Centro Automotivo R2', address: 'Planalto', neighborhood: 'Planalto', phone: '11911541468' },
  { name: 'Maggio Car Oficina Mecânica', address: 'Planalto', neighborhood: 'Planalto', phone: '1143414492' },
  { name: 'RA Mecânica', address: 'Planalto', neighborhood: 'Planalto', phone: '1143416046' },
  { name: 'Auto Elétrico e Oficina Mecânica Hiroshi', address: 'Paulicéia', neighborhood: 'Paulicéia', phone: '1141783237' },
  { name: 'AUTO POSTO HELENA YOKOYA', address: 'Avenida Antártico, 511', neighborhood: 'Jardim do Mar', phone: '1143323412' }
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/140_real_mechanics_sao_bernardo.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Mecânicas Gerais reais em São Bernardo do Campo, SP
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/140_real_mechanics_sao_bernardo.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} mechanics.`);
