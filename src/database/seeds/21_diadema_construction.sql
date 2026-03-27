-- 21. Insert Construction and Repairs Providers (Diadema)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Pedreiros / Reformas
  (gen_random_uuid(), 'C&S Construtora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Orense, 41', null, '551141750136', null, 'manual_google', true, 'cs-construtora-diadema', 'pedreiro', 'https://www.construtorasembrasil.com', null),
  (gen_random_uuid(), 'Barra Empreendimentos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Joaninha', 'R. Rio Nilo Reis, 10', '5511932050367', '5511932050367', null, 'manual_google', true, 'barra-empreendimentos-diadema', 'pedreiro', 'https://www.barraempreendimentos.com.br', null),
  (gen_random_uuid(), 'AR Construtoras', (SELECT id FROM public.cities WHERE slug='diadema'), 'Conceição', 'R. Monte Pascoal, 100', '5511982543324', '5511982543324', null, 'manual_google', true, 'ar-construtoras-diadema', 'pedreiro', null, null),
  (gen_random_uuid(), 'Dumont Engenharia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Bandeirantes', 'R. Renato Barbosa, 166', null, '551140532950', null, 'manual_google', true, 'dumont-engenharia-diadema', 'pedreiro', null, null),
  (gen_random_uuid(), 'QUALIENG Engenharia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Elida', 'Av. Conceição, 665', null, '551140536500', null, 'manual_google', true, 'qualieng-engenharia-diadema', 'pedreiro', null, null),
  (gen_random_uuid(), 'Vivere Locan', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Antônio Piranga, 432', '5511939629004', '5511939629004', null, 'manual_google', true, 'vivere-locan-diadema', 'pedreiro', null, null),
  (gen_random_uuid(), 'SSJ Construtora', (SELECT id FROM public.cities WHERE slug='diadema'), 'Campanário', 'Av. Brasília, 312', null, '551127587261', null, 'manual_google', true, 'ssj-construtora-diadema', 'pedreiro', null, null),
  (gen_random_uuid(), 'Souen Nahas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Casa Grande', 'Av. Fundibem, 935', null, '551140677151', null, 'manual_google', true, 'souen-nahas-diadema', 'pedreiro', null, null),
  (gen_random_uuid(), 'Alpha Betta Engenharia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', null, null, null, 'manual_google', true, 'alpha-betta-engenharia-diadema', 'pedreiro', null, null),

  -- Marido de Aluguel
  (gen_random_uuid(), 'Guima Service', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11916780108', '11916780108', null, 'manual_google', true, 'guima-service-diadema', 'marido_aluguel', 'https://www.dfgmaridodealuguel.com.br', null)
ON CONFLICT (slug) DO NOTHING;
