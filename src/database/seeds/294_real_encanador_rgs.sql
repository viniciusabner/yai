-- 294_real_encanador_rgs.sql
-- ENCANADORES — Rio Grande da Serra
-- Fonte: Pesquisa manual Google/Maps
-- Total: 3 registros
-- Obs: Entradas com telefone 11948931000 descartadas (fictício/duplicado).
--       SOS Prestadora de Serviços mantida (slug existente).
--       Maestrotec atende a região a partir de cidade vizinha.

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
