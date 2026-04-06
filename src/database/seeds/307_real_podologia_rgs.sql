-- 307_real_podologia_rgs.sql
-- PODOLOGIA — Rio Grande da Serra
-- Fonte: Google Maps + Fresha
-- Total: 2 registros

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
