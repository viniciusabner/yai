-- 301_real_psicologia_rgs.sql
-- TERAPIA E PSICOLOGIA — Rio Grande da Serra
-- Fonte: Google Maps (verificado via browser)
-- Total: 4 registros

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
