import fs from 'fs';
import path from 'path';

const seedDir = 'c:/Users/Vida/Documents/yai/src/database/seeds';
const files = fs.readdirSync(seedDir).filter(f => f.endsWith('.sql'));

const expectedCategories = [
  'imobiliaria', 'pedreiro', 'marido_aluguel', 'eletricista', 'encanador', 'jardineiro', 
  'pintor', 'montador_moveis', 'vidraceiro', 'tecnico_ar_condicionado', 'serralheiro', 
  'dedetizadora', 'desentupidora', 'gesseiro', 'mecanica', 'auto-eletrica', 'borracharia', 
  'funilaria', 'auto-pecas', 'estetica-automotiva', 'guincho', 'automoveis'
];

const counts = {};
expectedCategories.forEach(c => counts[c] = 0);

for (const file of files) {
  const content = fs.readFileSync(path.join(seedDir, file), 'utf8');
  for (const cat of expectedCategories) {
    const regex = new RegExp(`'${cat}'`, 'g');
    const matches = content.match(regex);
    if (matches) {
       counts[cat] += matches.length;
    }
  }
}

console.log('--- AUDITORIA DE CATEGORIAS ---');
for (const cat of expectedCategories) {
  if (counts[cat] === 0) {
    console.log(`❌ FALTANDO: ${cat.padEnd(25)} (0 menções nos seeds)`);
  } else {
    console.log(`✅ OK:       ${cat.padEnd(25)} (${counts[cat]} menções)`);
  }
}
