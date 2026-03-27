import fs from 'fs';

const files = [
  '260_lavarapido_sa_deep.sql',
  '261_lavarapido_sbc_deep.sql',
  '262_lavarapido_scs_deep.sql',
  '263_lavarapido_diadema_deep.sql',
  '264_lavarapido_maua_deep.sql',
  '265_lavarapido_ribeirao_deep.sql',
  '266_lavarapido_rgs_deep.sql'
];

let allSql = `-- Seed unificado para Lava Rápido / Estética Automotiva (Deep Search - ABC Completo)\n\n`;

files.forEach(f => {
  const content = fs.readFileSync(f, 'utf8');
  allSql += content + '\n\n';
});

fs.writeFileSync('260_lavarapido_all_deep.sql', allSql, 'utf8');
console.log('Successfully combined all Lava Rápido SQL files into 260_lavarapido_all_deep.sql');
