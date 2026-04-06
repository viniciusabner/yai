-- 302_real_fisioterapia_rgs.sql
-- FISIOTERAPIA — Rio Grande da Serra
-- Fonte: Google Maps (verificado via browser)
-- Total: 1 registro

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
