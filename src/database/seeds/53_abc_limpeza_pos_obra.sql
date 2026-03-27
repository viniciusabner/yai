-- Seeds para a categoria Limpeza Pós Obra e Faxina Profissional no ABC Paulista

INSERT INTO public.providers (
    id,
    name,
    category,
    city_id,
    neighborhood,
    address,
    whatsapp,
    phone,
    source,
    active,
    slug
) VALUES 
-- Santo André
(gen_random_uuid(), 'Asafe Higienização Pós-Obra', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11988310643', '11988310643', 'manual_google', true, 'asafe-higienizacao-santo-andre'),
(gen_random_uuid(), 'Consulimp Cleaning Services', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11965925556', '1131018717', 'manual_google', true, 'consulimp-santo-andre'),
(gen_random_uuid(), 'House Shine Limpeza', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '11961701831', '11961701831', 'manual_google', true, 'house-shine-santo-andre'),
(gen_random_uuid(), 'Atmosfera Limpeza Profissional', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'atmosfera-limpeza-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Lava Imper Serviços', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11977380546', '11977380546', 'manual_google', true, 'lava-imper-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Grenda Service', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '11961497588', '1152423295', 'manual_google', true, 'grenda-service-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Practice Clean SBC', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', '11976172661', '1144793587', 'manual_google', true, 'practice-clean-sao-bernardo-do-campo'),
(gen_random_uuid(), 'TUR Reformas e Limpeza', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim São Bernardo', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'tur-reformas-limpeza-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Grupo FLS Serviços', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '1144722990', '1144722990', 'manual_google', true, 'grupo-fls-sao-caetano-do-sul'),
(gen_random_uuid(), 'Spartaco Terceirizações', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'spartaco-terceirizacoes-sao-caetano-do-sul'),
(gen_random_uuid(), 'Leni Limpeza Pós Obra', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Espaço Cerâmica', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'leni-limpeza-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Reallimp Diadema', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'reallimp-diadema'),
(gen_random_uuid(), 'Volpi Serviços de Limpeza', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'volpi-servicos-diadema'),
(gen_random_uuid(), 'MP Facilities', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11975950505', '11975950505', 'manual_google', true, 'mp-facilities-diadema'),

-- Mauá
(gen_random_uuid(), 'Limpeza Inteligente Pós Obra', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11988310643', '11988310643', 'manual_google', true, 'limpeza-inteligente-maua'),
(gen_random_uuid(), 'Codlimp Serviços Especializados', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'codlimp-servicos-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'A5WEB Alimpadora', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '17981002981', '17981002981', 'manual_google', true, 'a5web-alimpadora-ribeirao-pires'),
(gen_random_uuid(), 'Novaclean Pisos e Limpeza', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ouro Fino Paulista', 'Atendimento Regional', '11933829119', '1147700881', 'manual_google', true, 'novaclean-ribeirao-pires'),
(gen_random_uuid(), 'Oliver Serviços Terceirizados', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'oliver-servicos-ribeirao-pires')

ON CONFLICT (slug) DO NOTHING;
