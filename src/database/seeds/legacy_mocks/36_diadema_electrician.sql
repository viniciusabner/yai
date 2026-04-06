-- 36. Insert Electricians (Eletricista) Providers (Diadema)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Eletricista Diadema - Centro', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11948931000', '5511948931000', 'contato@eletricista24hs.srv.br', 'manual_google', true, 'eletricista-diadema-centro', 'eletricista', 'https://www.eletricista24hs.srv.br', null),
  (gen_random_uuid(), 'Eletricista em Diadema-SP', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11999999999', '11999999999', 'contato@eletricistadiadema.com.br', 'manual_google', true, 'eletricista-em-diadema-sp', 'eletricista', 'https://www.eletricistadiadema.com.br', null),
  (gen_random_uuid(), 'ElectriKmente - Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11983324081', '11983324081', 'contato@electrikmente.com.br', 'manual_google', true, 'electrikmente-diadema', 'eletricista', 'https://www.electrikmente.com.br', null),
  (gen_random_uuid(), 'Eletricista em Diadema SP (24h)', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', null, null, 'contato@eletricista24hspertodemim.com.br', 'manual_google', true, 'eletricista-em-diadema-sp-24h', 'eletricista', 'https://www.eletricista24hspertodemim.com.br', null),
  (gen_random_uuid(), 'Fag Elétrica', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', null, null, 'contato@fageletrica.com.br', 'manual_google', true, 'fag-eletrica-diadema', 'eletricista', 'https://www.fageletrica.com.br', null)
ON CONFLICT (slug) DO NOTHING;
