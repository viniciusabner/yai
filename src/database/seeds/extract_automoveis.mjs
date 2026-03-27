import fs from 'fs';
import crypto from 'crypto';

const cityUuids = {
  'santo-andre': '85b13d20-450b-4ce2-ad14-146a13738fd1',
  'sbc': '63f5d4df-256d-4732-8e51-feffc5ef7a5f',
  'scs': 'd422ecad-80b4-450a-b364-ebb888d700e1',
  'diadema': '205e475f-44aa-418f-8835-434cd5e913d2',
  'maua': '6f15b756-1913-4ca0-81ea-5a82f11740a3',
  'ribeirao-pires': '1f84b6c7-69e8-49c6-a691-30da5246e0ea',
  'rio-grande-da-serra': 'ea516919-22d1-4508-8641-8eb9be709dd8'
};

const mapSlugToKey = {
  'santo-andre': 'santo-andre',
  'sao-bernardo-do-campo': 'sbc',
  'sbc': 'sbc',
  'sao-caetano-do-sul': 'scs',
  'diadema': 'diadema',
  'maua': 'maua',
  'ribeirao-pires': 'ribeirao-pires',
  'rio-grande-da-serra': 'rio-grande-da-serra'
};

const sourceFiles = [
  '08_santo_andre_automotive.sql',
  '09_sao_bernardo_automotive.sql',
  '10_sao_caetano_automotive.sql',
  '11_maua_automotive.sql',
  '12_diadema_automotive.sql',
  '13_ribeirao_pires_automotive.sql',
  '15_rio_grande_providers.sql'
];

let finalSql = `-- Seed unificado resgatando as Lojas de Veículos (automoveis) mapeadas no início do projeto
DELETE FROM public.providers WHERE category = 'automoveis';\n\n`;

let totalExtracts = 0;

finalSql += `INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)\nVALUES\n`;

let valuesLines = [];

for (const file of sourceFiles) {
  if (!fs.existsSync(file)) {
    console.log(`File missing: ${file}`);
    continue;
  }
  
  const content = fs.readFileSync(file, 'utf8');
  const lines = content.split('\n');
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    if (line.includes('automoveis')) {
      let parsedLine = line.trim();
      
      if (parsedLine.endsWith(',')) {
        parsedLine = parsedLine.slice(0, -1);
      }
      
      // We will parse the tuple using regex to properly manipulate UUID and slug
      // The format generally is: (gen_random_uuid(), 'Name', (SELECT ...), ...)
      // Let's replace gen_random_uuid() with a real generated UUID and append a slice of it to the slug
      
      const newUuid = crypto.randomUUID();
      const shortId = newUuid.slice(0, 6);
      
      // Replace gen_random_uuid()
      parsedLine = parsedLine.replace(/gen_random_uuid\(\)/, `'${newUuid}'`);
      
      const cityRegex = /\(SELECT id FROM public.cities WHERE slug='([^']+)'\)/;
      const matchCity = parsedLine.match(cityRegex);
      
      if (matchCity && matchCity[1]) {
        const slugCity = matchCity[1];
        const mappedKey = mapSlugToKey[slugCity];
        
        if (mappedKey && cityUuids[mappedKey]) {
           const hardcodedUuid = `'${cityUuids[mappedKey]}'`;
           parsedLine = parsedLine.replace(cityRegex, hardcodedUuid);
           
           // Now find the slug which is right before 'automoveis'
           // Usually it's: ..., 'some-slug', 'automoveis', ...
           // We can match `'([^']+)',\s*'automoveis'`
           const slugRegex = /'([^']+)',\s*'automoveis'/;
           const matchSlug = parsedLine.match(slugRegex);
           
           if (matchSlug && matchSlug[1]) {
             const originalSlug = matchSlug[1];
             const newSlug = `${originalSlug}-v-${shortId}`;
             parsedLine = parsedLine.replace(`'${originalSlug}'`, `'${newSlug}'`);
           }
           
           valuesLines.push(`  ${parsedLine}`);
           totalExtracts++;
        }
      }
    }
  }
}

if (valuesLines.length > 0) {
  finalSql += valuesLines.join(',\n') + '\nON CONFLICT (id) DO NOTHING;';
  fs.writeFileSync('280_automoveis_all.sql', finalSql, 'utf8');
  console.log(`Successfully extracted ${totalExtracts} 'automoveis' entries into 280_automoveis_all.sql`);
} else {
  console.log('No automoveis found to extract.');
}
