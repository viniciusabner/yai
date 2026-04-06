import fs from 'fs';

let content = fs.readFileSync('src/database/seeds/225_autoeletrica_ribeirao.sql', 'utf8');

// Replace the first UUID block with gen_random_uuid()
// The ID in VALUES looks like:
//   (
//     '68b1923c-db65-400c-90cc-a1d48d6eb8ab',
const regex = /\(\s*'([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})',/g;

content = content.replace(regex, '(\n    gen_random_uuid(),');

fs.writeFileSync('src/database/seeds/225_autoeletrica_ribeirao.sql', content, 'utf8');
console.log('Replaced hardcoded IDs with gen_random_uuid().');
