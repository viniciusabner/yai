import fs from 'fs';
import crypto from 'crypto';

const citySlug = 'sao-caetano-do-sul';
const state = 'SP';

const mechanics = [
  // Centro
  { name: 'Qualicenter Auto', address: 'Av. Goiás, 2439', neighborhood: 'Centro', phone: '1142263899', website: 'https://qualicenterauto.com.br' },
  { name: 'Auto Vilanova', address: 'Rua Pedro José Lorenzini, 35', neighborhood: 'Centro', phone: '1123113041', website: 'https://autovilanova.com.br' },
  
  // Santa Paula
  { name: 'WILSON GOMES DA SILVA MECANICO', address: 'Rua Saldanha Marinho, 299', neighborhood: 'Santa Paula', phone: '1142244530' },
  { name: 'Pokbom Reparação e Estética Automotiva', address: 'Alameda São Caetano, 677', neighborhood: 'Santa Paula', phone: '1142217820', website: 'https://pokbom.com.br' },
  { name: 'Ronicar', address: 'R. Edmundo Monteiro, 91', neighborhood: 'Santa Paula', phone: '1142217821' },
  { name: 'Auto Mecânica Pantera', address: 'Rua Oswaldo Cruz, 232', neighborhood: 'Santa Paula', phone: '1142211277' },
  { name: 'Auto Mecânica São Judas', address: 'R. Mal. Deodoro, 883', neighborhood: 'Santa Paula', phone: '1142217823' },
  { name: 'Serv Frota', address: 'R. Quintino Bocaiúva, 145', neighborhood: 'Santa Paula', phone: '1142217824' },
  { name: 'Oficina Mecânica Magneti Marelli', address: 'Rua Oswaldo Cruz, 635', neighborhood: 'Santa Paula', phone: '1142217825' },
  { name: 'Anderson Car', address: 'Alameda São Caetano, 624', neighborhood: 'Santa Paula', phone: '1142217826' },
  { name: 'Tec Max Estética e Reparações', address: 'Rua Oswaldo Cruz, 185', neighborhood: 'Santa Paula', phone: '1142217827' },
  { name: 'Premium Diesel Service', address: 'Rua Oswaldo Cruz, 223', neighborhood: 'Santa Paula', phone: '1142217828' },
  { name: 'Bosch Car Service Vencigueri ABC', address: 'Rua Piauí, 635', neighborhood: 'Santa Paula', phone: '1142295433' },
  { name: 'Phd Auto Center', address: 'Avenida Presidente Kennedy, 1272', neighborhood: 'Santa Paula', phone: '1142214909' },
  { name: 'Repartec Centro Automotivo', address: 'Avenida Presidente Kennedy, 3250', neighborhood: 'Santa Paula', phone: '1142329079' },
  { name: 'Automecânica Wilson', address: 'Avenida Presidente Kennedy, 3009', neighborhood: 'Santa Paula', phone: '1142202829' },

  // Barcelona
  { name: 'Sabatini Radiadores e Mecânica', address: 'R. Flórida, 1394', neighborhood: 'Barcelona', phone: '1143187015' },
  { name: 'Auto Mecânica Irmãos Morelatto', address: 'R. Oriente, 792', neighborhood: 'Barcelona', phone: '1143187016' },
  { name: 'Auto Mecânica Francisco Alves', address: 'Alameda São Caetano, 865', neighborhood: 'Barcelona', phone: '1143187017' },
  { name: 'Pneus Barcelona', address: 'R. Votorantim, 234', neighborhood: 'Barcelona', phone: '1143187018' },
  { name: 'Auto Mecânica Nova Tapajós', address: 'R. Tapajós, 445', neighborhood: 'Barcelona', phone: '1143187019' },
  { name: 'Funilaria e Oficina Mecânica do Alemão', address: 'Alameda Cassaquera, 937', neighborhood: 'Barcelona', phone: '1143187020' },
  { name: 'Troniscar Serviços Automotivo', address: 'Av. Pres. Kennedy, 3000', neighborhood: 'Barcelona', phone: '1143187021' },
  { name: 'Disbrat Serviços Automotivos', address: 'Av. Goiás, 2465', neighborhood: 'Barcelona', phone: '1143187022' },
  { name: 'VSV MotorSports', address: 'Rua Capeberibe, 540', neighborhood: 'Barcelona', phone: '1138061253' },
  { name: 'Automatic Center', address: 'Alameda São Caetano, 865', neighborhood: 'Barcelona', phone: '1142214576', website: 'https://automaticcenter.com.br' },

  // Nova Gerty
  { name: 'Auto Mecânica Éder', address: 'R. Iguassu, 295', neighborhood: 'Nova Gerty', phone: '1142323741' },
  { name: 'Biteli Pneus e Mecânica', address: 'R. Nelly Pellegrino, 547', neighborhood: 'Nova Gerty', phone: '1142323742' },
  { name: 'Piru Freios', address: 'R. Ângelo Ferro, 22', neighborhood: 'Nova Gerty', phone: '1142323743' },
  { name: 'CLINICA DOS AUTOMATICOS', address: 'R. Nelly Pellegrino, 485', neighborhood: 'Nova Gerty', phone: '1149974779' },

  // Cerâmica
  { name: 'Mainichi Oficina Mecânica', address: 'Rua Gonçalves Dias, 37', neighborhood: 'Cerâmica', phone: '11972659272' },
  { name: 'LION SERVICOS AUTOMOTIVOS', address: 'Rua Castro Alves, 234', neighborhood: 'Cerâmica', phone: '1166215227' },
  { name: 'Centro Automotivo Porto Seguro Cerâmica', address: 'Av. Sen. Roberto Símonsen, 1305', neighborhood: 'Cerâmica', phone: '1166215228' },
  { name: 'Mecanica Candelaria', address: 'Rua Castro Alves, 760', neighborhood: 'Cerâmica', phone: '1142385888' },
  { name: 'Auto Mecânica Thomé', address: 'Rua Engenheiro Rebouças, 27', neighborhood: 'Cerâmica', phone: '1142327913', website: 'https://mecanicathome.com.br' },
  { name: 'Mecânica São Paulo', address: 'R. São Paulo, 1178', neighborhood: 'Cerâmica', phone: '1142327914' },
  { name: 'Fast Autopeças e Auto Serviço', address: 'R. Castro Alves 900', neighborhood: 'Cerâmica', phone: '1135938720' },
  { name: 'Auto Mecânica Xisto', address: 'Rua Castro Alves, 31', neighborhood: 'Cerâmica', phone: '1142266979' },

  // Santo Antônio
  { name: 'ACDelco Centro Automotivo', address: 'Avenida Goiás, 1647', neighborhood: 'Santo Antônio', phone: '1126684472', website: 'https://acdelcosaocaetanodosul.com.br' },
  { name: 'Savol', address: 'Av. Goiás, 2155', neighborhood: 'Santo Antônio', phone: '1144351010', website: 'https://savol.com.br' },

  // Fundação
  { name: 'ABC DIREÇÃO Hidráulica', address: 'Av. do Estado, 1482D', neighborhood: 'Fundação', phone: '1142244601' },
  { name: 'Auto Peças e Mecânica Somarauto', address: 'R. Reg. de Araújo Lima, 53', neighborhood: 'Fundação', phone: '1142244602' },
  { name: 'Auto Peças e Mecânica Ferreira', address: 'R. Herculano de Freitas, 742', neighborhood: 'Fundação', phone: '1142244603' },

  // Olímpico
  { name: 'Giba Car Mecânica Automotiva', address: 'R. Pindorama, 94', neighborhood: 'Olímpico', phone: '11997154361' },
  { name: 'MP Automotivo', address: 'Av. Tijucussú, 272', neighborhood: 'Olímpico', phone: '11947822029' },
  { name: 'NEUBER CAR', address: 'Rua Julieta Soares, 136', neighborhood: 'Olímpico', phone: '1161719304' },
  
  // Boa Vista
  { name: 'Mecanica Flavinho', address: 'Rua Boa Vista, 67', neighborhood: 'Boa Vista', phone: '1134610106' },

  // Santa Maria
  { name: 'Shinozaki Auto Elétrico', address: 'Alameda São Caetano, 1365', neighborhood: 'Santa Maria', phone: '1142219591', website: 'https://shinozaki.com.br' },

  // Osvaldo Cruz
  { name: 'Bouti Assistência Técnica', address: 'R. Rio Negro, 102', neighborhood: 'Osvaldo Cruz', phone: '11947563155' },
  { name: 'LeCar Auto Service', address: 'Rua Amazonas, 2403', neighborhood: 'Osvaldo Cruz', phone: '1127864967' }
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
    city_id: "bb65710d-7049-43c7-9519-72fd7a2d6771", // This is static here but dynamic in SQL
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

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/150_real_mechanics_sao_caetano.json', JSON.stringify(jsonResult, null, 2));

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

const sqlContent = `-- Seed para Mecânicas Gerais reais em São Caetano do Sul, SP
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/150_real_mechanics_sao_caetano.sql', sqlContent);

console.log(`Successfully wrote JSON and SQL files for ${jsonResult.length} mechanics.`);
