-- 44. Insert Plumbers (Encanador) Providers (Mauá)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Manutenção Residencial', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11948931000', '1141144004', 'contato@manutencaoresidencial.srv.br', 'manual_google', true, 'manutencao-residencial-maua', 'encanador', 'https://www.manutencaoresidencial.srv.br', null),
  (gen_random_uuid(), 'Hidrotex Encanador', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11913628000', '11913628000', 'contato@encanadorhidrotex.com.br', 'manual_google', true, 'hidrotex-encanador-maua', 'encanador', 'https://www.encanadorhidrotex.com.br', null),
  (gen_random_uuid(), 'Delares Manutenção Residencial', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@guiafix.com.br', 'manual_google', true, 'delares-manutencao-residencial-maua', 'encanador', 'https://www.guiafix.com.br', null),
  (gen_random_uuid(), 'Hidráulica Elétrica MIX House ABC', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@guiafix.com.br', 'manual_google', true, 'hidraulica-eletrica-mix-house-abc-maua', 'encanador', 'https://www.guiafix.com.br', null),
  (gen_random_uuid(), 'Encanador Perto de Mim', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, 'contato@encanadorpertodemim.com', 'manual_google', true, 'encanador-perto-de-mim-maua', 'encanador', 'https://www.encanadorpertodemim.com', null)
ON CONFLICT (slug) DO NOTHING;
