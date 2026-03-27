-- Seeds para a categoria Escolas de Idiomas no ABC Paulista

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
(gen_random_uuid(), 'Top English Santo André', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11977897160', '11977897160', 'manual_google', true, 'top-english-santo-andre'),
(gen_random_uuid(), 'Escola Liverpool', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1149905026', '1149905026', 'manual_google', true, 'escola-liverpool-santo-andre'),
(gen_random_uuid(), 'Wizard Santo André Vila Bastos', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', '11940053574', '1149921111', 'manual_google', true, 'wizard-vila-bastos-santo-andre'),
(gen_random_uuid(), 'Berlitz Santo André', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Bairro Jardim', 'Av. Dom Pedro II, 1067', '1144322300', '1140034764', 'manual_google', true, 'berlitz-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Fourflags Language Center', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua João Pessoa, 600', '11989121313', '1143350909', 'manual_google', true, 'fourflags-language-center-sbc'),
(gen_random_uuid(), 'YÁZIGI SBC CENTRO', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Alvaro Marques', 'Rua Bela Vista, 65', '11944525957', '11944525957', 'manual_google', true, 'yazigi-centro-sbc'),
(gen_random_uuid(), 'Alt Idiomas', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Bairro Assunção', 'Avenida José Odorizzi, 2188', '11957160019', '1143924511', 'manual_google', true, 'alt-idiomas-sbc'),
(gen_random_uuid(), 'Wizard São Bernardo Assunção', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Rica', 'Rua Ouro Preto, 12', '11941375601', '11941375601', 'manual_google', true, 'wizard-assuncao-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Rockfeller São Caetano do Sul', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Tiradentes, 407', '1142337673', '1142337673', 'manual_google', true, 'rockfeller-scs'),
(gen_random_uuid(), 'Positive Idiomas', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Rio de Janeiro, 1113', '11973571703', '11981117582', 'manual_google', true, 'positive-idiomas-scs'),
(gen_random_uuid(), 'New London', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11973570481', '11973570481', 'manual_google', true, 'new-london-scs'),

-- Diadema
(gen_random_uuid(), 'Wizard Diadema Centro', 'idiomas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11972782430', '1140431344', 'manual_google', true, 'wizard-centro-diadema'),
(gen_random_uuid(), 'SESI Diadema Idiomas', 'idiomas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Taboão', 'Rua Porto Príncipe, 117-B', '1140773550', '1140927920', 'manual_google', true, 'sesi-idiomas-diadema'),

-- Mauá
(gen_random_uuid(), 'Wizard Mauá Vila Bocaina', 'idiomas', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Atendimento Regional', '1145443333', '1145443333', 'manual_google', true, 'wizard-vila-bocaina-maua'),
(gen_random_uuid(), 'inFlux Mauá', 'idiomas', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11913555774', '1145182232', 'manual_google', true, 'influx-maua'),
(gen_random_uuid(), 'CNA Mauá', 'idiomas', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145197911', '1145197911', 'manual_google', true, 'cna-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Wizard Ribeirão Pires', 'idiomas', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Avenida Fortuna, 336', '1148234088', '1148234088', 'manual_google', true, 'wizard-ribeirao-pires'),
(gen_random_uuid(), 'Microlins Ribeirão Pires', 'idiomas', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua do Comércio, 115a', '11940559028', '1148231715', 'manual_google', true, 'microlins-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Microlins Rio Grande da Serra', 'idiomas', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Vila Figueiredo', 'Rua Agostinho Cardoso, 125', '1144786048', '1144786048', 'manual_google', true, 'microlins-rgs')


ON CONFLICT (slug) DO NOTHING;
