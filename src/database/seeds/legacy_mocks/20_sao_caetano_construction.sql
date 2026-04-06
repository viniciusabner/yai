-- 20. Insert Construction and Repairs Providers (São Caetano do Sul)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Pedreiros / Reformas
  (gen_random_uuid(), 'Simplifique Engenharia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'simplifique-engenharia-scs', 'pedreiro', 'https://www.simplifiqueengenharia.com.br', null),
  (gen_random_uuid(), 'Damaceno Engenharia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'damaceno-engenharia-scs', 'pedreiro', null, null),
  (gen_random_uuid(), 'Raformas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'raformas-scs', 'pedreiro', 'https://www.raformas.com.br', null),
  (gen_random_uuid(), 'Construtora Patriani', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'construtora-patriani-scs', 'pedreiro', 'https://www.construtorapatriani.com.br', null),
  (gen_random_uuid(), 'Bunker Construtora', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'bunker-construtora-scs', 'pedreiro', null, null),
  (gen_random_uuid(), 'WRCB Engenharia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'wrcb-engenharia-scs', 'pedreiro', null, null),
  (gen_random_uuid(), 'Casa do Construtor', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua João Pessoa, 288', '5511981202807', '551123764252', null, 'manual_google', true, 'casa-do-construtor-scs', 'pedreiro', 'https://www.casadoconstrutor.com.br', null),

  -- Marido de Aluguel
  (gen_random_uuid(), 'Amigo do Síndico', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'amigo-do-sindico-scs', 'marido_aluguel', null, null),
  (gen_random_uuid(), 'Doutor Resolve', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'doutor-resolve-scs', 'marido_aluguel', 'https://www.doutorresolve.com.br', null),
  (gen_random_uuid(), 'Master House Manutenção', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', null, null, null, 'manual_google', true, 'master-house-manutencao-scs', 'marido_aluguel', 'https://www.masterhousesolucoes.com.br', null)
ON CONFLICT (slug) DO NOTHING;
