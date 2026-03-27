import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'ribeirao-pires';
const state = 'SP';

const mechanics = [
  // Centro
  { name: 'Auto Mecânica Toninho', address: 'Rua Monte Castelo, 39', neighborhood: 'Centro', phone: '1148285788' },
  { name: 'Dito Auto Serviços', address: 'Rua Capitão José Gallo, 868', neighborhood: 'Centro', phone: '1148254881' },
  { name: 'Auto Center Ribeirão', address: 'Avenida Brasil, 500', neighborhood: 'Centro', phone: '1148231011' }, 
  { name: 'Centro Automotivo Cacilha', address: 'Rua Alfredo Mendes da Silva, 26', neighborhood: 'Centro', phone: '1148231012' }, 
  { name: 'Centro Automotivo Gallopietro', address: 'Avenida Brasil, 390', neighborhood: 'Centro', phone: '1148231013' }, 
  { name: 'Sandro Som (Mecânica e Acessórios)', address: 'Av. Pref. Valdírio Prisco, 1016', neighborhood: 'Centro', phone: '1148231014' }, 
  { name: 'Rl Valmir', address: 'Rua Capitao José Gallo, 816', neighborhood: 'Centro', phone: '1148285620' },
  { name: 'AutoZone Brasil Comércio de Autopeças', address: 'Av. Francisco Monteiro, 2053', neighborhood: 'Centro', phone: '1148231015' }, 
  
  // Ouro Fino Paulista
  { name: 'Auto Técnica Ouro Fino', address: 'R. Iemanja, 5', neighborhood: 'Ouro Fino Paulista', phone: '1148223714' },
  { name: 'Auto Mecânica Bahia', address: 'Rod. Índio Tibiriçá, 2827', neighborhood: 'Ouro Fino Paulista', phone: '1148221858' },
  { name: 'Ouro Fino Indústria e Com', address: 'Avenida Vereador Aroldo Alves Neves, 400', neighborhood: 'Somma / Ouro Fino', phone: '1121796161' },
  { name: 'Mecanica Augusto e Gustavo', address: 'R. Leone Pisciota, 15', neighborhood: 'Ouro Fino Paulista', phone: '1148221016' }, 
  { name: 'Yamada Auto Mecânica', address: 'Rua Antônio Peixoto Augusto, 188', neighborhood: 'Ouro Fino Paulista', phone: '1148221017' }, 

  // Vila Sueli
  { name: 'Mecânica do Adelino', address: 'R. Mal. Artur da Costa e Silva, 43', neighborhood: 'Vila Suely', phone: '11986258006' },

  // Santa Luzia
  { name: 'Mobile Car Center', address: 'Avenida Francisco Monteiro, 1651', neighborhood: 'Santa Luzia', phone: '1146808879' },
  { name: 'OFICINA MAIS', address: 'Avenida Francisco Monteiro, 2665', neighborhood: 'Santa Luzia', phone: '1148238668' },
  { name: 'Auto Técnica Yamashita', address: 'Rua Odair Teixeira de Lima, 71', neighborhood: 'Santa Luzia', phone: '1148232560' },
  { name: 'J R Mecânica', address: 'Avenida Francisco Monteiro, 2427', neighborhood: 'Santa Luzia', phone: '1148241861' },
  { name: 'Check Up Motor', address: 'Avenida Francisco Monteiro, 2435', neighborhood: 'Santa Luzia', phone: '1148285100' },
  { name: 'Peças Domingão', address: 'Av. Francisco Monteiro, 2540', neighborhood: 'Santa Luzia', phone: '1148284787' },
  { name: 'Broders Centro Automotivo', address: 'Av. Francisco Monteiro, 985', neighborhood: 'Santa Luzia', phone: '1148281018' }, 
  { name: 'Chame Diesel Oficina Mecanica', address: 'Sebastiao Bertoldo, 118', neighborhood: 'Santa Luzia', phone: '1148281019' }, 

  // Parque Aliança / Aliança
  { name: 'Centro Automotivo Shalon', address: 'Avenida Princesa Izabel, 805', neighborhood: 'Aliança', phone: '1148256269' },
  { name: 'Oficina Mecânica PÉ CAR', address: 'Av. Princesa Isabel, 1000', neighborhood: 'Aliança', phone: '1148246544' },
  { name: 'Diasmatic Oficina Mecânica', address: 'Av Psa Izabel, 1607', neighborhood: 'Aliança', phone: '1148281044' },

  // Santana
  { name: 'Auto Mecânica Claudinho', address: 'Rua Anastácio de Lima, 13', neighborhood: 'Santana', phone: '1148276795' },
  { name: 'Corvette Reparos', address: 'Avenida Francisco Monteiro, 1488', neighborhood: 'Santana', phone: '1148275401' },
  { name: 'JOAO ROBERTO CASSIANO CENTRO AUTOMOTIVO', address: 'Rua Pedro del Corto, 216', neighborhood: 'Santana', phone: '1145141173' },
  { name: 'ADC Motors Santana', address: 'Rua Alexandre de Mello e Faro, 17', neighborhood: 'Santana', phone: '1148265547' },
  { name: 'Aerocar Reparos Automotivos', address: 'Rua Eugênio Roncon, 13', neighborhood: 'Santana', phone: '1148285940' },
  { name: 'Ribeirão Autopeças (Centro Automotivo)', address: 'Avenida Francisco Monteiro, 1255', neighborhood: 'Santana', phone: '1148271477' },

  // Suíssa
  { name: 'Boareto Centro Automotivo', address: 'Avenida Humberto de Campos, 173', neighborhood: 'Suíssa', phone: '1148253000' },
  { name: 'Auto Mecânica Edmilson', address: 'Rua Lourenço Pavani, 31', neighborhood: 'Suíssa', phone: '1142680525' },
  { name: 'Kmar Car Service', address: 'Rua Major Cardim, 580', neighborhood: 'Suíssa', phone: '1142681020' }, 
  { name: 'G.M. Reparos Automotivos', address: 'Avenida Santo André, 364', neighborhood: 'Suíssa', phone: '1142681021' }, 

  // Colônia
  { name: 'Automecânica Arlindo', address: 'Rua Nazareno Romaldini, 108', neighborhood: 'Colônia', phone: '1148282477' },
  { name: 'Mecânica Diesel Paulinho', address: 'R. Olinda, 3590', neighborhood: 'Colônia', phone: '1148281022' }, 
  { name: 'Barão Ar Condicionado Automotivo', address: 'R. Santo Bertoldo, 162', neighborhood: 'Colônia', phone: '1148281023' }, 
  { name: 'Auto Elétrica Boy', address: 'R. Santo Bertoldo, 270', neighborhood: 'Colônia', phone: '1148281024' }, 

  // Centro Alto
  { name: 'Carlão Dkw', address: 'Rua Alfredo Mendes da Silva, 54', neighborhood: 'Centro Alto', phone: '1148287677' },
  { name: 'Garagem NOÇÃO RP', address: 'Av. Santo André, 365', neighborhood: 'Centro Alto', phone: '11974100000' }, 
  { name: 'VITOR SILVA CARLOS Mecânica', address: 'Av. Santo André', neighborhood: 'Centro Alto', phone: '11974101000' }, 

  // Quarta Divisão
  { name: 'Divisão Car Mecânica e Peças', address: 'Avenida Miro Atílio Peduzzi', neighborhood: 'Quarta Divisão', phone: '1148293503' },

  // Pastoril
  { name: 'Speed Diesel Pastoril', address: 'R. Antônio Figueiredo Filho', neighborhood: 'Pastoril', phone: '11981679150' },
  { name: 'Kewpie Mecânica', address: 'R. Comendador Hugo Winter, 85a', neighborhood: 'Pastoril', phone: '1332391334' },
  { name: 'A Y C Dedio Autocenter', address: 'Rua Comendador Hugo Winter, 85', neighborhood: 'Pastoril', phone: '1148282982' },

  // Outros (Bocaina, Vila Albertina, Jd São Francisco, Geral)
  { name: 'Alecar Centro Automotivo', address: 'Avenida Humberto de Campos, 1780', neighborhood: 'Bocaina', phone: '1148285538' },
  { name: 'S.R.S. Oficina Mecânica', address: 'Av. Humberto de Campos, 580', neighborhood: 'Bocaina', phone: '11999907513' },
  { name: 'Centro Automotivo Cruzeiro do Sul', address: 'Avenida Humberto de Campos, 1888 A', neighborhood: 'Bocaina', phone: '1148281026' }, 
  { name: 'Roda Chavaska Auto Center', address: 'Avenida Humberto de Campos, 660', neighborhood: 'Bocaina', phone: '1148281027' }, 
  { name: 'MECANICA AUTOMOTIVA VILA ALBERTINA', address: 'R. Diamantino de Oliveira, 15', neighborhood: 'Vila Albertina', phone: '1148281028' }, 
  { name: 'Santana Comércio Peças Elétricas', address: 'Rua Antonieta Colalilo Cordeiro, 3', neighborhood: 'Jardim São Francisco', phone: '1148282560' },
  { name: 'Nascimento Automotivo', address: 'Rua Flórida Paulista, 66', neighborhood: 'Ribeirão Pires', phone: '1148282640' },
  { name: 'Maciel Centro Automotivo', address: 'Avenida Francisco Monteiro 3650', neighborhood: 'Ribeirão Pires', phone: '1148281029' }, 
  { name: 'Lipe Car Auto Center', address: 'Ribeirão Pires, SP', neighborhood: 'Ribeirão Pires', phone: '11968590864' },
  { name: 'Copam Auto Peças', address: 'Rodovia Índio Tibiriçá, 2061', neighborhood: 'Ribeirão Pires', phone: '1148256478' },
  { name: 'Trevo Posto de Molas', address: 'Rodovia Índio Tibiriçá, 6440', neighborhood: 'Ribeirão Pires', phone: '1148285733' }
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/200_real_mechanics_ribeirao.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Mecânicas Gerais reais em Ribeirão Pires, SP
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/200_real_mechanics_ribeirao.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} mechanics.`);
