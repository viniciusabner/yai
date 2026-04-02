-- ========================================
-- Diadema Missing Categories - Real Data
-- Gerado em: 2026-04-02
-- Origem: Pesquisa profunda manual_google
-- ========================================

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, 
  whatsapp, phone, email, source, active, created_at, slug, 
  category, website, city_slug, state, creci
)
VALUES
  (gen_random_uuid(), 'Recondisa Diadema Auto Elétrico', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Rua João Theodoro Genesi, 106', '11993486126', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'recondisa-auto-eletrico-diadema', 'auto_eletrica', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Auto Elétrico Santa Elizabeth', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Vila Nogueira', 'Rua Dr. Manoel de Abreu, 198', null, '1140677521', null, 'manual_google', true, '2026-04-02T12:00:00', 'auto-eletrico-santa-elizabeth-diadema', 'auto_eletrica', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Dimi Car - Mecânica e Auto Elétrica', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Eldorado', 'Av. Alda, 450', '11982228529', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'dimi-car-mecanica-diadema', 'auto_eletrica', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Sete Despachante', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Av. Sete de Setembro, 306', '11947920918', '1140511101', null, 'manual_google', true, '2026-04-02T12:00:00', 'sete-despachante-diadema', 'despachante', 'http://setedespachante.com.br', 'diadema', 'SP', null),
  (gen_random_uuid(), 'Borges Despachante', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Taboão', 'Rua Santa Lúcia, 63', '11947189546', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'borges-despachante-diadema', 'despachante', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Santa Podologia', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Rua Orense, 41, sala 110', '11999552241', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'santa-podologia-diadema', 'podologia', 'https://santapodologia.com.br', 'diadema', 'SP', null),
  (gen_random_uuid(), 'Clinic Pé', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Praça Presidente Castelo Branco, 43, sala 04', null, '1140566231', null, 'manual_google', true, '2026-04-02T12:00:00', 'clinic-pe-diadema', 'podologia', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Mais Pés Podologia', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Taboão', 'Rua dos Pessegueiros, 465', null, '1140721836', null, 'manual_google', true, '2026-04-02T12:00:00', 'mais-pes-podologia-diadema', 'podologia', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Podologia Ury Pé', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Av. Vereador Juarez Rios de Vasconcelos, 116', null, '1140553816', null, 'manual_google', true, '2026-04-02T12:00:00', 'podologia-ury-pe-diadema', 'podologia', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Arini Podologia', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Av. São José, 54', null, '1128291354', null, 'manual_google', true, '2026-04-02T12:00:00', 'arini-podologia-diadema', 'podologia', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'CED - Centro Educacional de Diadema', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Av. Conceição, 714', null, '1126779747', null, 'manual_google', true, '2026-04-02T12:00:00', 'ced-reforco-escolar-diadema', 'reforco_escolar', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Reforço Escolar - Múltipla Escolha', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Av. Alda, 1149', null, '1123118375', null, 'manual_google', true, '2026-04-02T12:00:00', 'reforco-escolar-multipla-escolha-diadema', 'reforco_escolar', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Reforço Escolar Eldorado', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Eldorado', 'R. Prof. Rubens Oscar Guelli, 199', '11983061607', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'reforco-escolar-eldorado-diadema', 'reforco_escolar', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Casa da Música', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Avenida Alda, 255', null, '1140729302', null, 'manual_google', true, '2026-04-02T12:00:00', 'casa-da-musica-diadema', 'musica', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'HF Música', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Av. Fábio Eduardo Ramos Esquível, 1143', '11952601000', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'hf-musica-diadema', 'musica', 'https://hfmusica.com.br', 'diadema', 'SP', null),
  (gen_random_uuid(), 'Livre Música', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Rua Antônio Doll de Moraes, 118', '11916911100', null, 'contato@livremusica.com', 'manual_google', true, '2026-04-02T12:00:00', 'livre-musica-diadema', 'musica', 'https://livremusica.com', 'diadema', 'SP', null),
  (gen_random_uuid(), 'Escola de Música Geração Harmonia', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Vila Nogueira', 'Rua Antônio Dias Adorno, 543', null, '1128012834', null, 'manual_google', true, '2026-04-02T12:00:00', 'escola-de-musica-geracao-harmonia-diadema', 'musica', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Dinâmica Musical', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Rua Limeiras, 236', null, '1140762852', null, 'manual_google', true, '2026-04-02T12:00:00', 'dinamica-musical-diadema', 'musica', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Microlins Diadema', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Avenida Fabio Eduardo Ramos Esquivel, 139', null, '1143080200', null, 'manual_google', true, '2026-04-02T12:00:00', 'microlins-diadema', 'informatica', 'https://www.microlins.com.br', 'diadema', 'SP', null),
  (gen_random_uuid(), 'Seap - Studio Escola de Arte Paulista', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Rua Santo Antônio, 25', null, '1140554191', 'seap.escoladearte@gmail.com', 'manual_google', true, '2026-04-02T12:00:00', 'seap-escola-de-arte-diadema', 'artes', 'https://seap.art.br', 'diadema', 'SP', null),
  (gen_random_uuid(), 'Angels Recreação Infantil', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Av. Sen. Vitorino Freire, 515', null, '1140447888', null, 'manual_google', true, '2026-04-02T12:00:00', 'angels-recreacao-infantil-diadema', 'animacao', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Animação de Festas e Recreação Mundo Mágico', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Centro', 'Tv. Serra das Estrelas, 54', '11943068508', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'animacao-mundo-magico-diadema', 'animacao', null, 'diadema', 'SP', null),
  (gen_random_uuid(), 'Salão de Festa Diadema', null, (SELECT id FROM public.cities WHERE slug = 'diadema'), null, 'Eldorado', 'Rua João Antônio de Araújo, 395', '11976230314', null, null, 'manual_google', true, '2026-04-02T12:00:00', 'salao-de-festa-diadema', 'espaco_eventos', 'https://salao-de-festa-diadema.negocio.site/', 'diadema', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;
