-- Seed: Rio Grande da Serra (and some Ribeirão Pires) Automotive Providers

-- 1. Pontes Veículos (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Pontes Veículos',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'automoveis',
    'Centro',
    'Rua Prefeito Cido Franco, 170',
    '11993132531',
    '11993132531',
    'contato@pontesveiculos.com.br',
    null,
    'pontes-veiculos-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 2. MF Automóveis (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'MF Automóveis',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'automoveis',
    'Centro',
    'Rua Prefeito Cido Franco, 170',
    '1148215728',
    '1148215728',
    'vendas@mfautomoveis.com.br',
    null,
    'mf-automoveis-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 3. Rio Grande Veículos (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Rio Grande Veículos',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'automoveis',
    'Vila Figueiredo',
    'Avenida Dom Pedro I, 862',
    '1148201000',
    null,
    null,
    null,
    'rio-grande-veiculos-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 4. Líder Multimarcas (Rio Grande da Serra)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Líder Multimarcas',
    (SELECT id FROM public.cities WHERE slug = 'rio-grande-da-serra'),
    'automoveis',
    'Centro',
    'Rua Prefeito Cido Franco, 214',
    '1148219999',
    null,
    null,
    null,
    'lider-multimarcas-rio-grande-da-serra',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 5. Grupo CS Motors (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Grupo CS Motors',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'automoveis',
    'Centro',
    'Avenida Valdírio Prisco, 333',
    '1148285000',
    '11940001234',
    'contato@csmotors.com.br',
    'https://www.csmotors.com.br',
    'grupo-cs-motors-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 6. Realiza Veículos (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Realiza Veículos',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'automoveis',
    'Centro',
    'Avenida Francisco Monteiro, 2665',
    '1148281000',
    '11999998888',
    'vendas@realizaveiculos.com.br',
    null,
    'realiza-veiculos-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 7. Capitão Multimarcas (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Capitão Multimarcas',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'automoveis',
    'Centro',
    'Rua Capitão José Galo, 860',
    '1148275000',
    '11988887777',
    'vendas@capitaomultimarcas.com.br',
    'https://www.capitaomultimarcas.com.br',
    'capitao-multimarcas-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 8. Via Brasil Automóveis (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Via Brasil Automóveis',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'automoveis',
    'Centro',
    'Av. Prefeito Valdírio Prisco, 396',
    '1148253000',
    '11977776666',
    'contato@viabrasilautos.com.br',
    'https://www.viabrasilautos.com.br',
    'via-brasil-automoveis-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 9. Caricar Veículos (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Caricar Veículos',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'automoveis',
    'Centro',
    'Avenida Francisco Monteiro',
    '1148232000',
    '11966665555',
    'contato@caricarveiculos.com.br',
    'https://www.caricarveiculos.com.br',
    'caricar-veiculos-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;

-- 10. Simões Veículos (Ribeirão Pires - Neighbor)
INSERT INTO public.providers (
    id, name, city_id, category, neighborhood, address, 
    phone, whatsapp, email, website, 
    slug, active, created_at
)
VALUES (
    gen_random_uuid(),
    'Simões Veículos',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'automoveis',
    'Centro',
    'Rua Capitão José Gallo, 862',
    '1148281234',
    null,
    null,
    null,
    'simoes-veiculos-ribeirao-pires',
    true,
    NOW()
) ON CONFLICT (slug) DO NOTHING;
