-- 91. Insert Gardener (Jardineiro) Providers (São Caetano do Sul)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'Dular Jardinagem', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'São Caetano do Sul - SP', null, null, null, 'manual_google', true, 'dular-jardinagem-sao-caetano', 'jardineiro', 'https://dularjardinagem.com.br', null),
  (gen_random_uuid(), 'Floresta de Quintal', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'R. Joaquim Nabuco, 50', null, null, null, 'manual_google', true, 'floresta-de-quintal-sao-caetano', 'jardineiro', 'https://florestadequintal.com.br', null),
  (gen_random_uuid(), 'Tudo Verde Paisagismo', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'São Caetano do Sul - SP', null, null, null, 'manual_google', true, 'tudo-verde-paisagismo-sao-caetano', 'jardineiro', 'https://proverdepaisagismo.com.br', null),
  (gen_random_uuid(), 'Master House Jardineiro', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'São Caetano do Sul - SP', null, null, null, 'manual_google', true, 'master-house-jardineiro-sao-caetano', 'jardineiro', 'https://masterhousesolucoes.com.br', null),
  (gen_random_uuid(), 'Garden São Caetano', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Oswaldo Cruz, 0', null, null, null, 'manual_google', true, 'garden-sao-caetano-sao-caetano', 'jardineiro', 'https://gardensaocaetano.com.br', null),
  (gen_random_uuid(), 'Esquina do Verde', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Oswaldo Cruz, 0', null, null, null, 'manual_google', true, 'esquina-do-verde-sao-caetano', 'jardineiro', 'https://esquinadoverde.com.br', null),
  (gen_random_uuid(), 'Grupo Brasanitas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'São Caetano do Sul - SP', null, '1128795922', null, 'manual_google', true, 'grupo-brasanitas-sao-caetano', 'jardineiro', 'https://grupobrasanitas.com.br', null),
  (gen_random_uuid(), 'Grupo Opção', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'São Caetano do Sul - SP', null, null, null, 'manual_google', true, 'grupo-opcao-sao-caetano', 'jardineiro', 'https://grupoopcao.com.br', null),
  (gen_random_uuid(), 'Mary Help Jardineiro', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'São Caetano do Sul - SP', null, null, null, 'manual_google', true, 'mary-help-jardineiro-sao-caetano', 'jardineiro', 'https://maryhelp.com.br', null)
ON CONFLICT (slug) DO NOTHING;
