-- 99. Insert Pest Control (Dedetizadora) Providers (Diadema)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'Dedetizadora Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Império', 'Henry Leonardos, 27', '11965967422', '11965967422', 'adm@diademadedetizadora.com.br', 'manual_google', true, 'dedetizadora-diadema-diadema', 'dedetizadora', 'https://diademadedetizadora.com.br', null),
  (gen_random_uuid(), 'Deco Dedetizadora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', '11962653513', null, null, 'manual_google', true, 'deco-dedetizadora-diadema', 'dedetizadora', 'https://decodedetizadora.com.br', null),
  (gen_random_uuid(), 'Dedetizadora Menor Preço', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Alda, 0', '11913628000', null, null, 'manual_google', true, 'dedetizadora-menor-preco-diadema', 'dedetizadora', 'https://dedetizadoramenorpreco.com.br', null),
  (gen_random_uuid(), 'Termitek Dedetizadora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'termitek-dedetizadora-diadema', 'dedetizadora', 'https://termitek.com.br', null),
  (gen_random_uuid(), 'EccoClean Dedetizadora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'eccoclean-dedetizadora-diadema', 'dedetizadora', 'https://eccocleandedetizacao.com.br', null),
  (gen_random_uuid(), 'EcoServiços Dedetizadora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'ecoservicos-dedetizadora-diadema', 'dedetizadora', 'https://ecoservicos.com.br', null),
  (gen_random_uuid(), 'Dedetizadora ABC', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, '1144585000', null, 'manual_google', true, 'dedetizadora-abc-diadema', 'dedetizadora', 'https://dedetizacao-dedetizadora.com.br', null),
  (gen_random_uuid(), 'Lunar Dedetizadora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'lunar-dedetizadora-diadema', 'dedetizadora', 'https://lunardedetizadora.com.br', null),
  (gen_random_uuid(), 'Dedetizadora Lava Imper', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', null, null, null, 'manual_google', true, 'dedetizadora-lava-imper-diadema', 'dedetizadora', 'https://dedetizadorbrasil.com.br', null),
  (gen_random_uuid(), 'Mata Rápido Dedetizadora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Diadema - SP', '11984424066', '1142531778', null, 'manual_google', true, 'mata-rapido-dedetizadora-diadema', 'dedetizadora', 'https://matarapido.com.br', null)
ON CONFLICT (slug) DO NOTHING;
