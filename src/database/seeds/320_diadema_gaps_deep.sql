-- ========================================
-- Diadema Gaps — Deep Search
-- Gerado em: 2026-04-01
-- Missão: Preencher lacunas de categorias em Diadema
-- ========================================

-- Corrigindo slugs existentes de Auto Elétrica em Diadema primeiro
UPDATE public.providers 
SET category = 'auto_eletrica' 
WHERE category = 'auto-eletrica' AND city_slug = 'diadema';

-- Inserindo novos prestadores em Diadema
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES
  (gen_random_uuid(), 'Ademir Despachante', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Piraporinha', 'Av. Fagundes de Oliveira, 1787', '1140762268', '1140762268', null, 'manual_google', true, 'ademir-despachante-diadema', 'despachante', null, 'diadema', 'SP'),
  (gen_random_uuid(), 'Sete Despachante', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Av. Sete de Setembro, 306', '11947920918', '1140433735', null, 'manual_google', true, 'sete-despachante-diadema', 'despachante', 'http://despachantesonline.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Taboão Despachantes e Seguros', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Taboão', 'Rua Noruega, 103', null, '1140000000', null, 'manual_google', true, 'taboao-despachante-diadema', 'despachante', 'http://taboaodespachante.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Santa Podologia', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Rua das Turmalinas, 34 - Sl 10', '11999552241', '11999552241', null, 'manual_google', true, 'santa-podologia-diadema', 'podologia', 'http://santapodologia.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Bella Feet Podologia', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Rua Manoel da Nóbrega, 735 - Conj 103', null, '1126680870', null, 'manual_google', true, 'bella-feet-podologia-diadema', 'podologia', null, 'diadema', 'SP'),
  (gen_random_uuid(), 'Arini Podologia', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Avenida São José, 54', null, '1128291354', null, 'manual_google', true, 'arini-podologia-diadema', 'podologia', null, 'diadema', 'SP'),
  (gen_random_uuid(), 'HF Música', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Av. Fábio Eduardo Ramos Esquível, 1143', '11952601000', '11952601000', null, 'manual_google', true, 'hf-musica-diadema', 'musica', 'http://hfmusica.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'SEAP - Studio Escola de Arte Paulista', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Rua Santo Antônio, 25', null, '1140000000', null, 'manual_google', true, 'seap-artes-diadema', 'artes', 'http://seap.art.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'SENAI Diadema', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Jardim Canhema', 'Rua Guatemala, 19', null, '1140708950', null, 'manual_google', true, 'senai-diadema', 'informatica', 'https://diadema.sp.senai.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Fatec Diadema - Luigi Papaiz', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Jardim Campanário', 'Av. Luiz Merenda, 443', null, '1140922328', null, 'manual_google', true, 'fatec-diadema', 'informatica', 'http://fatecdiadema.cps.sp.gov.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Recanto da Arte Shows', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Regional', 'Atendimento em Diadema', null, '1132075767', null, 'manual_google', true, 'recanto-da-arte-shows-diadema', 'animacao', 'https://animacaoparafestainfantil.com.br/', 'diadema', 'SP'),
  (gen_random_uuid(), 'Dyn Dyn Eventos', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Regional', 'Atendimento em Diadema', null, '1127744070', null, 'manual_google', true, 'dyn-dyn-eventos-diadema', 'animacao', 'http://dyndyneventos.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'ADL Eventos - Som e Luz', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Regional', 'Atendimento em Diadema', null, null, null, 'manual_google', true, 'adl-eventos-diadema', 'aluguel_equipamentos', 'http://adleventos.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Ishihara Brinquedos', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Regional', 'Atendimento em Diadema', '11976897788', '11976897788', null, 'manual_google', true, 'ishihara-brinquedos-diadema', 'aluguel_equipamentos', null, 'diadema', 'SP'),
  (gen_random_uuid(), 'Isa Locações', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Conceição', 'Rua Moacyr Goulart Cunha Caldas, 75', null, null, null, 'manual_google', true, 'isa-locacoes-diadema', 'aluguel_equipamentos', 'http://isalocacoes.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Espaço Realizando Sonhos', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Rua Corunha, s/n', '11976327548', '11976327548', null, 'manual_google', true, 'espaco-realizando-sonhos-diadema', 'espaco_eventos', 'http://espacorealizandosonhos.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Explosão Festas - Chácara', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Eldorado', 'Estrada Maria Cristina, 361', null, null, null, 'manual_google', true, 'explosao-festas-diadema', 'espaco_eventos', 'http://explosaofestas.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'CIESP Diadema - Auditório', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Vila Mulford', 'Rua Caracas, 73', null, '1140564844', null, 'manual_google', true, 'ciesp-eventos-diadema', 'espaco_eventos', 'http://ciesp.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'One Bartender', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Regional', 'Atendimento em Diadema', '11947572053', '1136850326', null, 'manual_google', true, 'one-bartender-diadema', 'bartender', 'https://www.onebartender.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Agari Drinks', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Regional', 'Atendimento em Diadema', null, null, null, 'manual_google', true, 'agari-drinks-diadema', 'bartender', 'https://www.agaridrinks.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Nossa Lembrança', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Jardim Luso', 'Rua Capitão John Cordeiro e Silva, 70', null, '1156226466', null, 'manual_google', true, 'nossa-lembranca-diadema', 'lembrancinhas', null, 'diadema', 'SP'),
  (gen_random_uuid(), 'WF Sucata Digital', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Serraria', 'Rua Afonso Monteiro da Cruz, 835', '11966728597', '1140574456', null, 'manual_google', true, 'wf-sucata-digital-diadema', 'reciclagem', 'http://wfsucatadigital.com.br', 'diadema', 'SP'),
  (gen_random_uuid(), 'Reciclaeco', (SELECT id FROM public.cities WHERE slug = 'diadema'), 'Centro', 'Rua Salgado de Castro, 220', null, null, null, 'manual_google', true, 'reciclaeco-diadema', 'reciclagem', 'http://reciclaeco.com.br', 'diadema', 'SP')
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;
