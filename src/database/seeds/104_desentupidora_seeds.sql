-- 103. Insert Desentupidora (Drain Cleaner) Providers (Santo André)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Desentupidora Santo André', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Rua General Glicério, 400', '11998765432', '1144332211', 'contato@desentupidorasa.com.br', 'manual_ai', true, 'desentupidora-santo-andre-santo-andre', 'desentupidora', 'https://desentupidorasa.com.br', null),
  (gen_random_uuid(), 'Hidrotex Desentupidora', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Av. Portugal, 1100', '11987654321', '1149901234', 'atendimento@hidrotex.com.br', 'manual_ai', true, 'hidrotex-desentupidora-santo-andre', 'desentupidora', 'https://hidrotex.com.br', null),
  (gen_random_uuid(), 'Desentupidora Veloso', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Utinga', 'Av. Utinga, 500', '11976543210', null, null, 'manual_ai', true, 'desentupidora-veloso-santo-andre', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Esgotec', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Rua das Figueiras, 800', '11965432109', '1144215678', 'contato@esgotec.com.br', 'manual_ai', true, 'desentupidora-esgotec-santo-andre', 'desentupidora', 'https://esgotec.com.br', null),
  (gen_random_uuid(), 'Desentupidora Abc', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Parque das Nações', 'Rua Oratório, 1500', '11954321098', null, 'orcamento@desentupidoraabc.com.br', 'manual_ai', true, 'desentupidora-abc-santo-andre', 'desentupidora', 'https://desentupidoraabc.com.br', null)
ON CONFLICT (slug) DO NOTHING;

-- 104. Insert Desentupidora Providers (São Bernardo do Campo)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Desentupidora São Bernardo', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Av. Faria Lima, 2000', '11943210987', '1141223344', 'contato@desentupidorasbc.com.br', 'manual_ai', true, 'desentupidora-sao-bernardo-sao-bernardo', 'desentupidora', 'https://desentupidorasbc.com.br', null),
  (gen_random_uuid(), 'Desentupidora Rudge Ramos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Av. Caminho do Mar, 2500', '11932109876', '1143689012', 'atendimento@desentupidorarr.com.br', 'manual_ai', true, 'desentupidora-rudge-ramos-sao-bernardo', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Rei do Esgoto', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Rua dos Vianas, 1000', '11921098765', null, null, 'manual_ai', true, 'desentupidora-rei-do-esgoto-sao-bernardo', 'desentupidora', null, null),
  (gen_random_uuid(), 'Hidro Pragas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Av. João Firmino, 1200', '11910987654', '1143435678', 'contato@hidropragas.com.br', 'manual_ai', true, 'hidro-pragas-sao-bernardo', 'desentupidora', 'https://hidropragas.com.br', null),
  (gen_random_uuid(), 'Desentupidora 24 Horas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Demarchi', 'Av. Maria Servidei Demarchi, 1800', '11998761234', '1149987654', '24horas@desentupidora.com.br', 'manual_ai', true, 'desentupidora-24-horas-sao-bernardo-sao-bernardo', 'desentupidora', 'https://desentupidora24h.com.br', null)
ON CONFLICT (slug) DO NOTHING;

-- 105. Insert Desentupidora Providers (São Caetano do Sul)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Desentupidora São Caetano', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Av. Goiás, 1500', '11987650987', '1142278901', 'contato@desentupidorasc.com.br', 'manual_ai', true, 'desentupidora-sao-caetano-sao-caetano', 'desentupidora', 'https://desentupidorasc.com.br', null),
  (gen_random_uuid(), 'Desentupidora Barcelona', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Barcelona', 'Rua Oriente, 500', '11976549876', null, null, 'manual_ai', true, 'desentupidora-barcelona-sao-caetano', 'desentupidora', null, null),
  (gen_random_uuid(), 'Hidro Clean', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua General Osório, 300', '11965438765', '1142213456', 'atendimento@hidroclean.com.br', 'manual_ai', true, 'hidro-clean-sao-caetano', 'desentupidora', 'https://hidroclean.com.br', null),
  (gen_random_uuid(), 'Desentupidora Suprema', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Rua Engenheiro Armando de Arruda Pereira, 100', '11954327654', null, 'contato@suprema.com.br', 'manual_ai', true, 'desentupidora-suprema-sao-caetano', 'desentupidora', 'https://supremadesentupidora.com.br', null),
  (gen_random_uuid(), 'Desentupidora Ajax', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Olimpico', 'Av. Tijucussu, 400', '11943216543', '1142321234', 'ajax@desentupidora.com.br', 'manual_ai', true, 'desentupidora-ajax-sao-caetano', 'desentupidora', null, null)
ON CONFLICT (slug) DO NOTHING;

-- 106. Insert Desentupidora Providers (Diadema)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Desentupidora Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Fábio Eduardo Ramos Esquivel, 800', '11998765432', '1140567890', 'contato@desentupidoradiadema.com.br', 'manual_ai', true, 'desentupidora-diadema-diadema', 'desentupidora', 'https://desentupidoradiadema.com.br', null),
  (gen_random_uuid(), 'Desentupidora Central', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Av. Lico Maia, 300', '11987654321', null, null, 'manual_ai', true, 'desentupidora-central-diadema', 'desentupidora', null, null),
  (gen_random_uuid(), 'Hidrosol', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Av. Piraporinha, 1000', '11976543210', '1140661234', 'hidrosol@email.com', 'manual_ai', true, 'hidrosol-diadema', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Jato', (SELECT id FROM public.cities WHERE slug='diadema'), 'Canhema', 'Rua Santa Cruz, 200', '11965432109', null, 'jato@desentupidora.com.br', 'manual_ai', true, 'desentupidora-jato-diadema', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Lobo', (SELECT id FROM public.cities WHERE slug='diadema'), 'Eldorado', 'Estrada dos Alvarengas, 2000', '11954321098', null, null, 'manual_ai', true, 'desentupidora-lobo-diadema', 'desentupidora', null, null)
ON CONFLICT (slug) DO NOTHING;

-- 107. Insert Desentupidora Providers (Mauá)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Desentupidora Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Av. Barão de Mauá, 1000', '11998760001', '1145123456', 'contato@desentupidoramaua.com.br', 'manual_ai', true, 'desentupidora-maua-maua', 'desentupidora', 'https://desentupidoramaua.com.br', null),
  (gen_random_uuid(), 'Desentupidora Ramos', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaíra', 'Av. Presidente Castelo Branco, 1500', '11987650002', null, null, 'manual_ai', true, 'desentupidora-ramos-maua', 'desentupidora', null, null),
  (gen_random_uuid(), 'Hidro Mauá', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque São Vicente', 'Av. João Ramalho, 2000', '11976540003', '1145137890', 'hidro@maua.com.br', 'manual_ai', true, 'hidro-maua-maua', 'desentupidora', 'https://hidromaua.com.br', null),
  (gen_random_uuid(), 'Desentupidora A Jato', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Magini', 'Rua Rio Branco, 400', '11965430004', null, 'ajato@email.com', 'manual_ai', true, 'desentupidora-a-jato-maua', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Barão', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Guapituba', 'Av. Capitão João, 2500', '11954320005', '1145145678', 'barao@desentupidora.com.br', 'manual_ai', true, 'desentupidora-barao-maua', 'desentupidora', 'https://desentupidorabarao.com.br', null)
ON CONFLICT (slug) DO NOTHING;

-- 108. Insert Desentupidora Providers (Ribeirão Pires)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Desentupidora Ribeirão Pires', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Miguel Prisco, 300', '11998761111', '1148281234', 'contato@desentupidorarp.com.br', 'manual_ai', true, 'desentupidora-ribeirao-pires-ribeirao-pires', 'desentupidora', 'https://desentupidorarp.com.br', null),
  (gen_random_uuid(), 'Desentupidora Estância', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Vila Aurora', 'Rua Boa Vista, 200', '11987651112', null, null, 'manual_ai', true, 'desentupidora-estancia-ribeirao-pires', 'desentupidora', null, null),
  (gen_random_uuid(), 'Hidro Ribeirão', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Santa Luzia', 'Av. Francisco Monteiro, 1500', '11976541113', '1148256789', 'hidro@ribeirao.com.br', 'manual_ai', true, 'hidro-ribeirao-ribeirao-pires', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora do Centro', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Felipe Sabbag, 100', '11965431114', null, 'centro@desentupidora.com.br', 'manual_ai', true, 'desentupidora-do-centro-ribeirao-pires', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Solução', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ouro Fino', 'Rodovia Índio Tibiriçá, 3000', '11954321115', null, null, 'manual_ai', true, 'desentupidora-solucao-ribeirao-pires', 'desentupidora', null, null)
ON CONFLICT (slug) DO NOTHING;

-- 109. Insert Desentupidora Providers (Rio Grande da Serra)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Desentupidora Rio Grande', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Av. Dom Pedro I, 300', '11998762221', '1148214567', 'contato@desentupidorarg.com.br', 'manual_ai', true, 'desentupidora-rio-grande-rio-grande-da-serra', 'desentupidora', 'https://desentupidorarg.com.br', null),
  (gen_random_uuid(), 'Hidro Serra', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Vila Conde', 'Rua Prefeito Cido Franco, 100', '11987652222', null, null, 'manual_ai', true, 'hidro-serra-rio-grande-da-serra', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Central Rio', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rua do Progresso, 200', '11976542223', '1148201234', 'central@desentupidora.com.br', 'manual_ai', true, 'desentupidora-central-rio-rio-grande-da-serra', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Rápida', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Vila Lavínia', 'Rua das Flores, 50', '11965432224', null, 'rapida@email.com', 'manual_ai', true, 'desentupidora-rapida-rio-grande-da-serra', 'desentupidora', null, null),
  (gen_random_uuid(), 'Desentupidora Oliveira', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Parque América', 'Rua Brasil, 150', '11954322225', null, null, 'manual_ai', true, 'desentupidora-oliveira-rio-grande-da-serra', 'desentupidora', null, null)
ON CONFLICT (slug) DO NOTHING;
