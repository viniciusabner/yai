import fs from 'fs';
let f = fs.readFileSync('src/database/seeds/225_autoeletrica_ribeirao.sql', 'utf8');
// Fix slugs that were accidentally renamed to 'auto_eletrica-' instead of 'auto-eletrica-'
f = f.replace(/'auto_eletrica-([^']+)'/g, "'auto-eletrica-$1'");
fs.writeFileSync('src/database/seeds/225_autoeletrica_ribeirao.sql', f);
console.log('Fixed auto eletrica slugs.');
