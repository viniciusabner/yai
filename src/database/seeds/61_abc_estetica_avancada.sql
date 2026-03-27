-- Seeds para a categoria Estética Avançada e Harmonização Facial no ABC Paulista

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
(gen_random_uuid(), 'SJ Estética Avançada', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Homero Thon', 'Rua Giovanni Battista Pirelli, 271', '11982223767', '11982223767', 'manual_google', true, 'sj-estetica-santo-andre'),
(gen_random_uuid(), 'Clínica Dra. Edna Crivelaro', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Homero Thon', 'Rua Giovanni Battista Pirelli, 271 - Sala 209', '11919312465', '11919312465', 'manual_google', true, 'edna-crivelaro-santo-andre'),
(gen_random_uuid(), 'GiO Estética Avançada', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Avenida Padre Manuel da Nóbrega, 287', '11934397511', '1134397511', 'manual_google', true, 'gio-estetica-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Dra. Flávia Gimenez Estética', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'R. Formosa, 79 - Sala 82', '11942203732', '11942203732', 'manual_google', true, 'flavia-gimenez-sbc'),
(gen_random_uuid(), 'Clínica Versollato', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Avenida Antártico, 381 - sala 18', '11914834243', '11914834243', 'manual_google', true, 'clinica-versollato-sbc'),
(gen_random_uuid(), 'BOTOCLINIC', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Kennedy, 700, Piso L1, 174', '11953234346', '11953234346', 'manual_google', true, 'botoclinic-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Royal Face', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'R. Amazonas, 444', '1142297110', '1142297110', 'manual_google', true, 'royal-face-scs'),
(gen_random_uuid(), 'Nativis Estética Avançada', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Rua Castro Alves, 111', '11939360757', '1123767324', 'manual_google', true, 'nativis-estetica-scs'),
(gen_random_uuid(), 'Clínica Perrella', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua General Osório, 410', '11969536028', '1142283879', 'manual_google', true, 'clinica-perrella-scs'),

-- Diadema
(gen_random_uuid(), 'GiO Estética Avançada Diadema', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '1135930200', '1135930200', 'manual_google', true, 'gio-estetica-diadema'),
(gen_random_uuid(), 'Perfil Estética', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Shopping Praça da Moça', '11998225391', '11998225391', 'manual_google', true, 'perfil-estetica-diadema'),
(gen_random_uuid(), 'Clínica Belle Harmony', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Praça Pres. Castelo Branco, 255 - Sala 08', '11974101100', '11974101100', 'manual_google', true, 'belle-harmony-diadema'),

-- Mauá
(gen_random_uuid(), 'Royal Face Mauá', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11996661030', '11996661030', 'manual_google', true, 'royal-face-maua'),
(gen_random_uuid(), 'Dra. Juliana Francis', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque São Vicente', 'Atendimento Regional', '11972171553', '11972171553', 'manual_google', true, 'juliana-francis-maua'),
(gen_random_uuid(), 'Clínica Kondo', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, '1145414277', 'manual_google', true, 'clinica-kondo-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'GiO Estética Avançada Ribeirão Pires', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Stella Bruna Cecchi Nardelli, 48', '11916242197', '11916242197', 'manual_google', true, 'gio-estetica-ribeirao-pires'),
(gen_random_uuid(), 'Elleven Clínica de Saúde', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Euclídes da Cunha, 117, 3º andar, Sala 38', NULL, '1146807758', 'manual_google', true, 'elleven-clinica-ribeirao-pires')

ON CONFLICT (slug) DO NOTHING;
