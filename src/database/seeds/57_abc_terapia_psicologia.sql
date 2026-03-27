-- Seeds para a categoria Terapia e Psicologia no ABC Paulista

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
(gen_random_uuid(), 'Nossos Psicólogos (Santo André)', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11959781941', '11959781941', 'manual_google', true, 'nossos-psicologos-santo-andre'),
(gen_random_uuid(), 'Psicologia Santo André', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999454953', '11999454953', 'manual_google', true, 'psicologia-santo-andre'),
(gen_random_uuid(), 'Sitka Núcleo Terapêutico', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11913306143', '11913306143', 'manual_google', true, 'sitka-nucleo-terapeutico-santo-andre'),
(gen_random_uuid(), 'Clínica Multipsico', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1127593798', 'manual_google', true, 'clinica-multipsico-santo-andre'),
(gen_random_uuid(), 'Clínica Seiner', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '11985911184', '1149943614', 'manual_google', true, 'clinica-seiner-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Mindclin Clínica Multidisciplinar', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11930452475', '1127868577', 'manual_google', true, 'mindclin-clinica-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Clínica Rosas de Terapia SBC', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Avenida Redenção, 432', '11983200099', '11986470048', 'manual_google', true, 'clinica-rosas-terapia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Elaine Sereno Teixeira Psicologia', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11968632121', '11968632121', 'manual_google', true, 'elaine-sereno-teixeira-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Psicologia São Caetano', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Amazonas, 416', '11998966260', '11998966260', 'manual_google', true, 'psicologia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Espaço Clínico Jardim da Consciência', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Afonso Pena, 251', '11956336017', '11956336017', 'manual_google', true, 'espaco-clinico-jardim-consciencia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Cristina Psicóloga A Sapiência', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Avenida Senador Roberto Simonsen, 743, Sala 10', '11999405085', '1142294477', 'manual_google', true, 'cristina-psicologa-sapiencia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Clínica Psicon', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 215 Sala 406', '11944652839', '1128977088', 'manual_google', true, 'clinica-psicon-sao-caetano-do-sul'),
(gen_random_uuid(), 'Clínica Síntese', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Conselheiro Lafayette, 318', NULL, '1142291654', 'manual_google', true, 'clinica-sintese-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'OPUS Psicologia e Neuropsicologia', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Turmalinas, 132 Salas 10 e 11', '11970404756', '1140562948', 'manual_google', true, 'opus-psicologia-diadema'),
(gen_random_uuid(), 'CEPAP Centro Paulista de Psicologia', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Orense, 41 Sala 414', '11972522372', '1142532997', 'manual_google', true, 'cepap-centro-paulista-psicologia-diadema'),
(gen_random_uuid(), 'Val Silva Psicóloga', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11958365632', '11958365632', 'manual_google', true, 'val-silva-psicologa-diadema'),
(gen_random_uuid(), 'Espaço Mente em Ação (emeap)', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Praça Joviniano de Castilho, 33 Cj 34 3º andar', '11984468362', '11984468362', 'manual_google', true, 'espaco-mente-em-acao-diadema'),

-- Mauá
(gen_random_uuid(), 'Clínica Rosas de Terapia Mauá', 'psicologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Rua do Comércio, 21', '11983200099', '1145182549', 'manual_google', true, 'clinica-rosas-terapia-maua'),
(gen_random_uuid(), 'ARCA Clínica', 'psicologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque São Vicente', 'Atendimento Regional', '11965817857', '1123757061', 'manual_google', true, 'arca-clinica-maua'),
(gen_random_uuid(), 'SELFF Clínica Psicológica', 'psicologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145553944', '1145553722', 'manual_google', true, 'selff-clinica-psicologica-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Psicólogo Em Ribeirão Pires', 'psicologia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Av. Fortuna, 98', '11999454953', '11999454953', 'manual_google', true, 'psicologo-ribeirao-pires'),
(gen_random_uuid(), 'Clínica Elgra', 'psicologia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro Alto', 'Av. Santo André, 252', NULL, '1148234600', 'manual_google', true, 'clinica-elgra-ribeirao-pires'),
(gen_random_uuid(), 'Espaço Terapia Alamed', 'psicologia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Av. Kaethe Richers, 117', '11910313139', '1148245448', 'manual_google', true, 'espaco-terapia-alamed-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Mariza Psicóloga', 'psicologia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11972321837', '11972321837', 'manual_google', true, 'mariza-psicologa-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
