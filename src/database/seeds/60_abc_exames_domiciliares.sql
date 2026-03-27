-- Seeds para a categoria Exames Laboratoriais Domiciliares no ABC Paulista

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
(gen_random_uuid(), 'Grupo Ana Rosa Saúde (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1128422222', '1128422222', 'manual_google', true, 'ana-rosa-saude-santo-andre'),
(gen_random_uuid(), 'Labi Saúde (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1130032686', '1130032686', 'manual_google', true, 'labi-saude-santo-andre'),
(gen_random_uuid(), 'Vital Lab (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11940013043', '1132304950', 'manual_google', true, 'vital-lab-santo-andre'),
(gen_random_uuid(), 'Lab Hormon (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', NULL, '1144338982', 'manual_google', true, 'lab-hormon-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Lavoisier (Atendimento Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '1130474488', '1130474488', 'manual_google', true, 'lavoisier-sbc'),
(gen_random_uuid(), 'Hermes Pardini (Pardini até você)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', NULL, '1140202573', 'manual_google', true, 'hermes-pardini-sbc'),
(gen_random_uuid(), 'Sabin Diagnóstico (VEM Sabin)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Atendimento Regional', '1130032686', '1130032686', 'manual_google', true, 'sabin-diagnostico-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Exame Brasil (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Atendimento Regional', '11972475095', '1149020202', 'manual_google', true, 'exame-brasil-scs'),
(gen_random_uuid(), 'a+ Medicina Diagnóstica (a+ até Você)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Regional', '1131398000', '1131398000', 'manual_google', true, 'amais-medicina-diagnostica-scs'),

-- Diadema
(gen_random_uuid(), 'DiasLab (Na Minha Casa)', 'exames', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Arthur Sampaio Moreira, 83', NULL, '1140443190', 'manual_google', true, 'diaslab-diadema'),
(gen_random_uuid(), 'Ato Medicina Diagnóstica (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'ato-medicina-diagnostica-diadema'),

-- Mauá
(gen_random_uuid(), 'Mena Diagnóstico (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11976674302', '1148582964', 'manual_google', true, 'mena-diagnostico-maua'),
(gen_random_uuid(), 'Vital Lab (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Santos Dumont, 182', '11940013043', '1134200060', 'manual_google', true, 'vital-lab-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Exame Brasil (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11972475095', '1149020202', 'manual_google', true, 'exame-brasil-ribeirao-pires'),
(gen_random_uuid(), 'Vital Lab (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11940013043', '1134200060', 'manual_google', true, 'vital-lab-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Exame Brasil (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11972475095', '1149020202', 'manual_google', true, 'exame-brasil-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
