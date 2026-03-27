-- Seeds para a categoria Automação Residencial no ABC Paulista

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
(gen_random_uuid(), 'Smart Atlantics Brasil', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11913702675', '11913702675', 'manual_google', true, 'smart-atlantics-brasil-santo-andre'),
(gen_random_uuid(), 'Hex Solutions Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', NULL, '1126280301', 'manual_google', true, 'hex-solutions-santo-andre'),
(gen_random_uuid(), 'HouseSmart Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '92981454564', '92981454564', 'manual_google', true, 'housesmart-automacao-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Automação Residencial São Paulo', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11975596711', '11975596711', 'manual_google', true, 'automacao-residencial-sao-paulo-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Pennse Controles e Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', NULL, '1120224656', 'manual_google', true, 'pennse-controles-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Enercec Engenharia e Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'enercec-engenharia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Casa Inteligente Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'casa-inteligente-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Bass Automação e Home Theater', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11973946245', '1126492984', 'manual_google', true, 'bass-automacao-sao-caetano-do-sul'),
(gen_random_uuid(), 'Aut4u Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 185', '11933113004', '11933113004', 'manual_google', true, 'aut4u-automacao-sao-caetano-do-sul'),
(gen_random_uuid(), 'SmartEvo Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Jardim São Caetano', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'smartevo-automacao-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'DOMUS Smart Home', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'domus-smart-home-diadema'),

-- Mauá
(gen_random_uuid(), 'Casa Tech Soluções', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'casa-tech-solucoes-maua')

ON CONFLICT (slug) DO NOTHING;
