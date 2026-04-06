-- 95. Insert Gardener (Jardineiro) Providers (Rio Grande da Serra)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais (ou próximos que atendem a região)
  (gen_random_uuid(), 'Native Garden', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, null, null, 'manual_google', true, 'native-garden-rio-grande-da-serra', 'jardineiro', 'https://nativegarden.com.br', null),
  (gen_random_uuid(), 'Equipe Garden Paisagismo', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, null, null, 'manual_google', true, 'equipe-garden-paisagismo-rio-grande-da-serra', 'jardineiro', 'https://equipegarden.com.br', null),
  (gen_random_uuid(), 'Grupo Brasanitas', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, '1128795922', null, 'manual_google', true, 'grupo-brasanitas-rio-grande-da-serra', 'jardineiro', 'https://grupobrasanitas.com.br', null),
  (gen_random_uuid(), 'Global Pedras Paisagismo', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, null, null, 'manual_google', true, 'global-pedras-paisagismo-rio-grande-da-serra', 'jardineiro', 'https://globalpedras.com.br', null)
ON CONFLICT (slug) DO NOTHING;
