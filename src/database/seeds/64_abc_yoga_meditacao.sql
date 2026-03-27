-- Seeds para a categoria Yoga e Meditação no ABC Paulista

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
(gen_random_uuid(), 'Ajna Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1123795289', 'manual_google', true, 'ajna-yoga-santo-andre'),
(gen_random_uuid(), 'Método DeRose Santo André', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'metodo-derose-santo-andre'),
(gen_random_uuid(), 'Mayaluz Yoga e Terapias', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11964918886', '11964918886', 'manual_google', true, 'mayaluz-yoga-santo-andre'),
(gen_random_uuid(), 'Vidya Studio (Santo André)', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'vidya-studio-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Yenzi Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11970907766', '11970907766', 'manual_google', true, 'yenzi-yoga-sbc'),
(gen_random_uuid(), 'Vayu Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'vayu-yoga-sbc'),
(gen_random_uuid(), 'Espaço Prana (SBC)', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-prana-sbc'),
(gen_random_uuid(), 'Espaço Mãe Gaia', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-mae-gaia-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Soham Yoga Studio', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Caulim, 115 - conjunto 811', '11992689303', '1135656993', 'manual_google', true, 'soham-yoga-scs'),
(gen_random_uuid(), 'Galpão Conexão Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Maria', 'Rua Ivaí, 702', '11987001943', '1142202805', 'manual_google', true, 'galpao-conexao-yoga-scs'),
(gen_random_uuid(), 'Espaço Bem Ser - Yoga e Psicologia', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-bem-ser-scs'),
(gen_random_uuid(), 'Surya Yoga Studio', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'surya-yoga-scs'),

-- Diadema
(gen_random_uuid(), 'Satya Yoga Diadema', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Marechal Deodoro, 311', '11983354267', '11983354267', 'manual_google', true, 'satya-yoga-diadema'),
(gen_random_uuid(), 'Shivão Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'shivao-yoga-diadema'),

-- Mauá
(gen_random_uuid(), 'Yamabushi Dojo Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'Rua Santa Cecília, 215', NULL, '1145452249', 'manual_google', true, 'yamabushi-dojo-maua'),
(gen_random_uuid(), 'SandYoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sandyoga-maua'),
(gen_random_uuid(), 'Sagrado Elemento Espaço Holístico', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Rua Duque de Caxias, 358', '11943937599', '11943937599', 'manual_google', true, 'sagrado-elemento-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Espaço Zen (RP)', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'R. Roberto Pinto de Toledo, 104', '11944833051', '11944833051', 'manual_google', true, 'espaco-zen-ribeirao-pires'),
(gen_random_uuid(), 'Soul Yoga Studio', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'R. Miguel Prisco, 742', '11978113250', '11978113250', 'manual_google', true, 'soul-yoga-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Espaço Zen (Online/Regional)', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11944833051', '11944833051', 'manual_google', true, 'espaco-zen-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
