-- =============================================================================
-- FIX: Corrigir slugs de categoria incorretos no banco
-- Executar no SQL Editor do Supabase
-- Data: 2026-03-31
--
-- Problema: Vários seeds antigos usaram slugs de categoria que NÃO correspondem
-- aos IDs definidos em src/constants/categories.ts. O app consulta pelo slug
-- correto e não encontra os dados.
--
-- Impacto estimado: ~100+ prestadores corrigidos
-- =============================================================================

-- 1. Lava Rápido: 'estetica-automotiva' → 'lava_rapido'
--    Arquivos afetados: 260-266_lavarapido_*_deep.sql (todas as 7 cidades)
UPDATE public.providers
SET category = 'lava_rapido'
WHERE category = 'estetica-automotiva';

-- 2. Estética e Beleza: 'estetica_avancada' → 'estetica'
--    Arquivo afetado: 61_abc_estetica_avancada.sql (SA, SBC, SCS, DIA, MAU, RP)
UPDATE public.providers
SET category = 'estetica'
WHERE category = 'estetica_avancada';

-- 3. Nutricionistas: 'nutricionista' → 'nutricao'
--    Arquivo afetado: 59_abc_nutricionista.sql (SA, SBC, SCS, DIA, MAU, RP)
UPDATE public.providers
SET category = 'nutricao'
WHERE category = 'nutricionista';

-- 4. Cuidadores: 'cuidador_idosos' → 'cuidador'
--    Arquivo afetado: 63_abc_cuidadores_idosos.sql (todas as 7 cidades)
UPDATE public.providers
SET category = 'cuidador'
WHERE category = 'cuidador_idosos';

-- 5. Dog Walker: 'dog_walker' → 'passeador'
--    Arquivo afetado: 68_abc_dog_walker.sql (todas as 7 cidades)
UPDATE public.providers
SET category = 'passeador'
WHERE category = 'dog_walker';


-- =============================================================================
-- VERIFICAÇÃO: Rode depois dos UPDATEs para confirmar
-- =============================================================================

-- Deve retornar 0 para cada slug antigo:
SELECT category, COUNT(*) as total
FROM public.providers
WHERE category IN (
  'estetica-automotiva',
  'estetica_avancada',
  'nutricionista',
  'cuidador_idosos',
  'dog_walker'
)
GROUP BY category;

-- Deve retornar contagens para os slugs novos:
SELECT category, COUNT(*) as total
FROM public.providers
WHERE category IN (
  'lava_rapido',
  'estetica',
  'nutricao',
  'cuidador',
  'passeador'
)
GROUP BY category;
