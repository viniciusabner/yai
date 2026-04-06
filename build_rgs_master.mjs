import fs from 'fs';
import path from 'path';

const seedsDir = './src/database/seeds';
const files = fs.readdirSync(seedsDir).filter(f => f.endsWith('.sql') && (f.includes('rio_grande') || f.includes('rgs')));

let masterSQL = `-- MASTER SCRIPT: RIO GRANDE DA SERRA\n-- Corrige as categorias com hífen para underline, IDs hardcoded e força o ON CONFLICT\n\n`;

const categoryMap = {
  "'marido-aluguel'": "'marido_aluguel'",
  "'montador-moveis'": "'montador_moveis'",
  "'tecnico-ar-condicionado'": "'tecnico_ar_condicionado'",
  "'limpeza-pos-obra'": "'limpeza_pos_obra'",
  "'personal-organizer'": "'personal_organizer'",
  "'redes-protecao'": "'redes_protecao'",
  "'automacao-residencial'": "'automacao_residencial'",
  "'auto-eletrica'": "'auto_eletrica'",
  "'banho-tosa'": "'banho_tosa'",
  "'hotel-pet'": "'hotel_pet'",
  "'gestao-trafego'": "'gestao_trafego'",
  "'cursos-profissionalizantes'": "'cursos_profissionalizantes'",
  "'reforco-escolar'": "'reforco_escolar'",
  "'decoracao-festas'": "'decoracao_festas'",
  "'aluguel-equipamentos'": "'aluguel_equipamentos'",
  "'musica-eventos'": "'musica_eventos'",
  "'espaco-eventos'": "'espaco_eventos'",
  "'energia-solar'": "'energia_solar'",
  "'reparo-bicicletas'": "'reparo_bicicletas'",
  "'marketing-digital'": "'marketing_digital'",
  "'desenvolvimento-web'": "'desenvolvimento_web'",
  "'design-grafico'": "'design_grafico'",
  "'criacao-conteudo'": "'criacao_conteudo'",
  "'manutencao-computadores'": "'manutencao_computadores'",
  "'manutencao-celulares'": "'manutencao_celulares'",
  "'consultoria-ti'": "'consultoria_ti'",
  "'estetica-automotiva'": "'lava_rapido'",
  "'lava-rapido'": "'lava_rapido'"
};

for (const file of files) {
  let content = fs.readFileSync(path.join(seedsDir, file), 'utf8');

  // STRIP NUCLEAR DELETES!!
  // The files have: `DELETE FROM providers WHERE (city_id = ...) OR slug LIKE '%-rio-grande-da-serra';`
  // We don't need ANY deletes because ON CONFLICT DO UPDATE SET perfectly handles upserts.
  content = content.replace(/DELETE FROM contact_events[^;]+;/gi, '');
  content = content.replace(/DELETE FROM conversations[^;]+;/gi, '');
  content = content.replace(/DELETE FROM providers[^;]+;/gi, '');
  content = content.replace(/DELETE FROM public.providers[^;]+;/gi, '');


  // Fix hardcoded ids in VALUES
  const uuidRegex = /\(\s*'([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})'/g;
  content = content.replace(uuidRegex, '(gen_random_uuid()');

  // Map the hyphen categories
  for (const [wrong, right] of Object.entries(categoryMap)) {
    content = content.split(wrong).join(right);
  }

  // SCRUB LEGACY CATEGORY_ID SCHEMA
  content = content.replace(/category_id,\s*/g, "");
  content = content.replace(/\(SELECT id FROM categories[^)]+\)\s*,/gi, "");

  // SCRUB PHANTOM CITY_ID IN PAINTERS AND OTHER BATCHES
  content = content.replace(/'ea516919-22d1-4508-8641-8eb9be709dd8'/gi, "(SELECT id FROM public.cities WHERE slug='rio-grande-da-serra')");
  
  // Force DO UPDATE SET
  const fallbackRegex = /ON CONFLICT\s*\([^)]*\)\s*DO NOTHING;?/i;
  
  if (!content.includes('INSERT INTO public.cities') && content.includes('INSERT INTO public.providers')) {
      content = content.replace(fallbackRegex, "ON CONFLICT (slug) DO UPDATE SET\n  city_id = EXCLUDED.city_id,\n  category = EXCLUDED.category;");
  } else if (content.includes('INSERT INTO public.providers')) {
     const lastIdx = content.lastIndexOf('DO NOTHING');
     if (lastIdx !== -1) {
         content = content.substring(0, lastIdx) + "DO UPDATE SET\n  city_id = EXCLUDED.city_id,\n  category = EXCLUDED.category;" + content.substring(lastIdx + 10);
     }
  }

  // Also replace raw `INSERT INTO providers` with `INSERT INTO public.providers` globally for sanity
  content = content.replace(/INSERT INTO providers/g, 'INSERT INTO public.providers');

  masterSQL += `\n-- ===========================================\n`;
  masterSQL += `-- FROM FILE: ${file}\n`;
  masterSQL += `-- ===========================================\n`;
  masterSQL += content + `\n`;
}

fs.writeFileSync('master_rio_grande_da_serra.sql', masterSQL, 'utf8');
console.log('Master file created at yai/master_rio_grande_da_serra.sql');
