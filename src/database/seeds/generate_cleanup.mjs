import fs from 'fs';

const automoveisFile = 'c:/Users/Vida/Documents/yai/src/database/seeds/280_automoveis_all.sql';

if (!fs.existsSync(automoveisFile)) {
  console.log('Automoveis file not found.');
  process.exit(1);
}

const content = fs.readFileSync(automoveisFile, 'utf8');
const lines = content.split('\n');

const dealershipNames = [];

for (const line of lines) {
  if (line.includes('automoveis')) {
    // Example: ('db555ca2-6b95-46fd-bcc8-bd57de3f1367', 'Moove Veículos', ...
    const match = line.match(/\('[^']+',\s*'([^']+)'/);
    if (match && match[1]) {
      dealershipNames.push(match[1].replace(/'/g, "''")); // Escape single quotes for SQL
    }
  }
}

if (dealershipNames.length === 0) {
  console.log('No names extracted.');
  process.exit(1);
}

const uniqueNames = [...new Set(dealershipNames)];

const sql = `-- Script para limpar Lojas de Veículos que caíram acidentalmente na categoria Mecânica (ou outras)
CREATE TEMP TABLE bad_providers AS
SELECT id FROM public.providers 
WHERE category != 'automoveis' 
  AND name IN (
    '${uniqueNames.join("',\n    '")}'
  );

DELETE FROM public.messages 
WHERE conversation_id IN (
  SELECT id FROM public.conversations 
  WHERE provider_id IN (SELECT id FROM bad_providers)
);

DELETE FROM public.conversations
WHERE provider_id IN (SELECT id FROM bad_providers);

DELETE FROM public.contact_events
WHERE provider_id IN (SELECT id FROM bad_providers);

DELETE FROM public.providers 
WHERE id IN (SELECT id FROM bad_providers);

DROP TABLE bad_providers;
`;

fs.writeFileSync('c:/Users/Vida/Documents/yai/src/database/seeds/281_cleanup_dealerships.sql', sql, 'utf8');

console.log(`Generated cleanup SQL for ${uniqueNames.length} dealerships.`);
