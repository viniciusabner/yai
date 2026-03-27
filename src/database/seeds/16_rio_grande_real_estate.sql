-- Seed: Rio Grande da Serra (and Ribeirão Pires) Real Estate Agencies

-- 1. Eduardo Imóveis (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Eduardo Imóveis',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'imobiliaria',
    'Centro',
    'Rua Agostinho Cardoso, 105',
    '1148213222',
    '1148213222',
    'contato@eduardoimoveis.com.br',
    'http://www.eduardoimoveis.com.br',
    'eduardo-imoveis-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 2. Genivaldo Batista Corretor (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Genivaldo Batista Corretor',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'imobiliaria',
    'Centro',
    'Rua Prefeito Carlos Jose Carlson, 100',
    '1148201512',
    '11971254257',
    'contato@gbatistacorretor.com.br',
    'https://www.gbatistacorretordeimoveis.com.br',
    'genivaldo-batista-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 3. SKR Negócios Imobiliários (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'SKR Negócios Imobiliários',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'imobiliaria',
    'Vila Figueiredo',
    'Rio Grande da Serra - SP',
    '1145147933',
    '11940276478',
    'skrnegocios@yahoo.com.br',
    'http://www.skrimoveis.com.br',
    'skr-negocios-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 4. Imóveis Monteiro (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Imóveis Monteiro',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'imobiliaria',
    'Centro',
    'Rio Grande da Serra - SP',
    '11971976087',
    '11971976087',
    'contato@imoveismonteiro.com.br',
    'https://www.imoveismonteiro.com.br',
    'imoveis-monteiro-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 5. Nova Reluz Imóveis (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Nova Reluz Imóveis',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'imobiliaria',
    'Ouro Fino Paulista',
    'Rodovia SP-031, 2008',
    '1148222405',
    '1148222405',
    'contato@novareluz.com.br',
    'https://www.novareluznegocios.com.br',
    'nova-reluz-imoveis-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 6. Efraim Imóveis (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Efraim Imóveis',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'imobiliaria',
    'Centro',
    'Rua Miguel Prisco, 566',
    '11972441922',
    '11972441922',
    'efraimdespachanteimobiliario@gmail.com',
    'https://www.efraimimoveis.com.br',
    'efraim-imoveis-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 7. Idealiza Imóveis (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Idealiza Imóveis',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'imobiliaria',
    'Centro Alto',
    'Rua Presidente Bernardes, 28',
    '1148246875',
    '11996646717',
    'contato@idealizaimoveis.com.br',
    'https://www.idealizaimoveis.com.br',
    'idealiza-imoveis-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 8. Medieval Imóveis (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Medieval Imóveis',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'imobiliaria',
    'Centro',
    'Avenida Fortuna, 69',
    '1148277214',
    '11997277214',
    'medieval@medievalimoveis.com.br',
    'https://www.medievalimoveis.com.br',
    'medieval-imoveis-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 9. Fortuna Imóveis (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Fortuna Imóveis',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'imobiliaria',
    'Centro',
    'Avenida Fortuna, 101',
    '1148255800',
    '1148255800',
    'contato@fortunaimovel.com.br',
    'https://www.fortunaimovel.com.br',
    'fortuna-imoveis-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 10. RE/MAX Trentina (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'RE/MAX Trentina',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'imobiliaria',
    'Centro',
    'Rua Miguel Prisco, 42',
    '1148283503',
    '1148283503',
    'trentina@remax.com.br',
    'https://www.remax.com.br',
    'remax-trentina-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;
