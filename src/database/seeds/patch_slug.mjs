import fs from 'fs';

const files = [
  'generate_autopecas_sbc_deep.mjs',
  'generate_autopecas_scs_deep.mjs',
  'generate_autopecas_diadema_deep.mjs',
  'generate_autopecas_rp_deep.mjs',
  'generate_autopecas_maua_deep.mjs',
  'generate_autopecas_rgs_deep.mjs',
  'generate_autopecas_sa_deep.mjs'
];

files.forEach(f => {
  let content = fs.readFileSync(f, 'utf8');
  content = content.replace("category: 'autopecas',", "category: 'auto-pecas',");
  content = content.replace("DELETE FROM public.providers WHERE category = 'autopecas'", "DELETE FROM public.providers WHERE category IN ('autopecas', 'auto-pecas')");
  fs.writeFileSync(f, content);
});
console.log('All generator files updated with auto-pecas slug.');
