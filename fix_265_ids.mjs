import fs from 'fs';

let content = fs.readFileSync('src/database/seeds/265_lavarapido_ribeirao_deep.sql', 'utf8');
const regex = /\(\s*'([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})',/g;
content = content.replace(regex, '(\n    gen_random_uuid(),');

// Also fix the slug that had 'lava_rapido' inside it
content = content.replace(/'kaue-detailer-lava_rapido-ribeirao-pires-fad8c7'/g, "'kaue-detailer-estetica-automotiva-ribeirao-pires-fad8c7'");
fs.writeFileSync('src/database/seeds/265_lavarapido_ribeirao_deep.sql', content, 'utf8');
console.log('Replaced hardcoded IDs with gen_random_uuid() and fixed slug.');
