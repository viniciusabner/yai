-- 296_real_lavanderia_rgs.sql
-- LAVANDERIAS — Rio Grande da Serra
-- Fonte: Pesquisa manual Google/Maps (encontrelavanderia.com, Waze, sites oficiais)
-- Total: 3 registros
-- Obs: Cidade pequena — Lavanderia Lavô é a única local confirmada.
--       Washtec e Lavateria Fast são de Ribeirão Pires mas atendem a região.

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
