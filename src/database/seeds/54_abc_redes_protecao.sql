-- Seeds para a categoria Redes de Proteção no ABC Paulista

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
(gen_random_uuid(), 'Mari Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11970971456', '11970971456', 'manual_google', true, 'mari-redes-de-protecao-santo-andre'),
(gen_random_uuid(), 'Soluções Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Alzira', 'Atendimento Regional', '11997777352', '1128669625', 'manual_google', true, 'solucoes-redes-de-protecao-santo-andre'),
(gen_random_uuid(), 'Vidal''s Proteções', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11950495293', '11950495293', 'manual_google', true, 'vidals-protecoes-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'PB Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11964569245', '1143069245', 'manual_google', true, 'pb-redes-de-protecao-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Garcia Redes', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', NULL, '1129570499', 'manual_google', true, 'garcia-redes-sao-bernardo-do-campo'),
(gen_random_uuid(), 'RGR Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', '11958871612', '11958871612', 'manual_google', true, 'rgr-redes-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Fortex Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Atendimento Regional', '11961751592', '1144764120', 'manual_google', true, 'fortex-redes-sao-bernardo-do-campo'),
(gen_random_uuid(), 'ABC Telas e Redes', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Demarchi', 'Atendimento Regional', '11997079018', '11997079018', 'manual_google', true, 'abc-telas-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Love Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11978846583', '11978846583', 'manual_google', true, 'love-redes-de-protecao-sao-caetano-do-sul'),
(gen_random_uuid(), 'Mel Proteções', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Regional', NULL, '1126818141', 'manual_google', true, 'mel-protecoes-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Brasil Redes Proteções', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11969380454', '1124553618', 'manual_google', true, 'brasil-redes-protecoes-diadema'),
(gen_random_uuid(), 'Pet Seguro Redes', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11948277508', '1125018610', 'manual_google', true, 'pet-seguro-redes-diadema'),

-- Mauá
(gen_random_uuid(), 'Excelência Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11961418863', '1141710493', 'manual_google', true, 'excelencia-redes-maua'),
(gen_random_uuid(), 'Protagon Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Avenida Presidente Afonso Pena, 551', '11951926128', '11951926128', 'manual_google', true, 'protagon-redes-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Magazine das Redes', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11987861055', '1144011803', 'manual_google', true, 'magazine-das-redes-ribeirao-pires')

ON CONFLICT (slug) DO NOTHING;
