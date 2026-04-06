-- 38. Insert Electricians (Eletricista) Providers (Ribeirão Pires)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Eletricista Ribeirão Pires', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', '11948931000', '5511948931000', 'contato@eletricista24hs.srv.br', 'manual_google', true, 'eletricista-ribeirao-pires', 'eletricista', 'https://www.eletricista24hs.srv.br', null),
  (gen_random_uuid(), 'Eletricista24hs Ribeirão Pires', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', '11948082000', '11948082000', 'contato@eletricista24hs.adm.br', 'manual_google', true, 'eletricista-24hs-ribeirao-pires', 'eletricista', 'https://www.eletricista24hs.adm.br', null),
  (gen_random_uuid(), 'Eletricista em Ribeirão Pires SP (24h)', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', null, null, 'contato@eletricista24hspertodemim.com.br', 'manual_google', true, 'eletricista-em-ribeirao-pires-sp-24h', 'eletricista', 'https://www.eletricista24hspertodemim.com.br', null),
  (gen_random_uuid(), 'Eletricista Rápido Ribeirão Pires', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ribeirão Pires', 'Ribeirão Pires/SP', null, null, 'contato@eletricistarapido.com', 'manual_google', true, 'eletricista-rapido-ribeirao-pires', 'eletricista', 'https://www.eletricistarapido.com', null)
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;
