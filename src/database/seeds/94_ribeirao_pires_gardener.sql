-- 94. Insert Gardener (Jardineiro) Providers (Ribeirão Pires)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'Gabi Plantas', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Av. Pref. Valdírio Prisco, 459', '11935359192', null, 'contato@floreseplantasgabi.com.br', 'manual_google', true, 'gabi-plantas-ribeirao-pires', 'jardineiro', 'https://floreseplantasgabi.com.br', null),
  (gen_random_uuid(), 'Santista Serviços Jardinagem', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'santista-servicos-jardinagem-ribeirao-pires', 'jardineiro', 'https://santistaservicos.com.br', null),
  (gen_random_uuid(), 'RBW Brasil Jardinagem', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'rbw-brasil-jardinagem-ribeirao-pires', 'jardineiro', 'https://rbwgrupo.com.br', null),
  (gen_random_uuid(), 'Master House Jardineiro', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'master-house-jardineiro-ribeirao-pires', 'jardineiro', 'https://masterhousesolucoes.com.br', null),
  (gen_random_uuid(), 'Dular Jardinagem', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'dular-jardinagem-ribeirao-pires', 'jardineiro', 'https://dularjardinagem.com.br', null),
  (gen_random_uuid(), 'Verdy Paisagismo', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'verdy-paisagismo-ribeirao-pires', 'jardineiro', 'https://verdypaisagismo.com.br', null),
  (gen_random_uuid(), 'Tudo em Verde Paisagismo', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'tudo-em-verde-paisagismo-ribeirao-pires', 'jardineiro', 'https://proverdepaisagismo.com.br', null)
ON CONFLICT (slug) DO NOTHING;
