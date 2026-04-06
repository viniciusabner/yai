-- 297_real_limpeza_rgs.sql
-- FAXINA & LIMPEZA PROFISSIONAL — Rio Grande da Serra
-- Fonte: Pesquisa manual Google/Maps
-- Total: 3 registros
-- Obs: Não há empresas de limpeza exclusivas de RGS.
--       Todos os prestadores abaixo são regionais (Grande ABC/SP) que atendem RGS.
--       IndustrialClean e Effect Brasil confirmados com telefone e site.
--       Grupo FLS atende Mauá/Ribeirão Pires/região.

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
