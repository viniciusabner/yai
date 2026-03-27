import fs from 'fs';
import crypto from 'crypto';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://rbgjzxncnsqqhhktvthw.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJiZ2p6eG5jbnNxcWhoa3R2dGh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYwODQwNDYsImV4cCI6MjA4MTY2MDA0Nn0.Tz-tICFaR3owg81AR8SkUEMMwoZP1kFgTCUGiPDU9L8';

const supabase = createClient(supabaseUrl, supabaseKey);

const citiesData = [
  // 1: SA
  {
    prefix: '244',
    slug: 'santo-andre',
    code: 'sa',
    name: 'Santo André',
    places: [
      { name: 'Fator Distribuidora de Auto Peças', address: 'Rua dos Coqueiros, 1795', neighborhood: 'Campestre', phone: '1154614442' },
      { name: 'Utipeças Peças e Acessórios', address: 'Avenida Utinga, 220', neighborhood: 'Utinga', phone: '1149971074' },
      { name: 'MercadoCar Santo André', address: 'Av. Ramiro Colleoni, 595', neighborhood: 'Centro', phone: '1149969900' },
      { name: 'AP Auto Peças', address: 'Santo André', neighborhood: 'Centro', phone: '11988466055' }
    ]
  },
  // 2: SBC
  {
    prefix: '245',
    slug: 'sao-bernardo-do-campo',
    code: 'sbc',
    name: 'São Bernardo do Campo',
    places: [
      { name: 'Autopeças Dg', address: 'Avenida Humberto Alencar Castelo Branco, 4307', neighborhood: 'Dos Casa', phone: '1143516509' },
      { name: 'EVERAUTO Peças Elétricas', address: 'São Bernardo do Campo', neighborhood: 'Centro', phone: '1147040920' },
      { name: 'Rufato Distribuidora Peças', address: 'São Bernardo do Campo', neighborhood: 'Centro', phone: '1120247800' }
    ]
  },
  // 3: SCS
  {
    prefix: '246',
    slug: 'sao-caetano-do-sul',
    code: 'scs',
    name: 'São Caetano do Sul',
    places: [
      { name: 'Autopeças Birigui', address: 'Rua Nelly Pellegrino, 639', neighborhood: 'Nova Gerty', phone: '1142382020' },
      { name: 'Fast Autopeças', address: 'Rua Pernambuco, 316', neighborhood: 'Centro', phone: '1135938720' },
      { name: 'Visconde Auto Peças', address: 'R. Visc. de Inhaúma, 420', neighborhood: 'Oswaldo Cruz', phone: '1142382000' }
    ]
  },
  // 4: Diadema
  {
    prefix: '247',
    slug: 'diadema',
    code: 'diadema',
    name: 'Diadema',
    places: [
      { name: 'Gerha Peças P/ Autos', address: 'Avenida Piraporinha, 1571', neighborhood: 'Piraporinha', phone: '1140667393' },
      { name: 'Gol Autopeças', address: 'Avenida Dona Ruyce Ferraz Alvim, 333', neighborhood: 'Vila Nogueira', phone: '1140706700' },
      { name: 'Auto Eletropeças JS', address: 'Rua Das Ameixeiras, 979', neighborhood: 'Taboão', phone: '1140753548' },
      { name: 'Auto Peças D João VI', address: 'Avenida Dom João VI, 267', neighborhood: 'Canhema', phone: '1140714640' }
    ]
  },
  // 5: RP
  {
    prefix: '248',
    slug: 'ribeirao-pires',
    code: 'rp',
    name: 'Ribeirão Pires',
    places: [
      { name: 'Tesauto Autopeças', address: 'Avenida Francisco Monteiro, 2259', neighborhood: 'Santa Luzia', phone: '1148277077' },
      { name: 'Peças Domingão', address: 'Av. Francisco Monteiro, 2540', neighborhood: 'Santa Luzia', phone: '1148284787' },
      { name: 'Autopeças Brasil', address: 'Avenida Princesa Izabel, 1438', neighborhood: 'Vila Gomes', phone: '1148276759' },
      { name: 'Baterias Automotivas ARS', address: 'Rua São Vítor, 144', neighborhood: 'Santa Luzia', phone: '11975807440' }
    ]
  },
  // 6: Mauá
  {
    prefix: '249',
    slug: 'maua',
    code: 'maua',
    name: 'Mauá',
    places: [
      { name: 'AutoZone Mauá', address: 'Avenida Barão de Mauá, 3062', neighborhood: 'Jd. Maringá', phone: '1154685402' },
      { name: 'DAPEC Distribuidora de Peças', address: 'Av. Barão de Mauá, 3035', neighborhood: 'Jardim Maringá', phone: '1150268225' },
      { name: 'BomPreço Auto Peças', address: 'Av. Barão de Mauá, 4818', neighborhood: 'Jd Itapeva', phone: '11932908890' },
      { name: 'Atenas Autopeças', address: 'Rua Ceci, 25', neighborhood: 'Vila Bocaina', phone: '1145431814' },
      { name: 'Genuine Distribuidora', address: 'Rua Presidente Carlos Luz, 181', neighborhood: 'Matriz', phone: '1145556066' }
    ]
  },
  // 7: RGS
  {
    prefix: '250',
    slug: 'rio-grande-da-serra',
    code: 'rgs',
    name: 'Rio Grande da Serra',
    places: [
      { name: 'Auto Peças Esperança da Serra', address: 'Rua José Maria Figueiredo, 8', neighborhood: 'Centro', phone: '1148215068' },
      { name: 'Autopeças Rio Grande Serra', address: 'Rua Ana L Figueiredo, 25', neighborhood: 'Vila Lavínia', phone: '1148211451' },
      { name: 'Benevides Peças e Serviços', address: 'Avenida São João, 95', neighborhood: 'Jardim Santa Tereza', phone: '1148211280' }
    ]
  }
];

