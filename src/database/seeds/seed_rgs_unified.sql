-- =============================================================================
-- SEED UNIFICADO — Rio Grande da Serra (SP)
-- Todas as categorias de prestadores verificados
-- Gerado em: 2026-03-31
-- Total: 17 categorias | ~60 prestadores reais
--
-- Categorias incluídas:
--   imobiliaria (6), pedreiro (5), marido_aluguel (2), eletricista (3),
--   encanador (3), jardineiro (4), lavanderia (3), limpeza_pos_obra (3),
--   automoveis (7), despachante (2), psicologia (4), fisioterapia (1),
--   odontologia (5), personal_trainer (5), estetica (5), podologia (2),
--   cuidador (2)
--
-- Categorias sem dados verificáveis: personal_organizer, nutricao
-- =============================================================================


-- =============================================================================
-- 1. IMOBILIÁRIAS (6 registros)
-- Fonte: encontrasp.com.br, sites oficiais
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Vanderlei Guerra Imóveis',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Carlos José Carlson, 249',
  '11974378234',
  '1148202383',
  null,
  'manual_google',
  true,
  now(),
  'vanderlei-guerra-imoveis-rio-grande-da-serra',
  'imobiliaria',
  'https://vanderleiguerraimoveis.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Imobiliária São Vicente',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Carlos José Carlson, 226',
  '11947470831',
  '1148201334',
  null,
  'manual_google',
  true,
  now(),
  'imobiliaria-sao-vicente-rio-grande-da-serra',
  'imobiliaria',
  'https://saovicenteimobiliaria.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Imobiliária Batista',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Carlos José Carlson, 100',
  null,
  '1148201512',
  null,
  'manual_google',
  true,
  now(),
  'imobiliaria-batista-rio-grande-da-serra',
  'imobiliaria',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Rodrigues Imóveis',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Avenida Dom Pedro I, 538',
  null,
  '1148201537',
  null,
  'manual_google',
  true,
  now(),
  'rodrigues-imoveis-rio-grande-da-serra',
  'imobiliaria',
  'https://rodriguesimoveis.online',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Imobiliária JL',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua José Maria de Figueiredo, 229',
  '11998228363',
  '1148214395',
  null,
  'manual_google',
  true,
  now(),
  'imobiliaria-jl-rio-grande-da-serra',
  'imobiliaria',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Mito Empreendimentos Comerciais e Imobiliários',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Estrada Oeste, 14',
  null,
  '1148211788',
  null,
  'manual_google',
  true,
  now(),
  'mito-empreendimentos-rio-grande-da-serra',
  'imobiliaria',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 2. PEDREIROS / REFORMAS (5 registros)
