import fs from 'fs';

const files = [
  '270_guincho_sa_deep.sql',
  '271_guincho_sbc_deep.sql',
  '272_guincho_scs_deep.sql',
  '273_guincho_diadema_deep.sql',
  '274_guincho_maua_deep.sql',
  '275_guincho_rp_deep.sql',
  '276_guincho_rgs_deep.sql'
];

let allSql = `-- Seed unificado para Guincho 24h (Deep Search - ABC Completo)\n\n`;

files.forEach(f => {
  const content = fs.readFileSync(f, 'utf8');
  allSql += content + '\n\n';
});

fs.writeFileSync('270_guincho_all_deep.sql', allSql, 'utf8');
console.log('Successfully combined all Guincho SQL files into 270_guincho_all_deep.sql');
