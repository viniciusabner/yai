-- Seeds para a categoria Pet Shop e Casa de Ração no ABC Paulista

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
(gen_random_uuid(), 'Pet Shop Pedroso', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Santo André', 'Estr. do Pedroso, 943', '1144517957', '1144517957', 'manual_google', true, 'pet-shop-pedroso-santo-andre'),
(gen_random_uuid(), 'VitalVet ABC Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Almirante Tamandaré, 349', '1144384655', '1144384655', 'manual_google', true, 'vitalvet-abc-pet-shop-santo-andre'),
(gen_random_uuid(), 'Mundo Animal Distribuidora de Ração', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Camilópolis', 'Rua Matilde, 238', '11963168005', '1144614189', 'manual_google', true, 'mundo-animal-distribuidora-santo-andre'),
(gen_random_uuid(), 'Pet Shop Golden Premier', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Rua Almirante Protógenes, 399', '11996190808', '1144275707', 'manual_google', true, 'pet-shop-golden-premier-santo-andre'),
(gen_random_uuid(), 'Petz Avenida dos Estados', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Parque Jaçatuba', 'Av. dos Estados, 6973', '1121817392', '1121817392', 'manual_google', true, 'petz-avenida-estados-santo-andre'),
(gen_random_uuid(), 'Petz Dom Pedro II', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Av. Dom Pedro II, 933', '1121817313', '1121817313', 'manual_google', true, 'petz-dom-pedro-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Casa de Ração Rosa Pet', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim Industrial', 'Rua Edson Queiroz, 99', '1143306948', '1143306948', 'manual_google', true, 'casa-de-racao-rosa-pet-sbc'),
(gen_random_uuid(), 'Cobasi Faria Lima', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Av. Brigadeiro Faria Lima, 1760', '1148532220', '1148532220', 'manual_google', true, 'cobasi-faria-lima-sbc'),
(gen_random_uuid(), 'Cobasi Caminho do Mar', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '1143174626', '1143174626', 'manual_google', true, 'cobasi-caminho-do-mar-sbc'),
(gen_random_uuid(), 'Dog''s Up Demarchi', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Demarchi', 'Av. Maria Servidei Demarchi, 1535', '11945566365', '11945566365', 'manual_google', true, 'dogs-up-demarchi-sbc'),
(gen_random_uuid(), 'Dog''s Up Jardim do Mar', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Rua Tasman, 114', '11915335402', '11915335402', 'manual_google', true, 'dogs-up-jardim-do-mar-sbc'),
(gen_random_uuid(), 'BR Pet Store', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11911415203', '1127586813', 'manual_google', true, 'br-pet-store-sbc'),
(gen_random_uuid(), 'Cia do Bicho Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Vianas', 'Rua Vianas, 2947', '1141256283', '1141256283', 'manual_google', true, 'cia-do-bicho-sbc'),
(gen_random_uuid(), 'Betpet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Ernesta Pelosini, 92', '1141247057', '1141247057', 'manual_google', true, 'betpet-shop-sbc'),
(gen_random_uuid(), 'PegPet SBC', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Vianas', 'Av. dos Vianas, 2827', '11933608312', '11933608312', 'manual_google', true, 'pegpet-sbc'),
(gen_random_uuid(), 'Mercadão Pet Pequini', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '1126696724', '1126696724', 'manual_google', true, 'mercadao-pet-pequini-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Pet Speciale', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Avenida Senador Roberto Simonsen, 663', '11996867780', '11996867780', 'manual_google', true, 'pet-speciale-scs'),
(gen_random_uuid(), 'Patas Preciosas Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Barcelona', 'Rua Votorantim, 271', '1129887108', '1129887108', 'manual_google', true, 'patas-preciosas-scs'),
(gen_random_uuid(), 'Pet Shop São José (Santa Paula)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Avenida Pres. Kennedy, 1591', '11976435098', '1141033445', 'manual_google', true, 'pet-shop-sao-jose-santa-paula-scs'),
(gen_random_uuid(), 'Pet Shop São José (Anchieta)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Anchieta', 'Avenida Senador Vergueiro, 3687', '11975073270', '1142267141', 'manual_google', true, 'pet-shop-sao-jose-anchieta-scs'),
(gen_random_uuid(), 'PET & VET São Caetano', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Av. Pres. Kennedy, 1480', '1142264910', '1142264910', 'manual_google', true, 'pet-e-vet-scs'),

-- Diadema
(gen_random_uuid(), 'Casa de Ração Nosso Lar', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Leopoldo S, 71', '1140665858', '1140665858', 'manual_google', true, 'casa-de-racao-nosso-lar-diadema'),
(gen_random_uuid(), 'Petz Diadema', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Fábio Eduardo Ramos Esquivel, 1100', '1121817352', '1121817352', 'manual_google', true, 'petz-diadema'),
(gen_random_uuid(), 'Cobasi Diadema', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Presidente Kennedy, 480', '1151981557', '1151981557', 'manual_google', true, 'cobasi-diadema'),
(gen_random_uuid(), 'Pet Shop Xodó', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Av. Lico Maia, 442', '11954218780', '1140554585', 'manual_google', true, 'pet-shop-xodo-diadema'),
(gen_random_uuid(), 'Meu Amigão Cão & Gato', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Graciosa, 528', '11998683636', '1123751912', 'manual_google', true, 'meu-amigao-cao-e-gato-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Piraporinha)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Praça Bom Jesus Piraporinha, 122', '11972865803', '1140661302', 'manual_google', true, 'mundo-rural-piraporinha-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Serraria)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Av. Dona Ruyce Ferraz Alvim, 1801', '11933512442', '1140696724', 'manual_google', true, 'mundo-rural-serraria-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Centro)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Manoel da Nobrega, 1584', '11945386367', '1140561424', 'manual_google', true, 'mundo-rural-centro-diadema'),

-- Mauá
(gen_random_uuid(), 'Petz Shopping Mauá', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Av. Gov. Mario Covas Júnior, 01', '1121817329', '1121817329', 'manual_google', true, 'petz-shopping-maua'),
(gen_random_uuid(), 'Patativa Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Av. Presidente Castelo Branco, 1509', '11947757887', '1145471449', 'manual_google', true, 'patativa-pet-shop-maua'),
(gen_random_uuid(), 'Papa Léguas Agropet', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11956003684', '11956003684', 'manual_google', true, 'papa-leguas-agropet-maua'),
(gen_random_uuid(), 'Pet Shop Patriarca', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145785407', '1145785407', 'manual_google', true, 'pet-shop-patriarca-maua'),
(gen_random_uuid(), 'Mercadão Pet Mauá', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145187115', '1145187115', 'manual_google', true, 'mercadao-pet-maua'),
(gen_random_uuid(), 'Pet Shop e Clínica Anchieta', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11975985467', '11975985467', 'manual_google', true, 'pet-shop-anchieta-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Estância Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '1148231912', '1148231912', 'manual_google', true, 'estancia-pet-shop-ribeirao-pires'),
(gen_random_uuid(), 'Estância Pet Shop e Casa de Ração', 'pet_shop', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Bocaina', 'Av. Humberto de Campos, 3499', '1148257768', '1148257768', 'manual_google', true, 'estancia-pet-shop-racao-ribeirao-pires'),
(gen_random_uuid(), 'Cão Feliz Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'R. Miguel Prisco, 020', '1148277715', '1148277715', 'manual_google', true, 'cao-feliz-pet-shop-ribeirao-pires'),
(gen_random_uuid(), 'Abrantes Magnus Rações', 'pet_shop', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Represa', 'Rod. Índio Tibiriçá, 2103', '1148221118', '1148221118', 'manual_google', true, 'abrantes-magnus-ribeirao-pires'),
(gen_random_uuid(), 'Nipon Petshop Loja I', 'pet_shop', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Santa Luzia', 'Atendimento Regional', '1148276261', '1148276261', 'manual_google', true, 'nipon-petshop-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Casa de Rações Marquinhos', 'pet_shop', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '1148202525', '1148202525', 'manual_google', true, 'casa-racoes-marquinhos-rgs'),
(gen_random_uuid(), 'Bichó Pet Shop RGS', 'pet_shop', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'bicho-pet-shop-rgs')


ON CONFLICT (slug) DO NOTHING;
