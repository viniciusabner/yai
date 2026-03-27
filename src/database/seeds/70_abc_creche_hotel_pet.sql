-- Seeds para a categoria Creches e Hotéis Pet no ABC Paulista

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
(gen_random_uuid(), 'Mallaha Pet Resort', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Rua Adolfo Bastos, 1184', '11953052202', '1123243612', 'manual_google', true, 'mallaha-pet-resort-santo-andre'),
(gen_random_uuid(), 'DogZone Creche e Hotel', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Alameda São Caetano, 519', '1149901125', '1149901125', 'manual_google', true, 'dogzone-santo-andre'),
(gen_random_uuid(), 'Escola de Pet (Creche e Hospedagem)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'R. Vitória Régia, 62', '11934154177', '11934154177', 'manual_google', true, 'escola-de-pet-santo-andre'),
(gen_random_uuid(), 'DoggFitness Day Care', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santa Maria', 'Alameda São Caetano, 923', '11968387356', '11968387356', 'manual_google', true, 'doggfitness-day-care-santo-andre'),
(gen_random_uuid(), 'Pet Family ABC (Hotel 24h)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-family-abc-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Dog''s Up (Unidade Demarchi)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Demarchi', 'Av. Maria Servidei Demarchi, 1535', '11945566365', '11945566365', 'manual_google', true, 'dogs-up-demarchi-sbc'),
(gen_random_uuid(), 'Dog''s Up (Unidade Jardim do Mar)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Rua Tasman, 114', '11915335402', '11915335402', 'manual_google', true, 'dogs-up-jardim-do-mar-sbc'),
(gen_random_uuid(), 'Resort dos Aumigos', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'R. Lapa, 378', '11959008344', '11959008344', 'manual_google', true, 'resort-dos-aumigos-sbc'),
(gen_random_uuid(), 'Oásis Resort Pet', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Nova Petrópolis', 'Alameda Dona Tereza Cristina, 689', '11937071472', '11937071472', 'manual_google', true, 'oasis-resort-pet-sbc'),
(gen_random_uuid(), 'Anjos de Quatro Patas Day Care', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Antártico, 353', '11942464515', '11942464515', 'manual_google', true, 'anjos-quatro-patas-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Pepetos Creche e Hotel', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11955783240', '11955783240', 'manual_google', true, 'pepetos-scs'),
(gen_random_uuid(), 'Creche Hotel Cão a Cão', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Martim Francisco, 66', '11989082182', '1142241207', 'manual_google', true, 'cao-a-cao-scs'),
(gen_random_uuid(), 'Eco Club Pet Shop (Hotel)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Avenida Senador Roberto Simonsen, 1278', '11999999999', '11999999999', 'manual_google', true, 'eco-club-pet-shop-scs'),
(gen_random_uuid(), 'Hotel Frieda', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'hotel-frieda-scs'),

-- Diadema
(gen_random_uuid(), 'Canil Antony (Day Care e Hotel)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Presidente Wenceslau, 157', '1140590572', '1140590572', 'manual_google', true, 'canil-antony-diadema'),
(gen_random_uuid(), 'Toca do Coelhinho (Creche Pet)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '1140447645', '1140447645', 'manual_google', true, 'toca-do-coelhinho-diadema'),

-- Mauá
(gen_random_uuid(), 'Animal Park Hotel', 'creche_pet', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque das Americas', 'Rua São Domingos, 152', '11999999999', '11999999999', 'manual_google', true, 'animal-park-hotel-maua'),
(gen_random_uuid(), 'Canil Ohana Gold (Day Care)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11998802826', '11998802826', 'manual_google', true, 'canil-ohana-gold-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Hostel Cão Cidadão DogHero Ribeirão', 'creche_pet', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'doghero-hostel-ribeirao-pires'),
(gen_random_uuid(), 'Pet Anjo Creche e Hospedagem (Polo RP)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Bocaina', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-anjo-creche-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Ohana Pet Resort RGS', 'creche_pet', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11998802826', '11998802826', 'manual_google', true, 'ohana-pet-resort-rgs')

ON CONFLICT (slug) DO NOTHING;
