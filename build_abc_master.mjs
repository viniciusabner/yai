import fs from 'fs';
import path from 'path';

const seedsDir = './src/database/seeds';
// Skip 50_abc_lavanderias.sql because it's a legacy V1 file with a broken schema. 51_abc_lavanderias_v2.sql replaces it.
const files = fs.readdirSync(seedsDir).filter(f => f.includes('abc') && f.endsWith('.sql') && f !== '50_abc_lavanderias.sql');

let masterSQL = `-- MASTER SCRIPT: ARQUIVOS _ABC_ (TODAS AS CIDADES)\n-- Corrige as categorias com hífen para underline, IDs hardcoded e subqueries\n\n`;

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
  "'consultoria-ti'": "'consultoria_ti'"
};

for (const file of files) {
  let content = fs.readFileSync(path.join(seedsDir, file), 'utf8');

  // Fix hardcoded ids in VALUES
  const uuidRegex = /\(\s*'([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})'/g;
  content = content.replace(uuidRegex, '(gen_random_uuid()');

  // Map the hyphen categories
  for (const [wrong, right] of Object.entries(categoryMap)) {
    content = content.split(wrong).join(right);
  }

  // Force ribeirao-pires subquery to true ID
  const subqueryRegex = /\(\s*SELECT\s+id\s+FROM\s+(?:public\.)?cities\s+WHERE\s+slug\s*=\s*'ribeirao-pires'\s*\)/gi;
  content = content.replace(subqueryRegex, "'1f84b6c7-69e8-49c6-a691-30da5246e0ea'");
  
  // Force DO UPDATE SET
  const fallbackRegex = /ON CONFLICT\s*\([^)]*\)\s*DO NOTHING;?/i;
  // Ensure we do not replace cities table ON CONFLICT
  if (!content.includes('INSERT INTO public.cities')) {
      content = content.replace(fallbackRegex, "ON CONFLICT (slug) DO UPDATE SET\n  city_id = EXCLUDED.city_id,\n  category = EXCLUDED.category;");
  }

  masterSQL += `\n-- ===========================================\n`;
  masterSQL += `-- FROM FILE: ${file}\n`;
  masterSQL += `-- ===========================================\n`;
  masterSQL += content + `\n`;
}

fs.writeFileSync('master_abc_completo.sql', masterSQL, 'utf8');
console.log('Master file created at yai/master_abc_completo.sql');
