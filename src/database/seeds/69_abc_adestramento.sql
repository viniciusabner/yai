-- Seeds para a categoria Adestramento Comportamental no ABC Paulista

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
(gen_random_uuid(), 'Centro Vila AssunCão', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '11991759020', '11991759020', 'manual_google', true, 'centro-vila-assuncao-santo-andre'),
(gen_random_uuid(), 'Renan Rocha Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'renan-rocha-adestramento-santo-andre'),
(gen_random_uuid(), 'Alecio Neris Adestrador', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'alecio-neris-adestrador-santo-andre'),
(gen_random_uuid(), 'MB Dogs Edução Canina', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Alzira', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'mb-dogs-educacao-canina-santo-andre'),
(gen_random_uuid(), 'Cão Cidadão Santo André (Dr. Pet)', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Domiciliar', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Adestrador Celso Daniel Miron', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'celso-daniel-miron-sbc'),
(gen_random_uuid(), 'Cão Cidadão SBC', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Domiciliar', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-sbc'),
(gen_random_uuid(), 'Petz SBC (Adestramento Indoor)', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Rua Garcia Lorca, 301', '1121817359', '1121817359', 'manual_google', true, 'petz-adestramento-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Cão Club Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Olímpico', 'Rua Panati, 19', '11985463049', '1142213948', 'manual_google', true, 'cao-club-adestramento-scs'),
(gen_random_uuid(), 'Creche Hotel Cão a Cão (Comportamental)', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Martim Francisco, 66', '11989082182', '1142241207', 'manual_google', true, 'cao-a-cao-adestramento-scs'),
(gen_random_uuid(), 'Sr. Cão (Fabiano Coelho)', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sr-cao-fabiano-coelho-scs'),
(gen_random_uuid(), 'Matilha Em Harmonia', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Domiciliar', '11999999999', '11999999999', 'manual_google', true, 'matilha-em-harmonia-scs'),
(gen_random_uuid(), 'Jonathan Normandia Adestrador', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'jonathan-normandia-scs'),
(gen_random_uuid(), 'Ubiratan Rabadan Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'ubiratan-rabadan-adestramento-scs'),

-- Diadema
(gen_random_uuid(), 'PRH Adestramento (36 anos)', 'adestramento', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11937068592', '11937068592', 'manual_google', true, 'prh-adestramento-diadema'),
(gen_random_uuid(), 'Adestramento de Cães RP', 'adestramento', (SELECT id FROM public.cities WHERE slug='diadema'), 'Conceição', 'Rua Modesto Álvares Dias, 71', '11999999999', '11999999999', 'manual_google', true, 'adestramento-caes-rp-diadema'),
(gen_random_uuid(), 'Cattulu Escola de Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua dos Rubis, 187', '11999999999', '11999999999', 'manual_google', true, 'cattulu-escola-adestramento-diadema'),

-- Mauá
(gen_random_uuid(), 'Adestrador Alexandre Luiz', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Jd. Quarto Centenário', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'adestrador-alexandre-luiz-maua'),
(gen_random_uuid(), 'Cão Cidadão Mauá', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-maua'),
(gen_random_uuid(), 'MB Dogs - Polo Mauá', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'mb-dogs-maua'),
(gen_random_uuid(), 'Livia Perez Educação Canina', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'livia-perez-educacao-canina-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Camila Macêdo Dog Walker e Adestramento Positivo', 'adestramento', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'camila-macedo-adestramento-ribeirao-pires'),
(gen_random_uuid(), 'Cão Cidadão Ribeirão Pires', 'adestramento', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-ribeirao-pires'),
(gen_random_uuid(), 'Jeferson Damásio Comportamento Pet', 'adestramento', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'jeferson-damasio-adestramento-ribeirao-pires'),
(gen_random_uuid(), 'Centro de Treinamento Canino Ribeirão', 'adestramento', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'ct-canino-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Adestramento Comportamental Rio Grande', 'adestramento', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'adestramento-rio-grande-da-serra'),
(gen_random_uuid(), 'Educador Canino RGS', 'adestramento', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'educador-canino-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
