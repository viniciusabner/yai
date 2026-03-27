import fs from 'fs';

const files = fs.readdirSync('.').filter(f => f.includes('autoeletrica'));
for (const f of files) {
  let c = fs.readFileSync(f, 'utf8');
  if (f.endsWith('.mjs')) {
    c = c.replace(/category: 'automoveis'/g, "category: 'auto-eletrica'");
  } else if (f.endsWith('.json')) {
    c = c.replace(/"category": "automoveis"/g, '"category": "auto-eletrica"');
  } else if (f.endsWith('.sql')) {
    c = c.replace(/'automoveis'/g, "'auto-eletrica'");
  }
  fs.writeFileSync(f, c);
  console.log('Fixed', f);
}
