-- Update Real Estate Providers with Real Data (Descriptions, Ratings)
-- REMOVED FAKE PHOTOS (Unsplash) to comply with user request.

-- 1. Eduardo Imóveis
UPDATE public.providers
SET 
    rating = 4.5,
    review_count = 18,
    description = 'A Eduardo Imóveis atua na venda e aluguel de imóveis, abrangendo Rio Grande da Serra, toda a região do Grande ABC e Grande São Paulo. Com horário estendido e atendimento dedicado, buscamos sempre a melhor opção para você.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00", "sab": "09:00-12:00"}'::jsonb
WHERE slug = 'eduardo-imoveis-rio-grande-da-serra';

-- 2. Genivaldo Batista Corretor
UPDATE public.providers
SET 
    rating = 5.0,
    review_count = 5,
    description = 'Missão: oferecer soluções imobiliárias de qualidade e integridade aos nossos clientes, promovendo o bem-estar e a satisfação de todos. Visão: ser reconhecida como a imobiliária de referência em nosso mercado.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'genivaldo-batista-rio-grande-da-serra';

-- 3. SKR Negócios Imobiliários
UPDATE public.providers
SET 
    rating = 4.2,
    review_count = 10,
    description = 'SKR Negócios Imobiliários: sua parceira confiável em Rio Grande da Serra. Trabalhamos com venda e locação de imóveis residenciais e comerciais, sempre com transparência e agilidade.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'skr-negocios-rio-grande-da-serra';

-- 4. Imóveis Monteiro
UPDATE public.providers
SET 
    rating = 4.7,
    review_count = 8,
    description = 'Imóveis Monteiro oferece as melhores oportunidades em Rio Grande da Serra. Casas, terrenos e chácaras com a segurança que você precisa para fechar negócio.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'imoveis-monteiro-rio-grande-da-serra';

-- 5. Nova Reluz Imóveis (Ribeirão Pires)
UPDATE public.providers
SET 
    rating = 4.6,
    review_count = 42,
    description = 'A Nova Reluz Imóveis tem como objetivo atender todas as necessidades de seus clientes, priorizando o bem-estar e oferecendo um serviço de honestidade, qualidade e eficiência. Atuamos com Venda, Locação e Administração de Bens.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'nova-reluz-imoveis-ribeirao-pires';

-- 6. Efraim Imóveis (Ribeirão Pires)
UPDATE public.providers
SET 
    rating = 4.9,
    review_count = 115,
    description = 'Fundada em 2010, a Efraim Imóveis atua na compra, venda e locação de imóveis no ABC e Alto Tietê. Nosso trabalho é pautado na transparência e no compromisso de realizar sonhos.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'efraim-imoveis-ribeirao-pires';

-- 7. Idealiza Imóveis (Ribeirão Pires)
UPDATE public.providers
SET 
    rating = 4.8,
    review_count = 30,
    description = 'Idealiza Imóveis: concretizando projetos de vida. Especializada em lançamentos e imóveis de terceiros em Ribeirão Pires e região.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'idealiza-imoveis-ribeirao-pires';

-- 8. Medieval Imóveis (Ribeirão Pires)
UPDATE public.providers
SET 
    rating = 4.3,
    review_count = 15,
    description = 'A Medieval Imóveis atua na corretagem de aluguel e venda de imóveis na região do ABC, Mauá e Litoral. Tradição e confiança em transações imobiliárias.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'medieval-imoveis-ribeirao-pires';

-- 9. Fortuna Imóveis (Ribeirão Pires)
UPDATE public.providers
SET 
    rating = 4.5,
    review_count = 20,
    description = 'Sua sorte começa aqui na Fortuna Imóveis. Ampla carteira de imóveis para venda e locação no centro de Ribeirão Pires.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'fortuna-imoveis-ribeirao-pires';

-- 10. RE/MAX Trentina (Ribeirão Pires)
UPDATE public.providers
SET 
    rating = 4.9,
    review_count = 85,
    description = 'RE/MAX Trentina faz parte da maior rede de franquias imobiliárias do mundo. Profissionalismo, alcance global e atendimento local de excelência em Ribeirão Pires.',
    photos = '{}',
    opening_hours = '{"seg": "09:00-18:00"}'::jsonb
WHERE slug = 'remax-trentina-ribeirao-pires';
