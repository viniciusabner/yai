-- 100. Insert Pest Control (Dedetizadora) Providers (Mauá)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'Irmãos Ferreira Dedetização', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua dos Bandeirantes, 813 - C', null, '1145144300', null, 'manual_google', true, 'irmaos-ferreira-dedetizacao-maua', 'dedetizadora', null, null),
  (gen_random_uuid(), 'Dedetizadora Tserv', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Itapark Velho', 'Avenida Itapark, 3467', null, '1145410768', null, 'manual_google', true, 'dedetizadora-tserv-maua', 'dedetizadora', null, null),
  (gen_random_uuid(), 'Desin Max', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Pedroso', 'Avenida Queiroz Pedroso, 245', null, '1127055565', null, 'manual_google', true, 'desin-max-maua', 'dedetizadora', null, null),
  (gen_random_uuid(), 'EccoClean Dedetizadora', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, '1125285550', null, 'manual_google', true, 'eccoclean-dedetizadora-maua', 'dedetizadora', 'https://eccocleandedetizacao.com.br', null),
  (gen_random_uuid(), 'Protec Pragas', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', '11940103334', null, null, 'manual_google', true, 'protec-pragas-maua', 'dedetizadora', 'https://protecpragas.com.br', null),
  (gen_random_uuid(), 'Combate Ambiental', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', '08000044000', null, null, 'manual_google', true, 'combate-ambiental-maua', 'dedetizadora', 'https://combateambiental.com', null),
  (gen_random_uuid(), 'Dedetizadora Lava Imper', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, '11977380546', null, 'manual_google', true, 'dedetizadora-lava-imper-maua', 'dedetizadora', 'https://dedetizadorbrasil.com.br', null),
  (gen_random_uuid(), 'Dedetizadora DD Pilar', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', '11943710171', null, null, 'manual_google', true, 'dedetizadora-dd-pilar-maua', 'dedetizadora', 'https://dedetizadoraddpilar.com.br', null),
  (gen_random_uuid(), 'Tchau Praga Dedetizadora', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'tchau-praga-dedetizadora-maua', 'dedetizadora', 'https://tchaupraga.com.br', null),
  (gen_random_uuid(), 'Primos Dedetizadora', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'primos-dedetizadora-maua', 'dedetizadora', 'https://primosdedetizadora.com.br', null),
  (gen_random_uuid(), 'Lunar Dedetizadora', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'lunar-dedetizadora-maua', 'dedetizadora', 'https://lunardedetizadora.com.br', null),
  (gen_random_uuid(), 'Leão de Judá Dedetização', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'leao-de-juda-dedetizacao-maua', 'dedetizadora', null, null),
  (gen_random_uuid(), 'Dedetize Dedetização', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'dedetize-dedetizacao-maua', 'dedetizadora', null, null),
  (gen_random_uuid(), 'Zet-Tec Dedetizadora', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Mauá - SP', null, null, null, 'manual_google', true, 'zet-tec-dedetizadora-maua', 'dedetizadora', 'https://zet-tecdedetizadora.com.br', null)
ON CONFLICT (slug) DO NOTHING;
