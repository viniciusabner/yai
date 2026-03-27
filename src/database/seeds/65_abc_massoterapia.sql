-- Seeds para a categoria Massoterapia no ABC Paulista

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
(gen_random_uuid(), 'Instituto Se Amar', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11998869545', '11998869545', 'manual_google', true, 'instituto-se-amar-santo-andre'),
(gen_random_uuid(), 'Espaço Salvaley', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11991179289', '11991179289', 'manual_google', true, 'espaco-salvaley-santo-andre'),
(gen_random_uuid(), 'Espaço Aline Soares', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11982258184', '11982258184', 'manual_google', true, 'espaco-aline-soares-santo-andre'),
(gen_random_uuid(), 'Buddha Spa Santo André Jardim', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Bairro Jardim', 'Atendimento Regional', '11910008424', '1149904099', 'manual_google', true, 'buddha-spa-santo-andre-jardim'),
(gen_random_uuid(), 'Espaço Ananda', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1144382078', 'manual_google', true, 'espaco-ananda-santo-andre'),
(gen_random_uuid(), 'Aroma Campestre', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', NULL, '1149924003', 'manual_google', true, 'aroma-campestre-santo-andre'),
(gen_random_uuid(), 'Clínica VIP Santo André', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11942332959', '1149923412', 'manual_google', true, 'clinica-vip-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Massoterapeuta Grace Celi', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Bela Vista, 284', '11999999999', '11999999999', 'manual_google', true, 'massoterapeuta-grace-celi-sbc'),
(gen_random_uuid(), 'Terapeuta Elis', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '11943795362', '11943795362', 'manual_google', true, 'terapeuta-elis-sbc'),
(gen_random_uuid(), 'Buddha Spa Golden Square', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Kennedy, 700 - LOJA 228', '11974109817', '1136311294', 'manual_google', true, 'buddha-spa-golden-square-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'SRmassoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Manoel Coelho, 676 - sala 1501', '11999999999', '11999999999', 'manual_google', true, 'srmassoterapia-scs'),
(gen_random_uuid(), 'Mara Renata Martorelli', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 185 - Sala 203', '11960548341', '1130318300', 'manual_google', true, 'mara-renata-martorelli-scs'),
(gen_random_uuid(), 'Clínica Oriental de Massagem', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 545', '11981793361', '1142338375', 'manual_google', true, 'clinica-oriental-massagem-scs'),
(gen_random_uuid(), 'Corpo e Alma Massoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'R. Manoel Coelho, 362 - sala 15', '11999999999', '11999999999', 'manual_google', true, 'corpo-alma-massoterapia-scs'),
(gen_random_uuid(), 'SPA da Riqueza', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11978897413', '11978897413', 'manual_google', true, 'spa-da-riqueza-scs'),

-- Diadema
(gen_random_uuid(), 'Instituto Shangrila', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Manoel da Nóbrega, 491', '11945547419', '11945547419', 'manual_google', true, 'instituto-shangrila-diadema'),
(gen_random_uuid(), 'Spaço Therapy - Andréia Souza', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Casa Grande', 'R. Anita Malfatti, 97 - Sala 3', '11999999999', '11999999999', 'manual_google', true, 'spaco-therapy-diadema'),
(gen_random_uuid(), 'Bruno Santos Massoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Alda, 380', '11999999999', '11999999999', 'manual_google', true, 'bruno-santos-massoterapia-diadema'),
(gen_random_uuid(), 'Royal Face Diadema', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua São Luiz, 35', '11913752040', '11913752040', 'manual_google', true, 'royal-face-diadema'),
(gen_random_uuid(), 'Espaço Sense Zen', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Jardim Rey', 'R. Visc. de Inhaúma, 90', NULL, '11987015806', 'manual_google', true, 'espaco-sense-zen-diadema'),
(gen_random_uuid(), 'Ieda Cecila Terapeuta', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'R. Graciosa, 221 - Sala 20', NULL, '11973639656', 'manual_google', true, 'ieda-cecila-terapeuta-diadema'),
(gen_random_uuid(), 'Lótus Bem-Estar', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua das Turmalinas, 132 - Conj 09', '11970404756', '11970404756', 'manual_google', true, 'lotus-bem-estar-diadema'),

-- Mauá
(gen_random_uuid(), 'Espaço Bem Estar Relaxante', 'massoterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Sonia Maria', 'R. Vicente Celestino, 666', '11999999999', '11999999999', 'manual_google', true, 'espaco-bem-estar-maua'),
(gen_random_uuid(), 'Agnaldo Massagista', 'massoterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Bela Vista', 'R. Francisco Vo, 24', '11977463027', '11977463027', 'manual_google', true, 'agnaldo-massagista-maua'),
(gen_random_uuid(), 'Everton Nemeth Massoterapeuta', 'massoterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Av. Pres. Castelo Branco, 1642 - Sala 11', '11999999999', '11999999999', 'manual_google', true, 'everton-nemeth-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Viviane Alves', 'massoterapia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11996946912', '11996946912', 'manual_google', true, 'viviane-alves-ribeirao-pires'),
(gen_random_uuid(), 'SPA Gota de Outono', 'massoterapia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Av. Fortuna, 81 - Sala 27', '11943202925', '11943202925', 'manual_google', true, 'spa-gota-de-outono-ribeirao-pires'),
(gen_random_uuid(), 'Espaço Mary Estética', 'massoterapia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'R. Dr. Felício Laurito, 61', '11942692848', '11942692848', 'manual_google', true, 'espaco-mary-estetica-ribeirao-pires'),
(gen_random_uuid(), 'Stellzer Massagem', 'massoterapia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro Alto', 'R. Dr. Pirajá, 292', '11999999999', '11999999999', 'manual_google', true, 'stellzer-massagem-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Santê Massoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sante-massoterapia-rio-grande-da-serra'),
(gen_random_uuid(), 'Tássia Saúde & Bem Estar', 'massoterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'tassia-saude-bem-estar-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
