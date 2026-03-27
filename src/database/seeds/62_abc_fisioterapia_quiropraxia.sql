-- Seeds para a categoria Fisioterapia e Quiropraxia no ABC Paulista

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
(gen_random_uuid(), 'Touchcare Quiropraxia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Homero Thon', 'Rua Giovanni Battista Pirelli, 271', NULL, '11983020000', 'manual_google', true, 'touchcare-quiropraxia-santo-andre'),
(gen_random_uuid(), 'Clínica Sphera', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-sphera-santo-andre'),
(gen_random_uuid(), 'Clínica Fênix Ortopedia e Fisioterapia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '11999999999', 'manual_google', true, 'clinica-fenix-santo-andre'),
(gen_random_uuid(), 'Clínica BIOMED', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Av. Padre Manuel da Nóbrega, 122', NULL, '1145140800', 'manual_google', true, 'clinica-biomed-santo-andre'),
(gen_random_uuid(), 'Clínica Suport', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Av. Padre Manuel da Nóbrega, 266', '11989872135', '1149900265', 'manual_google', true, 'clinica-suport-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'ITC Vertebral', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Índico, 345', '11914279594', '11914279594', 'manual_google', true, 'itc-vertebral-sbc'),
(gen_random_uuid(), 'Ortopedia e Traumatologia Apoio', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Av. Onze de Agosto, 107', '1143671633', '1143671633', 'manual_google', true, 'ortopedia-apoio-sbc'),
(gen_random_uuid(), 'Mais Coluna', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua José Versolato, 111, conjunto 814', '11999999999', '11999999999', 'manual_google', true, 'mais-coluna-sbc'),
(gen_random_uuid(), 'Dr. Daniel Duenhas Quiropraxia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Jurubatuba, 845, 3º andar', '11999999999', '11999999999', 'manual_google', true, 'dr-daniel-duenhas-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Clínica Criaviva', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Rua Espírito Santo, 512', NULL, '1142281390', 'manual_google', true, 'clinica-criaviva-scs'),
(gen_random_uuid(), 'Clínica Cecília Franco', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-cecilia-franco-scs'),
(gen_random_uuid(), 'Clinica RT Saúde', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Manoel Coelho, 303, 6º Andar, sala 61', '11990022858', '1126685494', 'manual_google', true, 'clinica-rt-saude-scs'),

-- Diadema
(gen_random_uuid(), 'Clínica Fisio&Forma', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Nossa Senhora das Vitórias, 304', '11999999999', '11999999999', 'manual_google', true, 'clinica-fisioforma-diadema'),
(gen_random_uuid(), 'Clínica Onishi', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Nossa Sra. das Vitórias, 344', '11999999999', '1140568248', 'manual_google', true, 'clinica-onishi-diadema'),
(gen_random_uuid(), 'Simone Braga Quiropraxia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'R. Manoel da Nóbrega, 735, sala 109', '11999999999', '11999999999', 'manual_google', true, 'simone-braga-quiropraxia-diadema'),

-- Mauá
(gen_random_uuid(), 'Clínica Serfis Mauá', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'Rua Tercílio Tamagnini, 51', '11959326265', '1145472005', 'manual_google', true, 'clinica-serfis-maua'),
(gen_random_uuid(), 'SOS Quiropraxia Benyhe', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Pilar', 'Av. Portugal, 356 – Sala 13', '11995114387', '11995114387', 'manual_google', true, 'sos-quiropraxia-benyhe-maua'),
(gen_random_uuid(), 'SELFF Clínica de Reabilitação', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145553944', '1145553722', 'manual_google', true, 'selff-clinica-reabilitacao-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Fisioterapia Fiaux e Giarola', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', NULL, '1148283237', 'manual_google', true, 'fisioterapia-fiaux-ribeirao-pires'),
(gen_random_uuid(), 'Clínica Elgra', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', NULL, '1148234600', 'manual_google', true, 'clinica-elgra-ribeirao-pires'),
(gen_random_uuid(), 'Alamed Clínica Médica', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '1148227120', '1148227120', 'manual_google', true, 'alamed-clinica-medica-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Alamed Clínica Médica', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11960584549', '11960584549', 'manual_google', true, 'alamed-clinica-medica-rio-grande-da-serra'),
(gen_random_uuid(), 'APAE Fisioterapia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rua Carlos Dos Santos, Nº 156', '11999999999', '11999999999', 'manual_google', true, 'apae-fisioterapia-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
