-- Seeds para a categoria Personal Trainer no ABC Paulista

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
(gen_random_uuid(), 'Marina Personal Trainer', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento em Condomínios e Academias', '11970877377', '11970877377', 'manual_google', true, 'marina-personal-santo-andre'),
(gen_random_uuid(), 'Gustavo Personal Trainer', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento em Condomínios e Academias', '11959835698', '11959835698', 'manual_google', true, 'gustavo-personal-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Treinar.me Profissionais SBC', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'treinar-me-sbc'),
(gen_random_uuid(), 'Personal Trainer SBC Online', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Atendimento Regional', '11970877377', '11970877377', 'manual_google', true, 'personal-sbc-online'),

-- São Caetano do Sul
(gen_random_uuid(), 'Treinar.me Profissionais SCS', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'treinar-me-scs'),

-- Diadema
(gen_random_uuid(), 'Pro Fitness Academy', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'pro-fitness-diadema'),

-- Mauá
(gen_random_uuid(), 'Maverick Academia Mauá', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11914288952', '11914288952', 'manual_google', true, 'maverick-academia-maua'),
(gen_random_uuid(), 'Power Fitness Personal', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Vitoria', 'Atendimento Regional', '11914288952', '11914288952', 'manual_google', true, 'power-fitness-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Academia Atlantis Personal', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', NULL, '1141275177', 'manual_google', true, 'atlantis-personal-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Treinar.me Profissionais RGS', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'treinar-me-rgs')

ON CONFLICT (slug) DO NOTHING;
