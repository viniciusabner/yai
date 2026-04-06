-- 39. Insert Electricians (Eletricista) Providers (Rio Grande da Serra)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Eletricista 24hs', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Rio Grande da Serra', 'Rio Grande da Serra/SP', '11948931000', '11948931000', 'contato@eletricista24hs.srv.br', 'manual_google', true, 'eletricista-24hs-rio-grande-da-serra', 'eletricista', 'https://www.eletricista24hs.srv.br', null),
  (gen_random_uuid(), 'Volt''BR', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Rio Grande da Serra', 'Rio Grande da Serra/SP', '1147231669', '1147231669', 'contato@voltbr.com.br', 'manual_google', true, 'voltbr-rio-grande-da-serra', 'eletricista', 'https://www.voltbr.com.br', null),
  (gen_random_uuid(), 'Adriano Eletricista', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Rio Grande da Serra', 'Rio Grande da Serra/SP', null, null, 'contato@adrianoeletricista.com', 'manual_google', true, 'adriano-eletricista-rio-grande-da-serra', 'eletricista', 'https://www.adrianoeletricista.com', null),
  (gen_random_uuid(), 'Ninjas Eletricistas', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Rio Grande da Serra', 'Rio Grande da Serra/SP', null, null, 'contato@ninjaseletricistas.com.br', 'manual_google', true, 'ninjas-eletricistas-rio-grande-da-serra', 'eletricista', 'https://www.ninjaseletricistas.com.br', null),
  (gen_random_uuid(), 'Eletricista Rápido', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Rio Grande da Serra', 'Rio Grande da Serra/SP', null, null, 'contato@eletricistarapido.com', 'manual_google', true, 'eletricista-rapido-rio-grande-da-serra', 'eletricista', 'https://www.eletricistarapido.com', null)
ON CONFLICT (slug) DO NOTHING;
