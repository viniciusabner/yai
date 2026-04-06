-- 300_real_despachante_rgs.sql
-- DESPACHANTES — Rio Grande da Serra
-- Fonte: Pesquisa manual Google Maps (verificado via browser)
-- Total: 2 registros
-- Obs: JR Despachantes é de Osasco (apenas SEO local), descartado.
--       Ambos os despachantes ficam no Centro, próximos ao posto do Detran-SP.

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
