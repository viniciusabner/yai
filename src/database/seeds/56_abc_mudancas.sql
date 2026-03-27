-- Seeds para a categoria Mudanças no ABC Paulista

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
(gen_random_uuid(), 'JM Mudanças', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1142593692', 'manual_google', true, 'jm-mudancas-santo-andre'),
(gen_random_uuid(), 'Katedral Transportadora', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11966933564', '11966933564', 'manual_google', true, 'katedral-transportadora-santo-andre'),
(gen_random_uuid(), 'Good Fast Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', '11987130755', '11987130755', 'manual_google', true, 'good-fast-transportes-santo-andre'),
(gen_random_uuid(), 'ELG Mudanças', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Utinga', 'Atendimento Regional', '11951948867', '11951948867', 'manual_google', true, 'elg-mudancas-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Mudança Barata SBC', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11986536550', '11986536550', 'manual_google', true, 'mudanca-barata-sao-bernardo-do-campo'),
(gen_random_uuid(), 'MSilva Mudanças', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '11947625147', '11947625147', 'manual_google', true, 'msilva-mudancas-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Mude Express', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', '11952388892', '11952388892', 'manual_google', true, 'mude-express-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Trans Tut''S Carretos', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Atendimento Regional', '11932881936', '11932881936', 'manual_google', true, 'trans-tuts-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Rapidesh Express', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Atendimento Regional', NULL, '1142354698', 'manual_google', true, 'rapidesh-express-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'MME Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11984150534', '1139024754', 'manual_google', true, 'mme-transportes-sao-caetano-do-sul'),
(gen_random_uuid(), 'Jadlog São Caetano', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Atendimento Regional', '11991168466', '1126293201', 'manual_google', true, 'jadlog-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Canaã Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11980386232', '1126779102', 'manual_google', true, 'canaa-transportes-diadema'),
(gen_random_uuid(), 'Zurcad Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Atendimento Regional', '11933702274', '1129558020', 'manual_google', true, 'zurcad-transportes-diadema'),
(gen_random_uuid(), 'ADJ Transportadora', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11914632638', '11914632638', 'manual_google', true, 'adj-transportadora-diadema'),
(gen_random_uuid(), 'KM Transporte', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Eldorado', 'Atendimento Regional', NULL, '1122076070', 'manual_google', true, 'km-transporte-diadema'),

-- Mauá
(gen_random_uuid(), 'Mudanças Loyola', 'mudancas', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, '1137739892', 'manual_google', true, 'mudancas-loyola-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'MSilva Carretos', 'mudancas', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11953372757', '11953372757', 'manual_google', true, 'msilva-carretos-ribeirao-pires'),
(gen_random_uuid(), 'Mudanças Local RP', 'mudancas', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Ouro Fino Paulista', 'Atendimento Regional', '11930005757', '1142377990', 'manual_google', true, 'mudancas-local-ribeirao-pires')

ON CONFLICT (slug) DO NOTHING;
