-- Inserção de Técnicos em Ar Condicionado em São Bernardo do Campo (Dados Reais)
-- Cidade: São Bernardo do Campo
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-sao-bernardo' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-sao-bernardo' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-sao-bernardo' AND category = 'tecnico_ar_condicionado';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '94909d75-48ca-474d-aea0-a59532a3b2d6', 
  'Grupo Horvath Ar', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Vila Gonçalves', 
  'São Bernardo do Campo, SP',
  '1127864264', 
  '1127864264',
  NULL, 
  NULL, 
  true, 
  'grupo-horvath-ar-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '2bd4b92a-9499-4ee9-b6e3-ff2f91308f7e', 
  'Armadri Refrigeração', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rua Penha, 4',
  '1141224792', 
  '1141224792',
  NULL, 
  NULL, 
  true, 
  'armadri-refrigeração-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '1b333bc2-6420-4048-8e56-b886cd37dfab', 
  'Futura Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Assunção', 
  'Rua Herbert Souza, 173',
  '1143428129', 
  '1143428129',
  NULL, 
  NULL, 
  true, 
  'futura-ar-condicionado-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '7ac38953-14bc-463e-bf2c-276c01e017a6', 
  'Ice Air Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Rudge Ramos', 
  'Rua Dr. Gabriel Nicolau, 565',
  '1143622006', 
  '1143622006',
  NULL, 
  NULL, 
  true, 
  'ice-air-ar-condicionado-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'a3948897-863f-43e3-ac4b-988415883317', 
  'Plimapec Comércio Manutenção', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Rudge Ramos', 
  'Rua José Aníbal Colleoni, 130',
  '1143673361', 
  '1143673361',
  NULL, 
  NULL, 
  true, 
  'plimapec-comércio-manutenção-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '0d626d1d-4cc6-421e-be09-5a0a1140768a', 
  'RF Refrigeração', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Alvarenga', 
  'Estrada Alvarengas, 2933',
  '1141043674', 
  '1141043674',
  NULL, 
  NULL, 
  true, 
  'rf-refrigeração-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '6fc2a5d3-864c-4d11-93a7-9c71f53d856e', 
  'Técnico Ar-Condicionado SBC Carrier', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11962311982', 
  '1136443392',
  NULL, 
  NULL, 
  true, 
  'técnico-arcondicionado-sbc-carrier-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '744656fc-e338-4a15-8da5-5692eceb5fd8', 
  'H-AR SOLUÇÕES', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11942055738', 
  '11942055738',
  NULL, 
  NULL, 
  true, 
  'har-soluções-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '9c7f69f2-8cb2-4fcd-a5fb-d8088f03acb4', 
  'Tempo Bom Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Rudge Ramos', 
  'Rua Pirapitingui, 108',
  '11940079379', 
  '1143528727',
  NULL, 
  NULL, 
  true, 
  'tempo-bom-ar-condicionado-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '693ce52d-7b41-4c69-a5fd-38684bb58e40', 
  'Gelar SP', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11942500551', 
  '11942500551',
  NULL, 
  NULL, 
  true, 
  'gelar-sp-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '2fddb729-9ddf-4146-a3b7-7ee79d97e904', 
  'AG Climatização SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11954000706', 
  '1127049942',
  NULL, 
  NULL, 
  true, 
  'ag-climatização-sbc-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'fb29a025-ef00-4410-99c7-f11e7535344a', 
  'Refrigeração Banfrio', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Baeta Neves', 
  'Rua dos Americanos, 120/124',
  '11989211833', 
  '1141224499',
  NULL, 
  NULL, 
  true, 
  'refrigeração-banfrio-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'd4629cf3-133c-4499-988c-f45a72c7e9ad', 
  'Bagertech Instalação e Manutenção', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Assunção', 
  'São Bernardo do Campo, SP',
  '1142352750', 
  '1142352750',
  NULL, 
  NULL, 
  true, 
  'bagertech-instalação-e-manutenção-sao-bernardo',
  'Serviços e instalações de Ar Condicionado e Climatização em São Bernardo do Campo', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating,
  address = EXCLUDED.address,
  neighborhood = EXCLUDED.neighborhood;