-- Fonte: encontrasp.com.br, guiafacil.com
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'R L Revestimentos e Construções',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Venâncio Orsini, 112',
  null,
  '1148201011',
  null,
  'manual_google',
  true,
  now(),
  'rl-revestimentos-construcoes-rio-grande-da-serra',
  'pedreiro',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'E L O - Construções e Incorporações',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 143',
  null,
  '1148253048',
  null,
  'manual_google',
  true,
  now(),
  'elo-construcoes-incorporacoes-rio-grande-da-serra',
  'pedreiro',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Facilcon Comércio Construções e Serviços',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 214',
  null,
  '1148211001',
  null,
  'manual_google',
  true,
  now(),
  'facilcon-comercio-construcoes-rio-grande-da-serra',
  'pedreiro',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Nilton de Paula Gestor em Negócios Imobiliários e Reformas',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Carlos José Carlson, 226',
  '11994206440',
  null,
  null,
  'manual_google',
  true,
  now(),
  'nilton-de-paula-reformas-rio-grande-da-serra',
  'pedreiro',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'CN Serviços Elétricos e Reformas',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11969397204',
  '11969397204',
  null,
  'manual_google',
  true,
  now(),
  'cn-servicos-reformas-rio-grande-da-serra',
  'pedreiro',
  'https://cnservicoseletricos.com.br',
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 3. MARIDO DE ALUGUEL (2 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Marido de Aluguel SP',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11978869531',
  '11978869531',
  null,
  'manual_google',
  true,
  now(),
  'marido-de-aluguel-sp-rio-grande-da-serra',
  'marido_aluguel',
  'https://www.socorramemaridodealuguel.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'SOS Soluções',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11969456072',
  '11969456072',
  'contato@sosreformasereparos.com.br',
  'manual_google',
  true,
  now(),
  'sos-solucoes-rio-grande-da-serra',
  'marido_aluguel',
  'https://www.sosreformasereparos.com.br',
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 4. ELETRICISTAS (3 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'CN Serviços Elétricos',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11969397204',
  '11969397204',
  null,
  'manual_google',
  true,
  now(),
  'cn-servicos-eletricos-rio-grande-da-serra',
  'eletricista',
  'https://cnservicoseletricos.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'VoltBR Manutenção Elétrica',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  null,
  '1147231669',
  null,
  'manual_google',
  true,
  now(),
  'voltbr-manutencao-eletrica-rio-grande-da-serra',
  'eletricista',
  'https://voltbr.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Encanador e Eletricista 24 Horas RGS',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11973562381',
  '11973562381',
  null,
  'manual_google',
  true,
  now(),
  'eletricista-24h-rgs-rio-grande-da-serra',
  'eletricista',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 5. ENCANADORES (3 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'SOS Prestadora de Serviços',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11997414460',
  '11997414460',
  null,
  'manual_google',
  true,
  now(),
  'sos-prestadora-de-servicos-rio-grande-da-serra',
  'encanador',
  'https://www.sosprestadoradeservicos.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Maestrotec Encanador',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  null,
  '1141129000',
  null,
  'manual_google',
  true,
  now(),
  'maestrotec-encanador-rio-grande-da-serra',
  'encanador',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Encanador 24 Horas Rio Grande da Serra',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11973562381',
  '11973562381',
  null,
  'manual_google',
  true,
  now(),
  'encanador-24h-rio-grande-da-serra',
  'encanador',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 6. JARDINEIROS (4 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Native Garden',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rio Grande da Serra - SP',
  null,
  null,
  null,
  'manual_google',
  true,
  now(),
  'native-garden-rio-grande-da-serra',
  'jardineiro',
  'https://nativegarden.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Equipe Garden Paisagismo',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rio Grande da Serra - SP',
  null,
  null,
  null,
  'manual_google',
  true,
  now(),
  'equipe-garden-paisagismo-rio-grande-da-serra',
  'jardineiro',
  'https://equipegarden.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Grupo Brasanitas',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rio Grande da Serra - SP',
  null,
  '1128795922',
  null,
  'manual_google',
  true,
  now(),
  'grupo-brasanitas-rio-grande-da-serra',
  'jardineiro',
  'https://grupobrasanitas.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Global Pedras Paisagismo',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rio Grande da Serra - SP',
  null,
  null,
  null,
  'manual_google',
  true,
  now(),
  'global-pedras-paisagismo-rio-grande-da-serra',
  'jardineiro',
  'https://globalpedras.com.br',
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 7. LAVANDERIAS (3 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Lavanderia Lavô',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 87',
  '11995040505',
  '11995040505',
  null,
  'manual_google',
  true,
  now(),
  'lavanderia-lavo-rio-grande-da-serra',
  'lavanderia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Lavanderia Washtec',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro (Ribeirão Pires - atende RGS)',
  'Av. Fortuna, 271 - Centro, Ribeirão Pires',
  null,
  '1148277859',
  null,
  'manual_google',
  true,
  now(),
  'lavanderia-washtec-rio-grande-da-serra',
  'lavanderia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Lava Smart Lavanderia',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  null,
  null,
  null,
  'manual_google',
  true,
  now(),
  'lava-smart-lavanderia-rio-grande-da-serra',
  'lavanderia',
  'https://lavanderialavasmart.com.br',
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 8. FAXINA & LIMPEZA PROFISSIONAL (3 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'IndustrialClean Brasil',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  '11984667055',
  '11984667055',
  null,
  'manual_google',
  true,
  now(),
  'industrialclean-brasil-rio-grande-da-serra',
  'limpeza_pos_obra',
  'https://industrialcleanbrasil.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Effect Brasil Limpeza Profissional',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Rio Grande da Serra',
  'Rio Grande da Serra - SP',
  null,
  '1143237664',
  null,
  'manual_google',
  true,
  now(),
  'effect-brasil-limpeza-rio-grande-da-serra',
  'limpeza_pos_obra',
  'https://effectbrasil.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Grupo FLS Terceirização e Limpeza',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Mauá (atende RGS)',
  'Mauá - SP',
  '1144722990',
  '1144722990',
  null,
  'manual_google',
  true,
  now(),
  'grupo-fls-limpeza-rio-grande-da-serra',
  'limpeza_pos_obra',
  'https://grupofls.com.br',
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 9. LOJAS DE CARROS / AUTOMÓVEIS (7 registros)
-- Fonte: Google Maps (verificado via browser)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Pontes Veículos',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 170',
  '11947700817',
  '1148215728',
  null,
  'manual_google',
  true,
  now(),
  'pontes-veiculos-rio-grande-da-serra',
  'automoveis',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'MF Automóveis',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 170',
  null,
  '1148214232',
  null,
  'manual_google',
  true,
  now(),
  'mf-automoveis-rio-grande-da-serra',
  'automoveis',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Danicar Multimarcas',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua José Maria Figueiredo, 236',
  null,
  '1148204298',
  null,
  'manual_google',
  true,
  now(),
  'danicar-multimarcas-rio-grande-da-serra',
  'automoveis',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Pontes Veículos II',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua José Maria Figueiredo, 58',
  '11989744807',
  '11989744807',
  null,
  'manual_google',
  true,
  now(),
  'pontes-veiculos-ii-rio-grande-da-serra',
  'automoveis',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Quallicar Veículos',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Venâncio Orsini, 22',
  '11984382902',
  '11949665152',
  null,
  'manual_google',
  true,
  now(),
  'quallicar-veiculos-rio-grande-da-serra',
  'automoveis',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'PlanAuto Multimarcas',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Av. Dom Pedro I, 780',
  null,
  '1148202669',
  null,
  'manual_google',
  true,
  now(),
  'planauto-multimarcas-rio-grande-da-serra',
  'automoveis',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Juliana Veículos',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Carolina Gomes de Figueiredo',
  '11975444084',
  '11975444084',
  null,
  'manual_google',
  true,
  now(),
  'juliana-veiculos-rio-grande-da-serra',
  'automoveis',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 10. DESPACHANTES (2 registros)
-- Fonte: Google Maps (verificado via browser)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Despachante Impacto',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua José Maria Figueiredo, 630',
  null,
  '1148204270',
  'despachanteimpacto@terra.com.br',
  'manual_google',
  true,
  now(),
  'despachante-impacto-rio-grande-da-serra',
  'despachante',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Despachante Pérola',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Lidia Pollone, 24',
  null,
  '1148203467',
  'despachanteperola@gmail.com',
  'manual_google',
  true,
  now(),
  'despachante-perola-rio-grande-da-serra',
  'despachante',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 11. TERAPIA E PSICOLOGIA (4 registros)
-- Fonte: Google Maps (verificado via browser)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'HBClin Psicologia',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Av. Dom Pedro I, 475 - Sala 4',
  '11943464969',
  '1127701181',
  null,
  'manual_google',
  true,
  now(),
  'hbclin-psicologia-rio-grande-da-serra',
  'psicologia',
  'https://hbclin.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Psicóloga Elisabete Ferle',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rio Grande da Serra - SP',
  '11957775941',
  '11957775941',
  null,
  'manual_google',
  true,
  now(),
  'psicologa-elisabete-ferle-rio-grande-da-serra',
  'psicologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Vitalize Clínica Humanizada de Recuperação',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Érico Veríssimo, 18',
  '11954185638',
  '11954185638',
  null,
  'manual_google',
  true,
  now(),
  'vitalize-clinica-humanizada-rio-grande-da-serra',
  'psicologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Cíntia Lopes Psicóloga Clínica',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rio Grande da Serra - SP',
  '11987571553',
  '11987571553',
  null,
  'manual_google',
  true,
  now(),
  'cintia-lopes-psicologa-rio-grande-da-serra',
  'psicologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 12. FISIOTERAPIA (1 registro)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Orthus Serviços Médicos Fisioterapia',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Parque Indaiá',
  'Rua Prefeito Cido Franco, 315',
  null,
  '1148212195',
  null,
  'manual_google',
  true,
  now(),
  'orthus-servicos-medicos-fisioterapia-rio-grande-da-serra',
  'fisioterapia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 13. CLÍNICAS E DENTISTAS (5 registros)
-- Fonte: Google Maps (verificado via browser)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Odonto Serra',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 381',
  null,
  '1148212770',
  null,
  'manual_google',
  true,
  now(),
  'odonto-serra-rio-grande-da-serra',
  'odontologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Smile Odontologia',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Av. Dom Pedro I, 357',
  null,
  '1148212365',
  null,
  'manual_google',
  true,
  now(),
  'smile-odontologia-rio-grande-da-serra',
  'odontologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Sorridents Rio Grande da Serra',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Vila Conde',
  'Av. Dom Pedro I, 305',
  null,
  '1148212384',
  null,
  'manual_google',
  true,
  now(),
  'sorridents-rio-grande-da-serra',
  'odontologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Clínica Odontológica Dra. Maria Lúcia de Oliveira',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Parque Indaiá',
  'Rua Prefeito Cido Franco, 304',
  null,
  '1148211717',
  null,
  'manual_google',
  true,
  now(),
  'clinica-dra-maria-lucia-rio-grande-da-serra',
  'odontologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Ortodontia Dr. Márcio',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Av. Dom Pedro I, 501',
  null,
  '1148202135',
  null,
  'manual_google',
  true,
  now(),
  'ortodontia-dr-marcio-rio-grande-da-serra',
  'odontologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 14. PERSONAL E ACADEMIAS (5 registros)
-- Fonte: Google Maps + Wellhub/Fresha
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Academia Fit Stop',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 240',
  null,
  '1148211250',
  null,
  'manual_google',
  true,
  now(),
  'academia-fit-stop-rio-grande-da-serra',
  'personal_trainer',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Bio Sport Academia',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 255',
  '11947479759',
  '11947479759',
  null,
  'manual_google',
  true,
  now(),
  'bio-sport-academia-rio-grande-da-serra',
  'personal_trainer',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Academia Vila Conde',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Vila Conde',
  'Av. José Bello, 638',
  null,
  '1148212321',
  null,
  'manual_google',
  true,
  now(),
  'academia-vila-conde-rio-grande-da-serra',
  'personal_trainer',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Academia Power Shape',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Av. Dom Pedro I, 305',
  '11973956548',
  '11973956548',
  null,
  'manual_google',
  true,
  now(),
  'academia-power-shape-rio-grande-da-serra',
  'personal_trainer',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Academia Fox',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Fernão Dias, 35',
  null,
  '1148211770',
  null,
  'manual_google',
  true,
  now(),
  'academia-fox-rio-grande-da-serra',
  'personal_trainer',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 15. ESTÉTICA E BELEZA (5 registros)
-- Fonte: Google Maps + Fresha + listamais.com.br
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Glamour Cabelo e Estética',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Carlos José Carlson, 120',
  null,
  '1148215338',
  null,
  'manual_google',
  true,
  now(),
  'glamour-cabelo-estetica-rio-grande-da-serra',
  'estetica',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Espaço Estética e Bem Estar',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 381',
  '11948285688',
  '11948285688',
  null,
  'manual_google',
  true,
  now(),
  'espaco-estetica-bem-estar-rio-grande-da-serra',
  'estetica',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Renata Estética',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua João Ramalho, 22',
  '11974121437',
  '11974121437',
  null,
  'manual_google',
  true,
  now(),
  'renata-estetica-rio-grande-da-serra',
  'estetica',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'D''Palle Estética',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua Prefeito Cido Franco, 48',
  null,
  '1148212746',
  null,
  'manual_google',
  true,
  now(),
  'dpalle-estetica-rio-grande-da-serra',
  'estetica',
  null,
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Centro de Estética Daniela Ferreira',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rio Grande da Serra - SP',
  '11975882110',
  '11975882110',
  null,
  'manual_google',
  true,
  now(),
  'centro-estetica-daniela-ferreira-rio-grande-da-serra',
  'estetica',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 16. PODOLOGIA (2 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'HBClin Podologia',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Av. Dom Pedro I, 475 - Sala 4',
  '11943464969',
  '1127701181',
  null,
  'manual_google',
  true,
  now(),
  'hbclin-podologia-rio-grande-da-serra',
  'podologia',
  'https://hbclin.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Espaço Cuidare Podologia e Estética',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Centro',
  'Rua José Maria Figueiredo, 169',
  null,
  null,
  null,
  'manual_google',
  true,
  now(),
  'espaco-cuidare-podologia-rio-grande-da-serra',
  'podologia',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;


-- =============================================================================
-- 17. CUIDADORES — IDOSOS/CRIANÇAS (2 registros)
-- =============================================================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Clínica Duarte Saúde Integrativa',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Ribeirão Pires (atende RGS)',
  'Ribeirão Pires - SP',
  '11992193554',
  '11992193554',
  null,
  'manual_google',
  true,
  now(),
  'clinica-duarte-saude-integrativa-rio-grande-da-serra',
  'cuidador',
  'https://homecareduarte.com.br',
  'rio-grande-da-serra',
  'SP',
  null
),
(
  gen_random_uuid(),
  'Acuidar - Cuidadores Domiciliares',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Grande ABC (atende RGS)',
  'Rio Grande da Serra - SP',
  null,
  null,
  null,
  'manual_google',
  true,
  now(),
  'acuidar-cuidadores-rio-grande-da-serra',
  'cuidador',
  'https://acuidarbr.com.br',
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;
