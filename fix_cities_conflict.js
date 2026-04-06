import fs from 'fs';
import path from 'path';

const seedsDir = './src/database/seeds';
const files = fs.readdirSync(seedsDir).filter(f => f.endsWith('.sql') && (f.includes('ribeirao') || f.includes('_rp')));

let totalFixed = 0;

for (const file of files) {
  const filePath = path.join(seedsDir, file);
  let content = fs.readFileSync(filePath, 'utf8');

  const originalContent = content;

  // We are looking for the 'cities' table insert, not 'providers'
  const citiesRegex = /(INSERT INTO public\.cities[\s\S]*?)ON CONFLICT\s*\([^)]*\)\s*DO UPDATE SET\s*city_id\s*=\s*EXCLUDED\.city_id,\s*category\s*=\s*EXCLUDED\.category;/gi;
  
  if (citiesRegex.test(content)) {
    content = content.replace(citiesRegex, "$1ON CONFLICT (slug) DO NOTHING;");
  }

  if (originalContent !== content) {
    fs.writeFileSync(filePath, content, 'utf8');
    totalFixed++;
    console.log(`Fixed cities conflict in ${file}`);
  }
}

console.log(`Total city inserts fixed: ${totalFixed}`);
