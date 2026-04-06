-- 295_real_jardineiro_rgs.sql
-- JARDINEIROS — Rio Grande da Serra
-- Fonte: Pesquisa manual Google/Maps (dados legados verificados + novos)
-- Total: 4 registros
-- Obs: Os 4 prestadores legados são mantidos pois foram encontrados em buscas independentes.
--       Não foram encontrados jardineiros adicionais verificáveis exclusivos de RGS.

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
