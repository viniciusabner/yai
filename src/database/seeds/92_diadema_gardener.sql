-- 92. Insert Gardener (Jardineiro) Providers (Diadema)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'Floema Jardinagem e Paisagismo', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Sete de Setembro, 151', null, '1140572304', null, 'manual_google', true, 'floema-jardinagem-diadema', 'jardineiro', null, null),
  (gen_random_uuid(), 'Verde Vivo Jardinagem', (SELECT id FROM public.cities WHERE slug='diadema'), 'Jardim Portinari', 'Diadema - SP', null, null, null, 'manual_google', true, 'verde-vivo-jardinagem-diadema', 'jardineiro', null, null),
  (gen_random_uuid(), 'GEBE GARDEN', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'gebe-garden-diadema', 'jardineiro', 'https://gebegarden.com.br', null),
  (gen_random_uuid(), 'Via Verde Paisagismo Ambiental', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'via-verde-paisagismo-diadema', 'jardineiro', null, null),
  (gen_random_uuid(), 'Dular Jardinagem', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'dular-jardinagem-diadema', 'jardineiro', 'https://dularjardinagem.com.br', null),
  (gen_random_uuid(), 'Master House Jardineiro', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'master-house-jardineiro-diadema', 'jardineiro', 'https://masterhousesolucoes.com.br', null),
  (gen_random_uuid(), 'Tudo Verde Paisagismo', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'tudo-verde-paisagismo-diadema', 'jardineiro', 'https://proverdepaisagismo.com.br', null),
  (gen_random_uuid(), 'Agrotama Jardinagem', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Prestes Maia, 811', null, null, null, 'manual_google', true, 'agrotama-jardinagem-diadema', 'jardineiro', 'https://agrotama.com.br', null)
ON CONFLICT (slug) DO NOTHING;
