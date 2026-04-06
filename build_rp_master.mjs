import fs from 'fs';
import path from 'path';

const seedsDir = './src/database/seeds';
const files = fs.readdirSync(seedsDir).filter(f => f.endsWith('.sql') && (f.includes('ribeirao') || f.includes('_rp')));

let masterSQL = `-- MASTER SCRIPT: RIBEIRÃO PIRES\n-- Fixes missing categories (dashes vs underscores), city_id bugs, and hardcoded UUIDs\n\n`;

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
  content = content.replace(/DELETE FROM contact_events[^;]+;/gi, '');
  content = content.replace(/DELETE FROM conversations[^;]+;/gi, '');
  content = content.replace(/DELETE FROM providers[^;]+;/gi, '');
  content = content.replace(/DELETE FROM public.providers[^;]+;/gi, '');

  // Fix hardcoded ids in VALUES
  const uuidRegex = /\(\s*'([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})'/g;
  content = content.replace(uuidRegex, '(gen_random_uuid()');

  // Map the hyphen categories
  for (let [wrong, right] of Object.entries(categoryMap)) {
    content = content.split(wrong).join(right);
  }

  // SCRUB LEGACY CATEGORY_ID SCHEMA
  content = content.replace(/category_id,\s*/g, "");
  content = content.replace(/\(SELECT id FROM categories[^)]+\)\s*,/gi, "");

  // Ensure city_id is hardcoded for Ribeirão Pires ONLY (not global RGS!)
  const subqueryRegex = /\(\s*SELECT\s+id\s+FROM\s+(?:public\.)?cities\s+WHERE\s+slug\s*=\s*'ribeirao-pires'\s*\)/gi;
  content = content.replace(subqueryRegex, "'1f84b6c7-69e8-49c6-a691-30da5246e0ea'");
  
  // STRIP PHANTOM HARDCODED UUID FOR RIBEIRAO PIRES, if any (e.g. they might have copied it)
  // Let's just leave it as is if there's no known phantom UUID. The ON CONFLICT will use what it has.
  
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

fs.writeFileSync('master_ribeirao_pires.sql', masterSQL, 'utf8');
console.log('Master file created at yai/master_ribeirao_pires.sql');
