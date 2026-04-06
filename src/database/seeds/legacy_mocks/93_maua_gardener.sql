-- 93. Insert Gardener (Jardineiro) Providers (Mauá)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'CS Jardinagem e Limpeza', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, '11970353629', 'csjardimepiscina@gmail.com', 'manual_google', true, 'cs-jardinagem-limpeza-maua', 'jardineiro', 'https://csjardinagem.wixsite.com', null),
  (gen_random_uuid(), 'Flora Viwa Paisagismo', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'flora-viwa-paisagismo-maua', 'jardineiro', null, null),
  (gen_random_uuid(), 'Marido de Aluguel Jardinagem', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'Mauá - SP', null, null, null, 'manual_google', true, 'marido-de-aluguel-jardinagem-maua', 'jardineiro', 'https://maridodealuguel.com.br', null),
  (gen_random_uuid(), 'Gaja Garden', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'gaja-garden-maua', 'jardineiro', 'https://gajagarden.com.br', null),
  (gen_random_uuid(), 'Floricultura da Clarice', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Mauá', 'Av. Barão de Mauá, 2720', null, null, null, 'manual_google', true, 'floricultura-da-clarice-maua', 'jardineiro', 'https://clariceflores.com.br', null),
  (gen_random_uuid(), 'ABC Garden Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'abc-garden-maua-maua', 'jardineiro', 'https://abcgarden.com.br', null),
  (gen_random_uuid(), 'Master House Jardineiro', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'master-house-jardineiro-maua', 'jardineiro', 'https://masterhousesolucoes.com.br', null)
ON CONFLICT (slug) DO NOTHING;
