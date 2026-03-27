-- 40. Insert Plumbers (Encanador) Providers (Santo André)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'MN Bombeiro Hidráulico', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11998915520', '1120543970', 'contato@mnvazamentosetelhados.com.br', 'manual_google', true, 'mn-bombeiro-hidraulico-santo-andre', 'encanador', 'https://www.mnvazamentosetelhados.com.br', null),
  (gen_random_uuid(), 'Encanador Residencial Santo André', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11965302372', '11965302372', 'contato@encanador.santoandre.br', 'manual_google', true, 'encanador-residencial-santo-andre', 'encanador', 'https://www.encanador.santoandre.br', null),
  (gen_random_uuid(), 'Encanador Santo André (24h)', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11986154000', '1142142000', 'contato@encanador24horas.srv.br', 'manual_google', true, 'encanador-santo-andre-24h', 'encanador', 'https://www.encanador24horas.srv.br', null),
  (gen_random_uuid(), 'Encanador Santo André 24 Horas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11982085000', '08002299000', 'contato@encanador.srv.br', 'manual_google', true, 'encanador-santo-andre-24-horas', 'encanador', 'https://www.encanador.srv.br', null),
  (gen_random_uuid(), 'Manutenção Residencial', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11948931000', '1141144004', 'contato@manutencaoresidencial.srv.br', 'manual_google', true, 'manutencao-residencial-santo-andre', 'encanador', 'https://www.manutencaoresidencial.srv.br', null),
  (gen_random_uuid(), 'Hidralex Hidráulica', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11930168478', '11930168478', 'contato@hidralex.com.br', 'manual_google', true, 'hidralex-hidraulica-santo-andre', 'encanador', null, null)
ON CONFLICT (slug) DO NOTHING;
