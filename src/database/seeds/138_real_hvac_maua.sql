-- Inserção de Técnicos em Ar Condicionado em Mauá (Dados Reais)
-- Cidade: Mauá
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-maua' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-maua' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-maua' AND category = 'tecnico_ar_condicionado';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '9d8209b8-7884-4613-86fa-0e125f41ccf6', 
  'ACW Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Vila Noêmia', 
  'Rua Dom José Gaspar, 1204',
  '11945046383', 
  '1131815453',
  NULL, 
  NULL, 
  true, 
  'acw-ar-condicionado-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '896a3387-cf57-4f54-af9b-2489a6cf1fc1', 
  'Samedi Refrigeração', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Parque das Américas', 
  'Rua San Juan, 92',
  '11993271408', 
  '1143099193',
  NULL, 
  NULL, 
  true, 
  'samedi-refrigeração-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '10f27618-a3dd-49a7-8e92-6cf1c4333149', 
  'Horvath Ar', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Mauá, SP',
  '11942055738', 
  '1142329960',
  NULL, 
  NULL, 
  true, 
  'horvath-ar-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '884d2c6a-471a-450a-91a3-bc30708f8115', 
  'DL Climatização', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Mauá, SP',
  '11965240944', 
  '11965240944',
  NULL, 
  NULL, 
  true, 
  'dl-climatização-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  'ef65a1ba-48b5-4ad5-8357-8951f4f956e5', 
  'AG Climatização', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Mauá, SP',
  '11954000706', 
  '1127049942',
  NULL, 
  NULL, 
  true, 
  'ag-climatização-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  'cb978097-acb2-41a0-9e7e-192c37aba1dd', 
  'Gelar SP', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Mauá, SP',
  '11942500551', 
  '11942500551',
  NULL, 
  NULL, 
  true, 
  'gelar-sp-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '0b17e043-7ebd-4baf-9cde-4ebc6eb2c615', 
  'Wf Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Vila Bocaina', 
  'R Campos Sales, 167',
  '1122281805', 
  '1122281805',
  NULL, 
  NULL, 
  true, 
  'wf-ar-condicionado-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '55d8c8d5-9f39-4b2e-a4b1-b135a893ea41', 
  'Voltecn Instalações e Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Vila Bocaina', 
  'R. Brás Cubas, 981',
  '11998588369', 
  '11998588369',
  NULL, 
  NULL, 
  true, 
  'voltecn-instalações-e-ar-condicionado-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  'a77656a4-c18b-40b3-a11f-48d6222f3ee1', 
  'M.D.K Refrigeração', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Parque São Vicente', 
  'Rua Marechal Deodoro da Fonseca, 580',
  '1134584566', 
  '1134584566',
  NULL, 
  NULL, 
  true, 
  'mdk-refrigeração-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '58baaf66-4b4b-4cec-ace7-3012f5c1972e', 
  'Refrigeracao Amorim', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Jardim Zaíra', 
  'Rua Dona Áurea Oliveira da Silva, 58',
  '1195325617', 
  '1195325617',
  NULL, 
  NULL, 
  true, 
  'refrigeracao-amorim-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '98df0ea7-e16f-4cf1-a0bd-a928c2ba7429', 
  'Multiar Mecânica e Ar condicionado', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Jardim Zaíra', 
  'Av. Pres. Castelo Branco, 614',
  '11973586482', 
  '11973586482',
  NULL, 
  NULL, 
  true, 
  'multiar-mecânica-e-ar-condicionado-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '8bca3b31-1bf4-4316-b7df-eaf8d2471f2c', 
  'Arcool Manutenção', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Mauá, SP',
  '11984454406', 
  '1152429354',
  NULL, 
  NULL, 
  true, 
  'arcool-manutenção-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  'e6c8b84e-c7ac-4ae4-9660-f51ffc096a08', 
  'ABC Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Mauá, SP',
  '1142385738', 
  '1142385738',
  NULL, 
  NULL, 
  true, 
  'abc-ar-condicionado-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
  '2ee01e1d-85e6-422f-9006-39c8a099bb70', 
  'TKL Serv', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Mauá, SP',
  '1126679940', 
  '1126679940',
  NULL, 
  NULL, 
  true, 
  'tkl-serv-maua',
  'Serviços e instalações de Ar Condicionado e Climatização em Mauá', 
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
