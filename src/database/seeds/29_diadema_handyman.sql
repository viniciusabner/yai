-- 29. Insert Handyman (Marido de Aluguel) Providers (Diadema)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Guima Service', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11916780108', '11916780108', 'contato@guimaservice.com.br', 'manual_google', true, 'guima-service-diadema', 'marido_aluguel', 'https://www.dfgmaridodealuguel.com.br', null),
  (gen_random_uuid(), 'Serviços 24 horas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11986154000', '11986154000', 'contato@servico24horas.com.br', 'manual_google', true, 'servicos-24-horas-diadema', 'marido_aluguel', 'https://www.servico24horas.com.br', null),
  (gen_random_uuid(), 'Marido de Aluguel Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11948931000', '1141144004', 'contato@maridodealuguel.adm.br', 'manual_google', true, 'marido-de-aluguel-diadema', 'marido_aluguel', 'https://www.maridodealuguel.adm.br', null),
  (gen_random_uuid(), 'Doutor Resolve', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', null, null, 'contato@doutorresolve.com.br', 'manual_google', true, 'doutor-resolve-diadema', 'marido_aluguel', 'https://www.doutorresolve.com.br', null),
  (gen_random_uuid(), 'Mix House ABC', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', null, null, 'contato@doctorhouseabc.com.br', 'manual_google', true, 'mix-house-abc-diadema', 'marido_aluguel', 'https://www.doctorhouseabc.com.br', null),
  (gen_random_uuid(), 'Cronoshare - Maridos de Aluguel', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', null, null, 'contato@cronoshare.com.br', 'manual_google', true, 'cronoshare-maridos-de-aluguel-diadema', 'marido_aluguel', 'https://www.cronoshare.com.br', null),
  (gen_random_uuid(), 'Eletricista 24hs Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', null, null, 'contato@eletricista24hs.srv.br', 'manual_google', true, 'eletricista-24hs-diadema', 'eletricista', 'https://www.eletricista24hs.srv.br', null)
ON CONFLICT (slug) DO NOTHING;
