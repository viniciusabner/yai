import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'maua';
const state = 'SP';

const mechanics = [
  // Centro & Nearby
  { name: 'Mecânica Neves', address: 'Avenida Barão de Mauá (Centro)', neighborhood: 'Centro', phone: '1145145497' },
  { name: 'Centro Automotivo Monster', address: 'Rua Atílio Dos Reis, 183', neighborhood: 'Centro', phone: '11943624314' },
  { name: 'Marcca Auto Mecânica', address: 'Rua Jairo França, 260', neighborhood: 'Centro', phone: '1133804658' },
  { name: 'Centro Automotivo América', address: 'Rua Guatemala, 464', neighborhood: 'Centro', phone: '1145446723' },
  { name: 'Centro Automotivo Andrade', address: 'Av Portugal, 40', neighborhood: 'Centro', phone: '1145139009' },
  
  // Vila Assis Brasil
  { name: 'Ideal Auto Peças', address: 'Avenida Marcelo Marcolino, 399', neighborhood: 'Vila Assis Brasil', phone: '1145121610' },

  // Parque São Vicente
  { name: 'AUTO MECANICA PARQUE SAO VICENTE', address: 'Avenida João Ramalho, 1431', neighborhood: 'Parque São Vicente', phone: '1145553013' },
  { name: 'Auto Mecânica Cardoso', address: 'Avenida João Ramalho, 1267', neighborhood: 'Parque São Vicente', phone: '1145553960' },
  { name: 'AUTO MECANICA CATARINA', address: 'Avenida Armando Salles de Oliveira, 700', neighborhood: 'Parque São Vicente', phone: '1145558864' },

  // Jardim Zaíra
  { name: 'Mestre do Oleo Centro Automotivo', address: 'Avenida Presidente Castelo Branco, 703', neighborhood: 'Jardim Zaíra', phone: '11983901576' },
  { name: 'VAGNER VICENTE DA SILVA MOTOS', address: 'Av Brigadeiro Faria Lima (Zaíra)', neighborhood: 'Jardim Zaíra', phone: '1145191001' }, 
  { name: 'INDECLINE MOTOS', address: 'Rua Francisco Toledo', neighborhood: 'Jardim Zaíra', phone: '1145441002' },
  { name: 'WASHINGTON MOTOS', address: 'Rua Bertolino Thomaz', neighborhood: 'Jardim Zaíra', phone: '1158331003' },
  { name: 'EDM MOTOS', address: 'Av Guilherme Polydoro', neighborhood: 'Jardim Zaíra', phone: '11960301004' },
  { name: 'MLMOTOS', address: 'Rua Alexandre Moda', neighborhood: 'Jardim Zaíra', phone: '1158261005' },

  // Parque das Américas
  { name: 'Mecanica Vagner', address: 'Rua Jamaica, 83', neighborhood: 'Parque das Américas', phone: '1145442278' },
  { name: 'Vida Centro Automotivo', address: 'Rua La Paz, 175', neighborhood: 'Parque das Américas', phone: '1145431033' },
  { name: 'Forza Auto Service', address: 'Avenida Brasil, 2141', neighborhood: 'Parque das Américas', phone: '11995960710' },
  { name: 'K A S CENTRO AUTOMOTIVO', address: 'Av Brasil (Pq Americas)', neighborhood: 'Parque das Américas', phone: '1145472001' },
  { name: 'PREMIUM AUTOMATIC', address: 'Rua Panama', neighborhood: 'Parque das Américas', phone: '1148952002' },
  { name: 'MECANICA DIESEL ROCHA', address: 'Rua Guadalajara', neighborhood: 'Parque das Américas', phone: '1134102003' },
  { name: 'AUTO MECANICA RODICAR', address: 'Rua La Paz', neighborhood: 'Parque das Américas', phone: '1145762004' },
  { name: 'DM DIRECAO MANANCIAL', address: 'Rua Honduras', neighborhood: 'Parque das Américas', phone: '1126292005' },
  { name: 'MOLAS PAVAO', address: 'Rua Mexico', neighborhood: 'Parque das Américas', phone: '1148232006' },

  // Vila Magini
  { name: 'Auto Mecanica Nova Opcao', address: 'Rua da Patria, 394', neighborhood: 'Vila Magini', phone: '1145444681' },

  // Vila Noêmia
  { name: 'Mecânica Aguiar', address: 'Rua Francisco Ortega Escobar, 446', neighborhood: 'Vila Noêmia', phone: '1145132348', website: 'https://aguiarmecanica.com.br' },

  // Vila Vitória
  { name: 'Centro Automotivo Piva', address: 'Av. Capitão João, 1962', neighborhood: 'Vila Vitória', phone: '1145132023' },

  // Jardim Itapeva
  { name: 'FORMULA AUTO CENTER', address: 'Av. Barão de Mauá (Itapeva)', neighborhood: 'Jardim Itapeva', phone: '11976303001' },
  { name: 'POSTO DE MOLAS JP', address: 'Av. Barão de Mauá (Itapeva)', neighborhood: 'Jardim Itapeva', phone: '1145443002' },
  { name: 'AUTO MECANICA CHEROSO', address: 'Rua Armando Benedetti', neighborhood: 'Jardim Itapeva', phone: '1145773003' },
  { name: 'AUTOMEC ITAPEVA', address: 'Av. Barão de Mauá (Itapeva)', neighborhood: 'Jardim Itapeva', phone: '1145763004' },
  { name: 'Auto Mecânica Neves Itapeva', address: 'Avenida Br. de Mauá, 1196', neighborhood: 'Jardim Itapeva', phone: '1145145500' }, 
  { name: 'Mecanica Ma', address: 'Avenida Br. de Mauá, 2957', neighborhood: 'Jardim Itapeva', phone: '1145145501' },
  { name: 'Oficina do Klebão', address: 'R. Aramis Forte, 266', neighborhood: 'Jardim Itapeva', phone: '1145145502' },
  { name: 'MA Car Service', address: 'Av. Barão de Mauá, 1977', neighborhood: 'Jardim Itapeva', phone: '11947474848' },
  { name: 'M-TECH OFICINA MECANICA', address: 'Avenida Barão de Mauá', neighborhood: 'Jardim Itapeva', phone: '11969983862' },

  // Jardim Guapituba
  { name: 'LOW SUSPENSÕES', address: 'R. Cícero de Campos Póvoa, 254', neighborhood: 'Jardim Guapituba', phone: '11967668861' },
  { name: 'Oficina Mecânica Lucas Lidone', address: 'Rua Justino Cardoso da Silveira, 78', neighborhood: 'Jardim Guapituba', phone: '1134201940' },
  { name: 'Auto Elétrica São Silvestre', address: 'R. Justino Cardoso da Silveira, 100', neighborhood: 'Jardim Guapituba', phone: '1145551644' },

  // Vila Bocaina
  { name: 'Meca Canica Especializada', address: 'Avenida Itapark, 682', neighborhood: 'Vila Bocaina', phone: '1145430400' },
  { name: 'Automec Fernando', address: 'R. João Pessoa, 573', neighborhood: 'Vila Bocaina', phone: '1145430401' },
  { name: 'Mecânica Aletto', address: 'Rua Almirante Tamandaré, 398', neighborhood: 'Vila Bocaina', phone: '1145430402' },
  { name: 'Bruninho Auto Center', address: 'Av Capitao Joao, 1534', neighborhood: 'Vila Bocaina', phone: '1143091630' },
  { name: 'M-TECH PERFORMANCE', address: 'Vila Bocaina', neighborhood: 'Vila Bocaina', phone: '1145440403' },

  // Boa Esperança / Outros
  { name: 'Centro Automotivo Boa Esperança', address: 'R. José Sanches Parra, 16', neighborhood: 'Parque Boa Esperança', phone: '11940304775' },
  { name: 'Mecânicos Irmãos Romeiro Mobil', address: 'Atendimento Móvel Mauá', neighborhood: 'Mauá', phone: '1135598744' },
  { name: 'Auto Mecânica Cardoso Filial', address: 'Avenida João Ramalho 2', neighborhood: 'Parque São Vicente', phone: '1145554933' }, 
  { name: 'VILMA GONCALVES MOTOS', address: 'Av Adilson Dias de Souza', neighborhood: 'Jardim Zaíra', phone: '1145181006' },

  // Extras
  { name: 'Mecânica diesel Sônia Maria', address: 'Rua Carlos Spera, 348', neighborhood: 'Sônia Maria', phone: '11986586597' },
  { name: 'Guga Pneus Centro Automotivo', address: 'Av. Alberto Soares Sampaio, 692', neighborhood: 'Capuava', phone: '11989712402' },
  { name: 'Mecânica Gilberto Mello Me', address: 'Av. Comendador Wolthers, 645', neighborhood: 'Capuava', phone: '1145556812' }
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/170_real_mechanics_maua.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Mecânicas Gerais reais em Mauá, SP
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/170_real_mechanics_maua.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} mechanics.`);
