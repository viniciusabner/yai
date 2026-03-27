-- Seeds para a categoria Banho e Tosa no ABC Paulista

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
(gen_random_uuid(), 'Pet Shop Pedroso', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Santo André', 'Estr. do Pedroso, 943', '1144517957', '1144517957', 'manual_google', true, 'pet-shop-pedroso-santo-andre'),
(gen_random_uuid(), 'VitalVet ABC', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Almirante Tamandaré, 349', '11999999999', '11999999999', 'manual_google', true, 'vitalvet-abc-santo-andre'),
(gen_random_uuid(), 'Skub Pet Shop', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11959469569', '11959469569', 'manual_google', true, 'skub-pet-shop-santo-andre'),
(gen_random_uuid(), 'Pet Shop Golden Premier', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Rua Almirante Protógenes, 399', '11996190808', '1144275707', 'manual_google', true, 'pet-shop-golden-premier-santo-andre'),
(gen_random_uuid(), 'Petlove Santo André', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Av. Portugal, 751', '1148003965', '1148003965', 'manual_google', true, 'petlove-santo-andre'),
(gen_random_uuid(), 'Cão Cheiroso Banho e Tosa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Rua Inglaterra, 26', '11999999999', '11999999999', 'manual_google', true, 'cao-cheiroso-banho-tosa-santo-andre'),
(gen_random_uuid(), 'Cobasi Santo André Av. dos Estados', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cobasi-av-estados-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Villa Zampa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11963392652', '11963392652', 'manual_google', true, 'villa-zampa-sbc'),
(gen_random_uuid(), '4 Patas e Cia', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11961640027', '1141786461', 'manual_google', true, '4-patas-e-cia-sbc'),
(gen_random_uuid(), 'Pet Shop Perto de Mim SBC', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11964964523', '11964964523', 'manual_google', true, 'pet-shop-perto-de-mim-sbc'),
(gen_random_uuid(), 'Cobasi SBC Faria Lima', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '1148532220', 'manual_google', true, 'cobasi-faria-lima-sbc'),
(gen_random_uuid(), 'PETPOP SBC', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Rua Helena Jacquey, 294', '11999999999', '1127584219', 'manual_google', true, 'petpop-sbc'),
(gen_random_uuid(), 'Chocãolate', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'chocaolate-pet-shop-sbc'),
(gen_random_uuid(), 'Pet Shop Vetorazzo', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-shop-vetorazzo-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'For Pet São Caetano', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Maria', 'Alameda São Caetano, 2423', '11994199000', '1127865759', 'manual_google', true, 'for-pet-scs'),
(gen_random_uuid(), 'Clinical Pets', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinical-pets-scs'),

-- Diadema
(gen_random_uuid(), 'Pet Shop Dog & Cat', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Taboão', 'Avenida Dom João VI, 986', '11986839413', '11986839413', 'manual_google', true, 'pet-shop-dog-cat-diadema'),
(gen_random_uuid(), 'Clínica Veterinária PetConsulta', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Campanário', 'Atendimento Regional', '11961914824', '1126779727', 'manual_google', true, 'petconsulta-diadema'),
(gen_random_uuid(), 'Cobasi Diadema', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Presidente Kennedy, 480', '11999999999', '1151981557', 'manual_google', true, 'cobasi-diadema'),
(gen_random_uuid(), 'Pet Shop Banho E Tosa (Sylvio Cunha)', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Antonio Sylvio Cunha Bueno, 170', NULL, '1140449131', 'manual_google', true, 'pet-shop-sylvio-cunha-diadema'),

-- Mauá
(gen_random_uuid(), 'Pet Shop Mansueli', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Morelli', 'Atendimento Regional', '11993215036', '11993215036', 'manual_google', true, 'pet-shop-mansueli-maua'),
(gen_random_uuid(), 'Barão Pet Center', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Av. Barão de Mauá, 1109', '11937353584', '11937353584', 'manual_google', true, 'barao-pet-center-maua'),
(gen_random_uuid(), 'Banho E Tosa Love Pet', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Rua Chico Mendes, 70', NULL, '1145145979', 'manual_google', true, 'love-pet-maua'),
(gen_random_uuid(), 'Amor E Pelos', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Avenida Brigadeiro Faria Lima, 44', NULL, '1184474197', 'manual_google', true, 'amor-e-pelos-maua'),
(gen_random_uuid(), 'So Pros Bichos Banho E Tosa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Itapeva', 'Avenida Barão de Mauá, 4652', NULL, '1145111279', 'manual_google', true, 'so-pros-bichos-maua'),
(gen_random_uuid(), 'Lu Pet Estetica Animal', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Rua João Batista Dell Antonia, 365', NULL, '1145415564', 'manual_google', true, 'lu-pet-estetica-maua'),
(gen_random_uuid(), 'Estetica Animal Glamour', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Sonia Maria', 'Rua Francisco Alves, 679', NULL, '1152402238', 'manual_google', true, 'estetica-animal-glamour-maua'),
(gen_random_uuid(), 'Pet Shop Delicato', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Canada', 'Rua Altivo Ovando, 260', NULL, '1145772641', 'manual_google', true, 'pet-shop-delicato-maua'),
(gen_random_uuid(), 'Cãobeleireiro Estetica Animal', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Dos Bandeirantes, 649', NULL, '1123129509', 'manual_google', true, 'caobeleireiro-estetica-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Chic Tosa - Pet Shop', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Suissa', 'Rua Manoel Dias Marcelino, 38', '1195446918', '1195446918', 'manual_google', true, 'chic-tosa-ribeirao-pires'),
(gen_random_uuid(), 'Espaço Pet', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-pet-ribeirao-pires'),
(gen_random_uuid(), 'Clínica Veterinária Ribeirão Pires', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-veterinaria-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), '4patas Banho e Tosa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Santa Tereza', 'Av. São João, 68', '11998782389', '11998782389', 'manual_google', true, '4patas-banho-e-tosa-rio-grande-da-serra'),
(gen_random_uuid(), 'Beleza Pet', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Jardim Novo Horizonte', 'Rua Pascoal Maimone Filho, 188', '11995930865', '11995930865', 'manual_google', true, 'beleza-pet-rio-grande-da-serra'),
(gen_random_uuid(), 'Pegasus Hospital Veterinário', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pegasus-hospital-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
