-- 293_real_eletricista_rgs.sql
-- ELETRICISTAS — Rio Grande da Serra
-- Fonte: Pesquisa manual Google/Maps
-- Total: 3 registros
-- Obs: Dados anteriores tinham telefones duplicados (11948931000) e emails fictícios.
--       Busca do zero. VoltBR é de Mogi das Cruzes mas atende região. CN Serviços é do Grande ABC.

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
