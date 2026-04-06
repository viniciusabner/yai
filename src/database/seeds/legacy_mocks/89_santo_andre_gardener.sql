-- 89. Insert Gardener (Jardineiro) Providers (Santo André)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'Lótus Paisagismo e Irrigação', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Santo André - SP', null, null, null, 'manual_google', true, 'lotus-paisagismo-santo-andre', 'jardineiro', 'https://lotuspaisagismo.com', null),
  (gen_random_uuid(), 'A Varanda Floricultura e Paisagismo', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Gilda', 'Praça Allan Kardec, 70', '11943196056', null, 'avaranda@avaranda.com.br', 'manual_google', true, 'a-varanda-paisagismo-santo-andre', 'jardineiro', 'https://avaranda.net', null),
  (gen_random_uuid(), 'Verdeperto Paisagismo', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Santo André - SP', null, null, null, 'manual_google', true, 'verdeperto-paisagismo-santo-andre', 'jardineiro', 'https://verdepertopaisagismo.com', null),
  (gen_random_uuid(), 'Dular Jardinagem', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Santo André - SP', null, null, null, 'manual_google', true, 'dular-jardinagem-santo-andre', 'jardineiro', 'https://dularjardinagem.com.br', null),
  (gen_random_uuid(), 'Paineira Garden', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Parque Jaçatuba', 'Av. Engenheiro Olavo Alaysio de Lima, 220', '11963182011', '1149964416', 'paineira.jardinagem@terra.com.br', 'manual_google', true, 'paineira-garden-santo-andre', 'jardineiro', 'https://paineiragarden.com.br', null)
ON CONFLICT (slug) DO NOTHING;
