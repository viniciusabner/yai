-- Seeds para a categoria Personal Organizer no ABC Paulista
-- A varredura profunda encontrou profissionais reais, porém em menor volume devido à natureza autônoma e remota do serviço (sem fachada física).

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
(gen_random_uuid(), 'Espaço Prático (Valéria Freitas)', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Rua Jequitinhonha, 335', NULL, NULL, 'manual_google', true, 'espaco-pratico-santo-andre'),
(gen_random_uuid(), 'Débora Demarchi (Debs Organizer)', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'debora-demarchi-santo-andre'),
(gen_random_uuid(), 'Bella Ordine (Fernanda Piva)', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Domiciliar', '11971944184', '11971944184', 'manual_google', true, 'bella-ordine-santo-andre'),
(gen_random_uuid(), 'Transforme com a Mari', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'transforme-com-a-mari-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Nana Bernardo Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Domiciliar', '11982641514', '11982641514', 'manual_google', true, 'nana-bernardo-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Oliva Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'oliva-organizer-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Thaynara B. Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'thaynara-b-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Ro Organiza', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Niterói, 362', NULL, NULL, 'manual_google', true, 'ro-organiza-sao-caetano-do-sul'),
(gen_random_uuid(), 'Luiza Petroni Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Domiciliar', '11992853379', '11992853379', 'manual_google', true, 'luiza-petroni-sao-caetano-do-sul'),
(gen_random_uuid(), 'Mosaico Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Espaço Cerâmica', 'Atendimento Domiciliar', '11981048336', '11981048336', 'manual_google', true, 'mosaico-organizer-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Laudenice Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'laudenice-diadema'),

-- Mauá
(gen_random_uuid(), 'Iris Flor De Liz Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'iris-flor-de-liz-maua'),
(gen_random_uuid(), 'Celmy Belle Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'celmy-belle-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Eliana Ribeiro Lopes', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Domiciliar', '11937153172', '11937153172', 'manual_google', true, 'eliana-ribeiro-lopes-ribeirao-pires')

ON CONFLICT (slug) DO NOTHING;
