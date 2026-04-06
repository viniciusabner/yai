-- 23. Insert Construction and Repairs Providers (Ribeirão Pires)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Pedreiros / Reformas
  (gen_random_uuid(), 'Obra Nobre Construtora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Palmar, 114', null, '1148253300', null, 'manual_google', true, 'obra-nobre-construtora-ribeirao-pires', 'pedreiro', 'https://www.obranobre.com.br', null),
  (gen_random_uuid(), 'Construtora Leoma', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro Alto', 'Av. Santo André, 980', null, '1148281580', null, 'manual_google', true, 'construtora-leoma-ribeirao-pires', 'pedreiro', 'https://www.construtoraleoma.com.br', null),
  (gen_random_uuid(), 'BRN Construtora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', '19990005000', '08009242000', null, 'manual_google', true, 'brn-construtora-ribeirao-pires', 'pedreiro', 'https://www.brn.com.br', null),
  (gen_random_uuid(), 'Construtora Interpav', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', null, '1148258235', null, 'manual_google', true, 'construtora-interpav-ribeirao-pires', 'pedreiro', null, null),
  (gen_random_uuid(), 'Construtora Pantanal', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', null, '1148221058', null, 'manual_google', true, 'construtora-pantanal-ribeirao-pires', 'pedreiro', null, null),
  (gen_random_uuid(), 'Formatual Sistema Construtivo', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', null, '1148235138', null, 'manual_google', true, 'formatual-sistema-construtivo-ribeirao-pires', 'pedreiro', null, null),
  (gen_random_uuid(), 'Construtora Guilherme Figueiredo', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', null, '1148257646', null, 'manual_google', true, 'construtora-guilherme-figueiredo-ribeirao-pires', 'pedreiro', null, null),
  (gen_random_uuid(), 'Construtor Civil', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', null, '1148244953', null, 'manual_google', true, 'construtor-civil-ribeirao-pires', 'pedreiro', null, null),
  (gen_random_uuid(), 'Jesse Reformas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Rua Tupiniquins, 11', null, '1148223333', null, 'manual_google', true, 'jesse-reformas-ribeirao-pires', 'pedreiro', null, null),

  -- Marido de Aluguel / Eletricista
  (gen_random_uuid(), 'Marido de Aluguel Ribeirão', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', '11948931000', '1141144004', null, 'manual_google', true, 'marido-de-aluguel-ribeirao-pires', 'marido_aluguel', 'https://www.maridodealuguel24hs.srv.br', null),
  (gen_random_uuid(), 'JK Marido de Aluguel', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', '11988794041', '11988794041', null, 'manual_google', true, 'jk-marido-de-aluguel-ribeirao-pires', 'marido_aluguel', 'https://www.guiaribeiraopires.com.br', null),
  (gen_random_uuid(), 'Eletricista Bispo', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Ema Mortari, 09 A', null, '1148282598', null, 'manual_google', true, 'eletricista-bispo-ribeirao-pires', 'eletricista', null, null)
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;
