-- 102. Insert Pest Control (Dedetizadora) Providers (Rio Grande da Serra)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'KS Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', '11986227000', '1144585000', null, 'manual_google', true, 'ks-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://dedetizacao-dedetizadora.com.br', null),
  (gen_random_uuid(), 'Hidromix Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', '11953890004', '1158194555', null, 'manual_google', true, 'hidromix-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://hidromixdesentupidora.com.br', null),
  (gen_random_uuid(), 'D5 Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', '11911731885', '1144103931', null, 'manual_google', true, 'd5-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://dedetizadorad5.com.br', null),
  (gen_random_uuid(), 'Sanemix Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, '08007117000', null, 'manual_google', true, 'sanemix-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://sanemix.com.br', null),
  (gen_random_uuid(), 'Compasan Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, '1151971503', null, 'manual_google', true, 'compasan-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://dedetizadoracompasan.com.br', null),
  (gen_random_uuid(), 'Controllar Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, null, null, 'manual_google', true, 'controllar-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://controllarpragas.com.br', null),
  (gen_random_uuid(), 'Primos Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, null, null, 'manual_google', true, 'primos-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://primosdedetizadora.com.br', null),
  (gen_random_uuid(), 'Grupo Brasanitas', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, '1128795922', null, 'manual_google', true, 'grupo-brasanitas-rio-grande-da-serra', 'dedetizadora', 'https://grupobrasanitas.com.br', null)
ON CONFLICT (slug) DO NOTHING;
