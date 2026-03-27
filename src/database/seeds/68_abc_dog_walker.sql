-- Seeds para a categoria Dog Walker no ABC Paulista

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
(gen_random_uuid(), 'Adestradores & Dog Walkers', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1142213948', 'manual_google', true, 'adestradores-dog-walker-santo-andre'),
(gen_random_uuid(), 'Renan Adestrador', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'renan-adestrador-santo-andre'),
(gen_random_uuid(), 'Mallaha Pet Resort', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'mallaha-pet-resort-santo-andre'),
(gen_random_uuid(), 'ABC Dog Adestramento e Passeios', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'abc-dog-adestramento-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Doggo Pet Service', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Rua Wadia Jafete Assad, 232', '11999999999', '11999999999', 'manual_google', true, 'doggo-pet-service-sbc'),
(gen_random_uuid(), 'Cia Pet Walker', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cia-pet-walker-sbc'),
(gen_random_uuid(), 'Cão Talento - Dog Walker', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cao-talento-dog-walker-sbc'),
(gen_random_uuid(), 'Pet Sitter Marcela', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-marcela-sbc'),
(gen_random_uuid(), 'Pet Sitter e Dog Walker Renata', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-renata-sbc'),
(gen_random_uuid(), 'Dog Walker Maya', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'dog-walker-maya-sbc'),
(gen_random_uuid(), 'Totó Passeia ABC', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'toto-passeia-abc-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Dog Walker no ABC', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11989082182', '1142241207', 'manual_google', true, 'dog-walker-no-abc-scs'),
(gen_random_uuid(), 'Dog Walker Leo', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'dog-walker-leo-scs'),
(gen_random_uuid(), 'Marcelo Adestrador e Passeador', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'marcelo-adestrador-scs'),
(gen_random_uuid(), 'Sr. Cão', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sr-cao-dog-walker-scs'),
(gen_random_uuid(), 'Walkin''Dog', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'walkindog-scs'),

-- Diadema
(gen_random_uuid(), 'May Dog Works', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'may-dog-works-diadema'),
(gen_random_uuid(), 'Cícera A. Passeadora', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cicera-passeadora-diadema'),
(gen_random_uuid(), 'Alyne B. Passeadora', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'alyne-passeadora-diadema'),
(gen_random_uuid(), 'Lucia C. Passeadora', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'lucia-passeadora-diadema'),

-- Mauá
(gen_random_uuid(), 'Jeferson Damásio Passeador', 'dog_walker', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'jeferson-damasio-maua'),
(gen_random_uuid(), 'Pet Sitter & Dog Walker Mauá', 'dog_walker', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-dog-walker-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Dog Walker Ribeirão Pires (GetNinjas Central)', 'dog_walker', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'dog-walker-ribeirao-pires'),
(gen_random_uuid(), 'Pet Anjo Parceiros Ribeirão', 'dog_walker', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-anjo-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Pet Sitter Rio Grande da Serra', 'dog_walker', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
