-- Seeds para a categoria Odontologia Estética no ABC Paulista

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
(gen_random_uuid(), 'Rubi Odonto', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Parque das Nações', 'Atendimento Regional', '11953859973', '11953859973', 'manual_google', true, 'rubi-odonto-santo-andre'),
(gen_random_uuid(), 'Clínica Facialy', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Century Plaza', 'Atendimento Regional', '11993204740', '11993204740', 'manual_google', true, 'clinica-facialy-santo-andre'),
(gen_random_uuid(), 'Clínica B.blanc – Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-bblanc-santo-andre'),
(gen_random_uuid(), 'Infinittá Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'infinitta-odontologia-santo-andre'),
(gen_random_uuid(), 'Sorriso de Impacto – Dra Iessa', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '1149020143', 'manual_google', true, 'sorriso-impacto-dra-iessa-santo-andre'),
(gen_random_uuid(), 'Oral Designer', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Bela Vista', 'Rua Gonçalo Fernandes, 153, Sala 54', '11998772000', '1149905086', 'manual_google', true, 'oral-designer-santo-andre'),
(gen_random_uuid(), 'Clínica Dra Carolina Clausson', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-dra-carolina-clausson-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'COE Saúde Odontologia Estética', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11934578748', '11934578748', 'manual_google', true, 'coe-saude-odontologia-sbc'),
(gen_random_uuid(), 'Facia Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11947811267', '1143614323', 'manual_google', true, 'facia-odontologia-sbc'),
(gen_random_uuid(), 'VB Odonto Lentes de Contato', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11980526808', '11980526808', 'manual_google', true, 'vb-odonto-sbc'),
(gen_random_uuid(), 'Moreschi Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11995527322', '1143149245', 'manual_google', true, 'moreschi-odontologia-sbc'),
(gen_random_uuid(), 'Clínica Odontológica Clermont', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', NULL, '1143681277', 'manual_google', true, 'clinica-odontologica-clermont-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Clínica Perrella Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11969536028', '11969536028', 'manual_google', true, 'clinica-perrella-scs'),
(gen_random_uuid(), 'Doutor do Povo Clínicas SCS', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'doutor-do-povo-scs'),
(gen_random_uuid(), 'CAASP Farma - Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11958185335', '1142323016', 'manual_google', true, 'caasp-farma-odontologia-scs'),

-- Diadema
(gen_random_uuid(), 'Diadents Lentes de Porcelana', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'R. Orense, 41 - Sala 213', '11988304831', '11988304831', 'manual_google', true, 'diadents-lentes-porcelana-diadema'),
(gen_random_uuid(), 'Riso Facial Clínica Odontológica', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'riso-facial-diadema'),
(gen_random_uuid(), 'Clínica Abreu Centro Odontológico', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Fábio Eduardo Ramos Esquivel, 297', '11976443872', '1140481845', 'manual_google', true, 'clinica-abreu-diadema'),
(gen_random_uuid(), 'Cia Odontológica Dra. Elaine', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Nogueira', 'Rua Antônio Dias Adorno, 114', '11977016465', '11977016465', 'manual_google', true, 'cia-odontologica-dra-elaine-diadema'),
(gen_random_uuid(), 'Family Odontologia Estética', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'family-odontologia-diadema'),

-- Mauá
(gen_random_uuid(), 'Sangoleti Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sangoleti-odontologia-maua'),
(gen_random_uuid(), 'Clínica Viotto Mauá', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-viotto-maua'),
(gen_random_uuid(), 'Cepen Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cepen-odontologia-maua'),
(gen_random_uuid(), 'Qualident''s Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'qualidents-odontologia-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Dra. Paula Mietti Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Fioravante Zampol, 250', '11953226898', '11953226898', 'manual_google', true, 'dra-paula-mietti-ribeirao-pires'),
(gen_random_uuid(), 'Oral Unic Ribeirão Pires', 'odontologia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Avenida Francisco Monteiro, 1399', NULL, '1148237993', 'manual_google', true, 'oral-unic-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Fonte Vital Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'fonte-vital-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
