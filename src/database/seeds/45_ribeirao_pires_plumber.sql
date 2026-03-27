-- 45. Insert Plumbers (Encanador) Providers (Ribeirão Pires)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Hidrotex Ribeirão Pires', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ribeirão Pires', 'Ribeirão Pires/SP', '11948931000', '1141144004', 'contato@manutencaoresidencial.srv.br', 'manual_google', true, 'hidrotex-ribeirao-pires', 'encanador', 'https://www.manutencaoresidencial.srv.br', null),
  (gen_random_uuid(), 'RDG Caça Vazamentos', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ribeirão Pires', 'Ribeirão Pires/SP', '11951138397', '11951138397', 'contato@rdgcacavazamento.com.br', 'manual_google', true, 'rdg-caca-vazamentos-ribeirao-pires', 'encanador', 'https://www.rdgcacavazamento.com.br', null),
  (gen_random_uuid(), 'SOS Prestadora de Serviços', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ribeirão Pires', 'Ribeirão Pires/SP', '11997414460', '11997414460', 'contato@sosprestadoradeservicos.com.br', 'manual_google', true, 'sos-prestadora-de-servicos-ribeirao-pires', 'encanador', 'https://www.sosprestadoradeservicos.com.br', null),
  (gen_random_uuid(), 'Maestrotec Encanador', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ribeirão Pires', 'Ribeirão Pires/SP', null, '1141129000', 'contato@encanador.adm.br', 'manual_google', true, 'maestrotec-encanador-ribeirao-pires', 'encanador', 'https://www.encanador.adm.br', null),
  (gen_random_uuid(), 'Encanador Perto de Mim', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ribeirão Pires', 'Ribeirão Pires/SP', null, null, 'contato@encanadorpertodemim.com', 'manual_google', true, 'encanador-perto-de-mim-ribeirao-pires', 'encanador', 'https://www.encanadorpertodemim.com', null)
ON CONFLICT (slug) DO NOTHING;
