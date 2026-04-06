import fs from 'fs';
import path from 'path';

const seedsDir = './src/database/seeds';
// Locate any file that could mean Ribeirao Pires
const files = fs.readdirSync(seedsDir).filter(f => f.endsWith('.sql') && (f.includes('ribeirao') || f.includes('_rp')));

let totalFixed = 0;

for (const file of files) {
  const filePath = path.join(seedsDir, file);
  let content = fs.readFileSync(filePath, 'utf8');
  let changed = false;

  const originalContent = content;

  // 1. Regex to replace variations of the dynamic subquery lookup for Ribeirao Pires with the hardcoded id
  const subqueryRegex = /\(\s*SELECT\s+id\s+FROM\s+(?:public\.)?cities\s+WHERE\s+slug\s*=\s*'ribeirao-pires'\s*\)/gi;
  if (subqueryRegex.test(content)) {
    content = content.replace(subqueryRegex, "'1f84b6c7-69e8-49c6-a691-30da5246e0ea'");
    changed = true;
  }

  // 2. Fix the ON CONFLICT
  // If we have DO NOTHING, convert it entirely
  const doNothingRegex = /ON CONFLICT\s*\([^)]*\)\s*DO NOTHING;?/i;
  if (doNothingRegex.test(content)) {
    content = content.replace(doNothingRegex, "ON CONFLICT (slug) DO UPDATE SET\n  city_id = EXCLUDED.city_id,\n  category = EXCLUDED.category;");
    changed = true;
  } else if (content.includes("ON CONFLICT (slug) DO UPDATE SET")) {
    // If it's already an UPDATE SET but missing city_id and category, let's inject them cleanly
    if (!content.includes("city_id = EXCLUDED.city_id")) {
      content = content.replace(/ON CONFLICT \(slug\) DO UPDATE SET/i, "ON CONFLICT (slug) DO UPDATE SET\n  city_id = EXCLUDED.city_id,\n  category = EXCLUDED.category,");
      changed = true;
      // Also cleanup trailing commas if it became invalid just in case, but since we add before existing valid lines, it should be fine.
      // E.g. city_id = EXCLUDED.city_id, category = EXCLUDED.category, active = EXCLUDED.active;
    }
  }

  // Fallback: Just replace it string-by-string for safety if missing DO NOTHING
  
  if (originalContent !== content) {
    fs.writeFileSync(filePath, content, 'utf8');
    totalFixed++;
    console.log(`Fixed ${file}`);
  }
}

console.log(`Total files fixed: ${totalFixed}`);
