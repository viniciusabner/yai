-- 30. Insert Handyman (Marido de Aluguel) Providers (Mauá)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Marido de Aluguel Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11948931000', '551141144004', 'contato@maridodealuguel.adm.br', 'manual_google', true, 'marido-de-aluguel-maua', 'marido_aluguel', 'https://www.maridodealuguel.adm.br', null),
  (gen_random_uuid(), 'Marido de Aluguel BR Ribeiro', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11940087447', '11940087447', null, 'manual_google', true, 'marido-de-aluguel-br-ribeiro-maua', 'marido_aluguel', 'https://www.ueniweb.com', null),
  (gen_random_uuid(), 'Marido de Aluguel ABC (Grupo FFN)', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11947446375', '1142353811', 'contato@maridoaluguelabc.com.br', 'manual_google', true, 'marido-de-aluguel-abc-grupo-ffn-maua', 'marido_aluguel', 'https://www.maridoaluguelabc.com.br', null),
  (gen_random_uuid(), 'Marido de Aluguel Pequenos Reparos', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@guiafix.com.br', 'manual_google', true, 'marido-de-aluguel-pequenos-reparos-maua', 'marido_aluguel', 'https://www.guiafix.com.br', null),
  (gen_random_uuid(), 'Silva Eletricista (Marido de Aluguel)', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11994593320', '11994593320', null, 'manual_google', true, 'silva-eletricista-marido-de-aluguel-maua', 'marido_aluguel', 'https://www.olx.com.br', null),
  (gen_random_uuid(), 'Eletricista 24HS Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@eletricista24hs.srv.br', 'manual_google', true, 'eletricista-24hs-maua', 'eletricista', 'https://www.eletricista24hs.srv.br', null),
  (gen_random_uuid(), 'Hidrojateamento Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@hidrojateamento.srv.br', 'manual_google', true, 'hidrojateamento-maua', 'encanador', 'https://www.hidrojateamento.srv.br', null)
ON CONFLICT (slug) DO NOTHING;
