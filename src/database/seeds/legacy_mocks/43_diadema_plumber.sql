-- 43. Insert Plumbers (Encanador) Providers (Diadema)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Encanador 24h Perto de Mim', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11912062131', '11912062131', 'contato@encanadorpertodemim.com', 'manual_google', true, 'encanador-24h-perto-de-mim-diadema', 'encanador', 'https://www.encanadorpertodemim.com', null),
  (gen_random_uuid(), 'SOS Prestadora de Serviços', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11997414460', '11997414460', 'contato@sosprestadoradeservicos.com.br', 'manual_google', true, 'sos-prestadora-de-servicos-diadema', 'encanador', 'https://www.sosprestadoradeservicos.com.br', null),
  (gen_random_uuid(), 'Ótima Desentupidora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11978595935', '11978595935', 'contato@otimadesentupidora.com.br', 'manual_google', true, 'otima-desentupidora-diadema', 'encanador', 'https://www.otimadesentupidora.com.br', null),
  (gen_random_uuid(), 'Manutenção Residencial', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11948931000', '1141144004', 'contato@manutencaoresidencial.srv.br', 'manual_google', true, 'manutencao-residencial-diadema', 'encanador', 'https://www.manutencaoresidencial.srv.br', null),
  (gen_random_uuid(), 'Encanador Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11973562381', '11973562381', 'contato@encanadoremaruja.com.br', 'manual_google', true, 'encanador-diadema', 'encanador', 'https://www.encanadoremaruja.com.br', null),
  (gen_random_uuid(), 'Encanador Diadema 24h', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11942142000', '1142142000', 'contato@encanador24horas.srv.br', 'manual_google', true, 'encanador-diadema-24h', 'encanador', 'https://www.encanador24horas.srv.br', null)
ON CONFLICT (slug) DO NOTHING;
