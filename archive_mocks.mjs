import fs from 'fs';
import path from 'path';

const seedsDir = './src/database/seeds';
const archiveDir = path.join(seedsDir, 'legacy_mocks');

if (!fs.existsSync(archiveDir)) {
  fs.mkdirSync(archiveDir);
}

const allFiles = fs.readdirSync(seedsDir).filter(f => f.endsWith('.sql') || f.endsWith('.json'));

let movedCount = 0;

for (const file of allFiles) {
  // Identify dummy files. Pattern: usually starts with 2 digits followed by underscore, e.g., "16_rio_grande_real_estate.sql"
  // Exception: _abc_ files might be real.
  const isMock = /^(0[2-9]|1[5-9]|[2-9][0-9])_[a-z_]+\.sql$/.test(file) && !file.includes('_abc_');
  // Wait, let's just explicitly match the dummy patterns
  // Files: construction, handyman, electrician, plumber, painter (without real_), furniture_assembler (without real_)
  // plasterer (without real_), glazier (without real_), air_conditioning (without real_), metalworker (without real_)
  // gardener (without real_), pest_control (without real_, e.g., 96_santo_andre_pest_control.sql)
  // Also: providers.sql, real_estate.sql, automotive.sql
  
  const dummyKeywords = [
    '_providers.sql',
    '_real_estate.sql',
    '_automotive.sql',
    '_construction.sql',
    '_handyman.sql',
    '_electrician.sql',
    '_plumber.sql',
    '_painter.sql',
    '_furniture_assembler.sql',
    '_plasterer.sql',
    '_glazier.sql',
    '_air_conditioning.sql',
    '_metalworker.sql',
    '_gardener.sql',
    '_pest_control.sql'
  ];

  let shouldMove = false;
  for (const keyword of dummyKeywords) {
    if (file.endsWith(keyword) && !file.includes('real_') && !file.includes('100_') && !file.includes('101_') && !file.includes('102_')) {
      shouldMove = true;
      break;
    }
  }

  // Also manually target the known numeric block that had dummies (15 to 99) if they don't have abc
  const match = file.match(/^(\d{2})_/);
  if (match) {
    const num = parseInt(match[1]);
    if (num >= 15 && num <= 99 && !file.includes('_abc_')) {
      shouldMove = true;
    }
    // Also 02 to 13
    if (num >= 2 && num <= 13) {
      shouldMove = true;
    }
  }

  if (shouldMove) {
    const oldPath = path.join(seedsDir, file);
    const newPath = path.join(archiveDir, file);
    fs.renameSync(oldPath, newPath);
    console.log(`Moved ${file} to legacy_mocks/`);
    movedCount++;
  }
}

console.log(`Total moved: ${movedCount}`);
