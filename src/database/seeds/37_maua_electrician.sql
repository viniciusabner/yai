-- 37. Insert Electricians (Eletricista) Providers (Mauá)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Eletricista Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11948931000', '5511948931000', 'contato@eletricista24hs.srv.br', 'manual_google', true, 'eletricista-maua', 'eletricista', 'https://www.eletricista24hs.srv.br', null),
  (gen_random_uuid(), 'Silva Eletricista', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11994593320', '11994593320', null, 'manual_google', true, 'silva-eletricista-maua', 'eletricista', 'https://www.olx.com.br', null),
  (gen_random_uuid(), 'Fag Elétrica', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@fageletrica.com.br', 'manual_google', true, 'fag-eletrica-maua', 'eletricista', 'https://www.fageletrica.com.br', null),
  (gen_random_uuid(), 'Eletricista24hs Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11948082000', '11948082000', 'contato@eletricista24hs.adm.br', 'manual_google', true, 'eletricista-24hs-maua', 'eletricista', 'https://www.eletricista24hs.adm.br', null),
  (gen_random_uuid(), 'Eletricista Rápido', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@eletricistarapido.com', 'manual_google', true, 'eletricista-rapido-maua', 'eletricista', 'https://www.eletricistarapido.com', null)
ON CONFLICT (slug) DO NOTHING;