// Execute processing
async function run() {
  const sluggify = (text) => text.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '');

  for (const city of citiesData) {
    // get ID from Supabase
    const { data, error } = await supabase
      .from('cities')
      .select('id')
      .eq('slug', city.slug);

    if (error || !data || data.length === 0) {
      console.error(`Error fetching city ${city.name}:`, error);
      continue;
    }

    const cityId = data[0].id;

    // Filter pure phones
    const validPlaces = city.places.filter(p => !p.phone.includes('000') && !p.phone.includes('888') && !p.phone.includes('999'));

    const jsonResult = [];
    const seenSlugs = new Set();
    const seenPhones = new Set();
    const category = 'autopecas';

    validPlaces.forEach(mech => {
      let phone = mech.phone.replace(/[^0-9]/g, '');
      if (seenPhones.has(phone)) return;
      seenPhones.add(phone);

      const mechId = crypto.randomUUID();
      const shortId = mechId.slice(0, 6);
      let baseSlug = sluggify(mech.name) + '-' + city.slug + '-' + shortId;
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
        category: category,
        website: null,
        city_slug: city.slug,
        state: 'SP',
        creci: null
      });
    });

    // Write JSON
    fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/${city.prefix}_autopecas_${city.code}.json`, JSON.stringify(jsonResult, null, 2));

    // Compile SQL
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
        NULL, 
        '${m.city_slug}', 
        '${m.state}'
      )`;
    }).join(',\n  ');

    const sqlContent = `-- Seed para Autopeças reais em ${city.name}, SP
DELETE FROM public.providers WHERE category = '${category}' AND city_id = '${cityId}';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  ${sqlInsert}
ON CONFLICT (id) DO NOTHING;`;

    fs.writeFileSync(`c:/Users/Vida/Documents/yai/src/database/seeds/${city.prefix}_autopecas_${city.code}.sql`, sqlContent);

    console.log(`Successfully generated files for ${jsonResult.length} autopeças em ${city.name} (Prefix: ${city.prefix})`);
  }
}

run();
