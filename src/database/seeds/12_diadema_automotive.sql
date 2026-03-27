-- 1. Ensure City Exists (Diadema)
INSERT INTO public.cities (name, slug, state)
VALUES ('Diadema', 'diadema', 'SP')
ON CONFLICT (slug) DO NOTHING;

-- 2. Insert Providers (Automotive)
-- Using gen_random_uuid() for IDs
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Chevrolet Viamar Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Fábio Eduardo Ramos Esquivel, 1178', '1121006000', '1121006000', 'contato@viamar.com.br', 'manual_google', true, 'chevrolet-viamar-diadema', 'automoveis', 'https://www.viamar.com.br', null),
  (gen_random_uuid(), 'Renault Armando Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Fábio Eduardo Ramos Esquivel, 2651', '1127616500', '1127616500', 'contato@armandorenault.com.br', 'manual_google', true, 'renault-armando-diadema', 'automoveis', 'https://www.armandorenault.com.br', null),
  (gen_random_uuid(), 'Hyundai Sinal Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Fábio Eduardo Ramos Esquivel, 2421', '1140726000', '1140726000', 'contato@gruposinal.com.br', 'manual_google', true, 'hyundai-sinal-diadema', 'automoveis', 'https://www.gruposinal.com.br', null),
  (gen_random_uuid(), 'OutletKar Diadema', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Antônio Piranga, 1065', '1140561000', '1140561000', 'contato@outletkar.com.br', 'manual_google', true, 'outletkar-diadema', 'automoveis', 'https://www.outletkar.com.br', null),
  (gen_random_uuid(), 'Orense Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Orense, 342', '11940319527', '1134261151', 'contato@orenseveiculos.com.br', 'manual_google', true, 'orense-veiculos-diadema', 'automoveis', 'https://www.orenseveiculos.com.br', null),
  (gen_random_uuid(), '21 Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Presidente Kennedy, 638', '1140540304', '1140540304', 'contato@21veiculos.com.br', 'manual_google', true, '21-veiculos-diadema', 'automoveis', null, null),
  (gen_random_uuid(), 'Action Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Amélia Eugênia, 148', '1140567724', '1140567724', 'contato@actionveiculos.com.br', 'manual_google', true, 'action-veiculos-diadema', 'automoveis', null, null),
  (gen_random_uuid(), 'Alda Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Alda, 1071', '1140444927', '1140444927', 'contato@aldaveiculos.com.br', 'manual_google', true, 'alda-veiculos-diadema', 'automoveis', null, null),
  (gen_random_uuid(), 'Diadel Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Prestes Maia, 130', '1140442929', '1140442929', 'contato@diadel.com.br', 'manual_google', true, 'diadel-veiculos-diadema', 'automoveis', null, null),
  (gen_random_uuid(), 'Mavicar Automóveis', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Pres. Kenedy, 377', '1140515185', '1140515185', 'contato@mavicar.com.br', 'manual_google', true, 'mavicar-automoveis-diadema', 'automoveis', 'https://www.mavicarautomoveis.com.br', null),
  (gen_random_uuid(), 'Vila Nogueira Multimarcas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Nogueira', 'Rua Antonio Dias Adorno, 856', '1140772444', '1140772444', 'contato@vilanogueiramultimarcas.com.br', 'manual_google', true, 'vila-nogueira-multimarcas-diadema', 'automoveis', 'https://www.vilanogueiramultimarcas.com.br', null),
  (gen_random_uuid(), 'Eldorado Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Eldorado', 'Avenida Nossa Senhora dos Navegantes, 1215', '11982385539', '11982385539', 'contato@eldoradoveiculos.com.br', 'manual_google', true, 'eldorado-veiculos-diadema', 'automoveis', null, null),
  (gen_random_uuid(), 'FokoCar', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Nogueira', 'Avenida Piraporinha, 652', '1140710000', '1140710000', 'contato@fokocar.com.br', 'manual_google', true, 'fokocar-diadema', 'automoveis', 'https://www.fokocardiadema.com.br', null),
  (gen_random_uuid(), 'Auto Piraporinha', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Nogueira', 'Avenida Piraporinha, 1792', '1140750000', '1140750000', 'contato@autopiraporinha.com.br', 'manual_google', true, 'auto-piraporinha-diadema', 'automoveis', null, null),
  (gen_random_uuid(), 'DiadCar Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Sete de Setembro, 500', '1140560000', '1140560000', 'contato@diadcar.com.br', 'manual_google', true, 'diadcar-veiculos-diadema', 'automoveis', null, null),
  (gen_random_uuid(), 'Lamarq Veículos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Alda, 500', '1140550000', '1140550000', 'contato@lamarq.com.br', 'manual_google', true, 'lamarq-veiculos-diadema', 'automoveis', null, null)
ON CONFLICT (slug) DO NOTHING;
