import fs from 'fs';

const files = [
  'generate_lavarapido_sa_deep.mjs',
  'generate_lavarapido_sbc_deep.mjs',
  'generate_lavarapido_scs_deep.mjs',
  'generate_lavarapido_diadema_deep.mjs',
  'generate_lavarapido_maua_deep.mjs',
  'generate_lavarapido_rp_deep.mjs',
  'generate_lavarapido_rgs_deep.mjs'
];

files.forEach(f => {
  let content = fs.readFileSync(f, 'utf8');
  content = content.replace("category: 'lava-rapido',", "category: 'estetica-automotiva',");
  content = content.replace("DELETE FROM public.providers WHERE category = 'lava-rapido'", "DELETE FROM public.providers WHERE category IN ('lava-rapido', 'estetica-automotiva')");
  fs.writeFileSync(f, content);
});
console.log('All generator files updated with estetica-automotiva slug.');
