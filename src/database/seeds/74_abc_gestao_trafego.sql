-- Seeds para a categoria Agências/Gestão de Tráfego Local no ABC Paulista

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
(gen_random_uuid(), 'Vitalino Publicidade', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11948825767', '11913525253', 'manual_google', true, 'vitalino-publicidade-santo-andre'),
(gen_random_uuid(), 'Criativando Publicidade', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'criativando-publicidade-santo-andre'),
(gen_random_uuid(), 'DIVIA Marketing Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1139566312', '1139566312', 'manual_google', true, 'divia-marketing-santo-andre'),
(gen_random_uuid(), 'Go On Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'go-on-digital-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'North Star Growth', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '16997951718', '16997951718', 'manual_google', true, 'north-star-growth-sbc'),
(gen_random_uuid(), 'RGB Comunicação', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11969095513', '11969095513', 'manual_google', true, 'rgb-comunicacao-sbc'),
(gen_random_uuid(), 'Talos Agência de Tráfego', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'talos-agencia-sbc'),
(gen_random_uuid(), 'Digitall Evolution', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'digitall-evolution-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'MediaTosi Agência de Marketing', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11948119627', '11948119627', 'manual_google', true, 'mediatosi-scs'),
(gen_random_uuid(), 'Goognet Solução Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'goognet-solucao-digital-scs'),
(gen_random_uuid(), 'UGAH! Comunicação', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'CEP: 09531-080', '11999999999', '11999999999', 'manual_google', true, 'ugah-comunicacao-scs'),
(gen_random_uuid(), 'Marke Marketing Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'marke-marketing-scs'),

-- Diadema
(gen_random_uuid(), 'Ação Águia Brasil', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'acao-aguia-brasil-diadema'),
(gen_random_uuid(), 'Agencia 4UP', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'agencia-4up-diadema'),
(gen_random_uuid(), 'ClickPro Marketing', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Alda', '11955939389', '11955939389', 'manual_google', true, 'clickpro-marketing-diadema'),

-- Mauá
(gen_random_uuid(), 'Mazzini Marketing', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Campos Sales', '11999999999', '11999999999', 'manual_google', true, 'mazzini-marketing-maua'),
(gen_random_uuid(), 'Agência GWP', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Nossa Senhora das Vitórias', 'Rua Miguel Elías', '11999999999', '11999999999', 'manual_google', true, 'agencia-gwp-maua'),
(gen_random_uuid(), 'Capta Marketing Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '5133769410', '5133769410', 'manual_google', true, 'capta-marketing-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Connect Web Marketing', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'connect-web-marketing-ribeirao-pires'),
(gen_random_uuid(), 'Agência Wert', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'agencia-wert-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Click Tráfego', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11948056385', '11948056385', 'manual_google', true, 'click-trafego-rgs')


ON CONFLICT (slug) DO NOTHING;
