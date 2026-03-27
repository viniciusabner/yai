-- Seeds para a categoria Alimentação Natural para Pets no ABC Paulista

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
(gen_random_uuid(), 'Animal Natural Store', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11996100031', '1142245139', 'manual_google', true, 'animal-natural-santo-andre'),
(gen_random_uuid(), 'XIG PET - Comida Natural', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11972462343', '11972462343', 'manual_google', true, 'xig-pet-santo-andre'),
(gen_random_uuid(), 'ZooLab Diagnóstico Veterinário (Nutrição)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Bairro Jardim', 'Rua das Caneleiras, 367', '11999999999', '11999999999', 'manual_google', true, 'zoolab-santo-andre'),
(gen_random_uuid(), 'Natural Jardim Empório e Pet Friendly', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'R. das Monções, 480', '11999999999', '11999999999', 'manual_google', true, 'natural-jardim-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Laboratório Lead (Nutrição Pet)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '1123689263', '1123689263', 'manual_google', true, 'laboratorio-lead-sbc'),
(gen_random_uuid(), 'Mundo Rural Petshop (Unidade Assunção)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Atendimento Regional', '11972865803', '11972865803', 'manual_google', true, 'mundo-rural-assuncao-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Animal Natural (Sede)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Fundação', 'Avenida do Estado 1540', '11996100031', '1142245139', 'manual_google', true, 'animal-natural-scs'),
(gen_random_uuid(), 'XIG PET São Caetano', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11972462343', '11972462343', 'manual_google', true, 'xig-pet-scs'),

-- Diadema
(gen_random_uuid(), 'Comida de Verdade Pet', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11987399642', '11987399642', 'manual_google', true, 'comida-de-verdade-pet-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Unidade Piraporinha)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Atendimento Regional', '11972865803', '1140661302', 'manual_google', true, 'mundo-rural-piraporinha-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Unidade Serraria)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11933512442', '1140696724', 'manual_google', true, 'mundo-rural-serraria-diadema'),

-- Mauá
(gen_random_uuid(), 'Alimentação Natural Pets', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '3138745151', '3138745151', 'manual_google', true, 'alimentacao-natural-pets-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Nino e Pepe (Alimentação Natural e Lowcarb)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11947890276', '11942939541', 'manual_google', true, 'nino-e-pepe-ribeirao-pires'),
(gen_random_uuid(), 'Lucas Soares Delfino (Vet AN)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11963985333', '11963985333', 'manual_google', true, 'lucas-delfino-vet-ribeirao-pires'),
(gen_random_uuid(), 'Pet Go Food', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '48991258793', '48991258793', 'manual_google', true, 'pet-go-food-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Nino e Pepe RGS', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11947890276', '11942939541', 'manual_google', true, 'nino-e-pepe-rgs')


ON CONFLICT (slug) DO NOTHING;
