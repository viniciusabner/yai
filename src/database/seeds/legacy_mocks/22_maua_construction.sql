-- 22. Insert Construction and Repairs Providers (Mauá)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Pedreiros / Reformas
  (gen_random_uuid(), 'Gilvan Gil - Pedreiros', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '5511958066272', '5511958066272', null, 'manual_google', true, 'gilvan-gil-pedreiros-maua', 'pedreiro', 'https://www.gg4.com.br', null),
  (gen_random_uuid(), 'Reforma Art', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '5511974454458', '5511974454458', null, 'manual_google', true, 'reforma-art-maua', 'pedreiro', 'https://www.ueniweb.com', null),
  (gen_random_uuid(), 'GOC Construtora', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, '01141125560', null, 'manual_google', true, 'goc-construtora-maua', 'pedreiro', 'https://www.gocconstrutora.com.br', null),
  (gen_random_uuid(), 'Souzasimtecc', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Viela do Colégio, 16', null, '551145473380', null, 'manual_google', true, 'souzasimtecc-maua', 'pedreiro', 'https://www.souzasimtecc.com.br', null),
  (gen_random_uuid(), 'Construtora Joninho', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Pilar', 'R. Aquidabam, 277', null, '551145554338', null, 'manual_google', true, 'construtora-joninho-maua', 'pedreiro', null, null),
  (gen_random_uuid(), 'ECCO BRAZ', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'R. Avaré, 127', null, '551135658194', null, 'manual_google', true, 'ecco-braz-maua', 'pedreiro', null, null),
  (gen_random_uuid(), 'Kevin & Karina Construtora', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Manoel Pedro Júnior, 323', null, '1145418007', null, 'manual_google', true, 'kevin-karina-construtora-maua', 'pedreiro', 'https://www.kevinkarinaconstrutora.com.br', null),
  (gen_random_uuid(), 'Lopes Neves Construtora', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque São Vicente', 'R. Pedro de Tolêdo, 297', null, null, 'contato@lopesneves.com.br', 'manual_google', true, 'lopes-neves-construtora-maua', 'pedreiro', 'https://www.lopesneves.com.br', null),
  (gen_random_uuid(), 'Empreiteira Cupertino', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Mauá/SP', null, null, null, 'manual_google', true, 'empreiteira-cupertino-maua', 'pedreiro', null, null),

  -- Marido de Aluguel
  (gen_random_uuid(), 'Marido de Aluguel Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11948931000', '1141144004', null, 'manual_google', true, 'marido-de-aluguel-maua', 'marido_aluguel', 'https://www.maridodealuguel.adm.br', null),
  (gen_random_uuid(), 'Master House Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, '1123259220', null, 'manual_google', true, 'master-house-maua', 'marido_aluguel', 'https://www.masterhousesolucoes.com.br', null),
  (gen_random_uuid(), 'Doutor Resolve', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, null, 'manual_google', true, 'doutor-resolve-maua', 'marido_aluguel', 'https://www.doutorresolve.com.br', null)
ON CONFLICT (slug) DO NOTHING;
