-- Seeds para a categoria Cuidador de Idosos no ABC Paulista

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
(gen_random_uuid(), 'Chalé Florenza Residencial', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11985554434', '1149913791', 'manual_google', true, 'chale-florenza-santo-andre'),
(gen_random_uuid(), 'Nursing Excellent (Santo André)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '1150824640', 'manual_google', true, 'nursing-excellent-santo-andre'),
(gen_random_uuid(), 'Home Care Cuidar e Acolher', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'home-care-cuidar-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Home Angels (Centro SBC)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11975004223', '11975004223', 'manual_google', true, 'home-angels-sbc'),
(gen_random_uuid(), 'Angel''s Care ABC', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'angels-care-sbc'),
(gen_random_uuid(), 'LifeStars Cuidadores SBC', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'lifestars-cuidadores-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Vovô Help (São Caetano do Sul)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11990221044', '1141104855', 'manual_google', true, 'vovo-help-scs'),
(gen_random_uuid(), 'Pronto Care (São Caetano do Sul)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11948973172', '1123258667', 'manual_google', true, 'pronto-care-scs'),
(gen_random_uuid(), 'Casa Geriátrica São Caetano', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '1141154559', 'manual_google', true, 'casa-geriatrica-scs'),

-- Diadema
(gen_random_uuid(), 'Clínica Duarte Saúde Integrativa', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11992193554', '11992193554', 'manual_google', true, 'clinica-duarte-diadema'),
(gen_random_uuid(), 'Home Care Anjos de Plantão', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'anjos-de-plantao-diadema'),
(gen_random_uuid(), 'Onix Gestão do Cuidado (Diadema)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'onix-gestao-diadema'),

-- Mauá
(gen_random_uuid(), 'Acvida Cuidadores (Mauá)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '6133492079', '6133492079', 'manual_google', true, 'acvida-cuidadores-maua'),
(gen_random_uuid(), 'Onix Gestão Do Cuidado (Mauá)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'onix-gestao-maua'),
(gen_random_uuid(), 'Vovô Help (Mauá)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11990221044', '1141104855', 'manual_google', true, 'vovo-help-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Núcleo Saúde (Ribeirão Pires)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11912762864', '11912762864', 'manual_google', true, 'nucleo-saude-ribeirao-pires'),
(gen_random_uuid(), 'Amigos do Cuidar Home Care', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Tanque Caio', 'Avenida Miro Atílio Peduzzi, 100', '11999999999', '11999999999', 'manual_google', true, 'amigos-do-cuidar-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Home Care Cuidar e Acolher', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11964977776', '11964977776', 'manual_google', true, 'home-care-cuidar-rio-grande-da-serra'),
(gen_random_uuid(), 'Vovô Help (Rio Grande da Serra)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11990221044', '1141104855', 'manual_google', true, 'vovo-help-rio-grande-da-serra')

ON CONFLICT (slug) DO NOTHING;
