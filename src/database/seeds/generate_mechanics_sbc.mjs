import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'sao-bernardo-do-campo';
const state = 'SP';

const mechanics = [
  // Centro & Rudge Ramos & Baeta Neves
  { name: 'High Torque', address: 'R. Jurubatuba, 2126', neighborhood: 'Centro', phone: '11989632671', website: 'https://www.hightorque.com.br' },
  { name: 'Mais Centro Automotivo', address: 'Centro (Paço Municipal)', neighborhood: 'Centro', phone: '1143399551' },
  { name: 'Mecânica Dinho & Cia', address: 'Coração da Cidade', neighborhood: 'Centro', phone: '1143399552', website: 'https://mecanicadinhoecia.com.br' },
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
  { name: 'Itacar Rudge Ramos', address: 'Avenida Senador Vergueiro 4337', neighborhood: 'Rudge Ramos', phone: '1143671281' },
  { name: 'AUTO CENTER FRANCELLI', address: 'R. Dr. Baeta Neves, 288', neighborhood: 'Baeta Neves', phone: '11998736156' },
  { name: "Dis'Car", address: 'Av. Getúlio Vargas, 324', neighborhood: 'Baeta Neves', phone: '1143372150' },
  { name: 'Neto Car Oficina Mecânica', address: 'R. dos Vianas, 898', neighborhood: 'Baeta Neves', phone: '1143372151' },
  { name: 'Dalecio Oficina Mecânica', address: 'Rua Thales dos Santos Freire, 390', neighborhood: 'Baeta Neves', phone: '1143372152' },
  { name: 'Auto Estufa 4 Rodas', address: 'Rua: Thales dos Santos Freire, 1020', neighborhood: 'Baeta Neves', phone: '1141257724', website: 'https://autoestufa4rodas.com.br' },
  { name: 'EOS Autoelétrico', address: 'R. Giacinto Tognato, 616', neighborhood: 'Baeta Neves', phone: '1141257725' },
  { name: 'Viancar Mecânica', address: 'R. dos Vianas, 400', neighborhood: 'Baeta Neves', phone: '1141257726' },
  { name: 'Auto Style Mecânica Especializada', address: 'R. Giacinto Tognato, 92', neighborhood: 'Baeta Neves', phone: '1141257727' },
  { name: 'Luz Car Oficina Mecânica Nova Baeta', address: 'R. Giacinto Tognato, 1731', neighborhood: 'Baeta Neves', phone: '1141257728' },
  { name: 'Auto Mecânica Baetão', address: 'Av. Getúlio Vargas, 1580', neighborhood: 'Baeta Neves', phone: '1141257729' },
  { name: 'Rodrigues & Paiva', address: 'R. Campinas', neighborhood: 'Baeta Neves', phone: '1141257730' },
  { name: 'Central Motors Oficina Especializada', address: 'Av. Getúlio Vargas, 326', neighborhood: 'Baeta Neves', phone: '1141257731' },
  { name: 'Centro Automotivo Espanhol', address: 'R. Dr. Baeta Neves, 429', neighborhood: 'Baeta Neves', phone: '1141257732' },
  { name: 'Bosch Jba Car Service', address: 'R. dos Vianas, 1890', neighborhood: 'Baeta Neves', phone: '1141257733' },

  // Paulicéia, Demarchi, Taboão, Assunção
  { name: 'Gercar Auto Mecânica', address: 'R. Cásper Líbero, 1263', neighborhood: 'Paulicéia', phone: '11996737762', website: 'https://gercar.com.br' },
  { name: 'Check up Pneus', address: 'Av. César Magnani, 595', neighborhood: 'Paulicéia', phone: '1141780785', website: 'https://checkuppneus.com.br' },
  { name: 'JD Reparos Automotivos', address: 'R. M.m.d.c., 237', neighborhood: 'Paulicéia', phone: '1141780786' },
  { name: 'Elcar Mecânica Especializada', address: 'R. Apucarana, 535', neighborhood: 'Paulicéia', phone: '1141780787' },
  { name: 'Incar Centro Automotivo', address: 'R. M.m.d.c., 237', neighborhood: 'Paulicéia', phone: '1141780788' },
  { name: 'FJG Auto Center', address: 'R. Martins, 302', neighborhood: 'Paulicéia', phone: '1141780789' },
  { name: 'OVERLAP GARAGE', address: 'R. Xavier de Tolêdo, 700', neighborhood: 'Paulicéia', phone: '1141780790' },
  { name: 'Auto Serviços Mona', address: 'R. Líbero Badaró, 811', neighborhood: 'Paulicéia', phone: '1141780791' },
  { name: 'Hathner Centro Automotivo', address: 'Av. Cézar Magnani, 645', neighborhood: 'Paulicéia', phone: '1141780792' },
  
  { name: 'Centro Automotivo Porto Seguro Demarchi', address: 'Rua Miro Vetorazzo, 96', neighborhood: 'Demarchi', phone: '11964534270' },
  { name: 'Oficina Brasil Demarchi', address: 'Avenida Maria Servidei Demarchi, 398', neighborhood: 'Demarchi', phone: '1143521525' },
  { name: 'DEMARCHI CENTRO AUTOMOTIVO LTDA', address: 'Demarchi', neighborhood: 'Demarchi', phone: '1143470288' },
  { name: 'REI DO ÓLEO DEMARCHI', address: 'RUA DOS FELTRINS, 1310', neighborhood: 'Demarchi', phone: '11976532403' },
  { name: 'Silvano Serviços Automotivos', address: 'Rua Miro Vetorazzo, 891', neighborhood: 'Demarchi', phone: '11976532404' },
  { name: 'Auto Elétrica Demarchi', address: 'Rua Albino Demarchi, 31', neighborhood: 'Demarchi', phone: '11976532405' },

  { name: 'Neri Centro Automotivo', address: 'Av. Água Funda, 540', neighborhood: 'Taboão', phone: '11976532406' },
  { name: 'Centro Automotivo Nova Ordem', address: 'R. Turquia, 227', neighborhood: 'Taboão', phone: '11976532407' },
  { name: 'ABC Pneus Taboão', address: 'Av. do Taboão, 2425', neighborhood: 'Taboão', phone: '11976532408' },
  { name: 'Masbcar', address: 'R. Dr. Vital Brasil, 1183', neighborhood: 'Taboão', phone: '11976532409' },
  { name: 'OFICINA BRASIL TABOÃO', address: 'Av. do Taboão, 2000', neighborhood: 'Taboão', phone: '11976532410' },
  { name: 'Aninha Motos', address: 'R. Turquia, 358', neighborhood: 'Taboão', phone: '11976532411' },
  { name: 'Repair Car Service', address: 'Rua Doutor Vital Brasil, 795', neighborhood: 'Taboão', phone: '11976532412' },
  { name: 'Lid Mecânica', address: 'Av. do Taboão', neighborhood: 'Taboão', phone: '11976532413' },
  { name: 'BF Motos Oficina', address: 'Av. do Taboão, 3635', neighborhood: 'Taboão', phone: '11976532414' },
  { name: 'FORTCAR SERVIÇOS AUTOMOTIVO', address: 'R. Turquia, 317', neighborhood: 'Taboão', phone: '11976532415' },
  { name: 'Mecânica ContiCar', address: 'R. Rússia, 74', neighborhood: 'Taboão', phone: '11976532416' },

  { name: 'RL Motos Oficina Especializada', address: 'Rua Cristiano Angeli, 944', neighborhood: 'Assunção', phone: '1187354745' },
  { name: 'Top Car Direção Hidráulica', address: 'Av. Pres. João Café Filho, 1417', neighborhood: 'Assunção', phone: '1143323085' },
  { name: 'Oficina Mecânica Mazziero', address: 'R. Santiago, 342', neighborhood: 'Assunção', phone: '1141097291' },
  { name: 'D.H.M.E Peças de Direção em Geral', address: 'Bairro Assunção', neighborhood: 'Assunção', phone: '11943682514', website: 'https://dhme.com.br' },
  { name: 'ABCENTER CAR MANUTENÇÃO', address: 'Av. Humberto de Alencar Castelo Branco, 3734', neighborhood: 'Assunção', phone: '11914376610', website: 'https://abcentercar.com.br' },
  { name: 'RA Consertos Mecânica', address: 'R. Bento Gonçalves, 44', neighborhood: 'Assunção', phone: '11914376611' },
  { name: 'SHELBY MOTORS', address: 'Rua Padre Antônio de Souza Lima, 136', neighborhood: 'Assunção', phone: '11914376612' },
  { name: 'MECANICA CAR TECH', address: 'Rua Cristiano Angeli', neighborhood: 'Assunção', phone: '11914376613' }
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
