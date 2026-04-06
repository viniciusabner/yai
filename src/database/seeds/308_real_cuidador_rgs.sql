-- 308_real_cuidador_rgs.sql
-- CUIDADORES (IDOSOS/CRIANÇAS) — Rio Grande da Serra
-- Fonte: Web search
-- Total: 2 registros
-- Obs: Não há agências locais em RGS. Ambas são regionais que atendem a área.
--       Clínica Duarte é de Ribeirão Pires, Acuidar atende todo Grande ABC.

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
