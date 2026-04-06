-- 24. Insert Construction and Repairs Providers (Rio Grande da Serra)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Pedreiros / Reformas
  (gen_random_uuid(), 'LJM Construção', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Rio Grande da Serra', 'Região Metropolitana SP', '5511999999999', '5511999999999', null, 'manual_google', true, 'ljm-construcao-rio-grande-da-serra', 'pedreiro', 'https://www.ljmconstrucoes.com.br', null)
  -- Nota: Rio Grande da Serra tem poucos prestadores específicos online, mas muitos de Ribeirão Pires e Mauá atendem a região.
ON CONFLICT (slug) DO NOTHING;
