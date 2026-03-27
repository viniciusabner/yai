-- Seeds para a categoria Nutricionistas no ABC Paulista

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
(gen_random_uuid(), 'Clínica Vida em Equilíbrio Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11975143327', '11975143327', 'manual_google', true, 'clinica-vida-equilibrio-santo-andre'),
(gen_random_uuid(), 'Raphael Costa Selleri Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11957221466', '11957221466', 'manual_google', true, 'raphael-costa-selleri-santo-andre'),
(gen_random_uuid(), 'Dra. Janaini Araújo Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', '11984354496', '11984354496', 'manual_google', true, 'janaini-araujo-santo-andre'),
(gen_random_uuid(), 'Fernanda Alves Prado Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Atendimento Regional', '11966629079', '11966629079', 'manual_google', true, 'fernanda-alves-prado-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Dra. Lorena Medeiros Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Av. Getúlio Vargas, 70 - 2º andar sala 23', '11952736872', '11952736872', 'manual_google', true, 'lorena-medeiros-sbc'),
(gen_random_uuid(), 'Gustavo Luiz Nutrição Esportiva', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11959835698', '1149304992', 'manual_google', true, 'gustavo-luiz-nutricao-sbc'),
(gen_random_uuid(), 'Clínica Adriana Biffi', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Frei Gaspar, 941 - Sala 503', NULL, '11999999999', 'manual_google', true, 'clinica-adriana-biffi-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Brayan Scherk Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Pres. Kennedy, 3500 - Sala 902', '11982225255', '11982225255', 'manual_google', true, 'brayan-scherk-scs'),
(gen_random_uuid(), 'Clínica Bruna Amaral Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Rua Espírito Santo, 115', '11989888790', '11989888790', 'manual_google', true, 'bruna-amaral-scs'),
(gen_random_uuid(), 'Bianca Kucharsky Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11945258053', '11945258053', 'manual_google', true, 'bianca-kucharsky-scs'),
(gen_random_uuid(), 'Clínica Azzi Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 250, CJ 304', '11930042000', '1142242000', 'manual_google', true, 'clinica-azzi-scs'),
(gen_random_uuid(), 'Dra. Fernanda Molina Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Pará 139, 3º andar, sala 301', '11947165880', '11947165880', 'manual_google', true, 'fernanda-molina-scs'),

-- Diadema
(gen_random_uuid(), 'Nutri Juliana Lopes', 'nutricionista', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'juliana-lopes-diadema'),
(gen_random_uuid(), 'Aline Martins Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Manoel da Nóbrega, 628 / Conj 110', NULL, '11999999999', 'manual_google', true, 'aline-martins-diadema'),
(gen_random_uuid(), 'João Malta Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11989763990', '11989763990', 'manual_google', true, 'joao-malta-diadema'),

-- Mauá
(gen_random_uuid(), 'Charlene Cristina Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'R. Alm. Barroso, 30', '11981743554', '11981743554', 'manual_google', true, 'charlene-cristina-maua'),
(gen_random_uuid(), 'Elaine Costa Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, '11999999999', 'manual_google', true, 'elaine-costa-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Anna Paula Vicente Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11916091385', '11916091385', 'manual_google', true, 'anna-paula-vicente-ribeirao-pires'),
(gen_random_uuid(), 'Ana Paula Bastos Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro Alto', 'Rua Rubião Júnior, 438', NULL, '11999999999', 'manual_google', true, 'ana-paula-bastos-ribeirao-pires')

ON CONFLICT (slug) DO NOTHING;
