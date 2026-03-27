-- Inserção de Serralheiros (Estruturas Metálicas) em Mauá (Dados Reais)
-- Cidade: Mauá
-- Categoria: Buscada via Subquery (Serralheiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'serralheiro')
  OR slug LIKE '%-maua' AND category = 'serralheiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'serralheiro')
  OR slug LIKE '%-maua' AND category = 'serralheiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'serralheiro')
OR slug LIKE '%-maua' AND category = 'serralheiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'deea4440-e127-48d1-b771-c916ec9d35a1', 
  'D Ferro Goval', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá - SP',
  '11988420026', 
  '1140481040',
  NULL, 
  NULL, 
  true, 
  'd-ferro-goval-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '2dd76b58-fcb0-4364-aace-0de2644125ea', 
  'Serralheria Bronzatti', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Rua João, 2120',
  '1145552886', 
  '1145552886',
  NULL, 
  NULL, 
  true, 
  'serralheria-bronzatti-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '2a787d41-a86a-4571-9cc4-0aaa38af5832', 
  'Alemão Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Bela Vista', 
  'R. Natal Bagnara, 97',
  '1145782699', 
  '1145782699',
  NULL, 
  NULL, 
  true, 
  'alemão-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '29bc3f4c-9b85-433f-b19a-65f9b594fa6b', 
  'Alltec Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Mauá', 
  'Av. Barão de Mauá, 2599',
  '1145764479', 
  '1145764479',
  NULL, 
  NULL, 
  true, 
  'alltec-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '95828d2d-eece-41d8-bbaa-4f944add69d4', 
  'Arte em Ferro Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Av. Itapark - RP10',
  '1145450542', 
  '1145450542',
  NULL, 
  NULL, 
  true, 
  'arte-em-ferro-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '5e85098f-42b7-4090-b8e1-5b0007fb8110', 
  'Casa do Serralheiro', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Parque das Américas', 
  'R. Guatemala, 85',
  '1145472955', 
  '1145472955',
  NULL, 
  NULL, 
  true, 
  'casa-do-serralheiro-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'af5776e0-e44e-4332-8db5-767c61eca8e3', 
  'Serralheria Decom', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Av. Pres. Castelo Branco, 828',
  '1128834341', 
  '1128834341',
  NULL, 
  NULL, 
  true, 
  'serralheria-decom-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'cba8de2d-8fef-43bf-bd52-f447bcbc1a28', 
  'DJN Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Parque Bandeirantes', 
  'Rua João Carlos Azevedo, 1332',
  '1127621411', 
  '1127621411',
  NULL, 
  NULL, 
  true, 
  'djn-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '41046790-0629-4130-9c93-0732a9f8a797', 
  'EPM Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Esperança', 
  'R. Elza Jorge, 1212',
  '11986254798', 
  '11986254798',
  NULL, 
  NULL, 
  true, 
  'epm-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'f907408c-ff09-4d47-a16c-63b15775ed4f', 
  'Serralheria Liliane', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Núcleo Sampaio Vidal', 
  'Estrada do Carneiro, 1954',
  '11947959753', 
  '11947959753',
  NULL, 
  NULL, 
  true, 
  'serralheria-liliane-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'e1c0a181-d394-4a70-96d9-e2c2d892b55f', 
  'Serralheria do Beto', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Mauá', 
  'Rua Carlos Campos, 326',
  '1137137711', 
  '1137137711',
  NULL, 
  NULL, 
  true, 
  'serralheria-do-beto-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '720923dc-3957-492d-bc6e-9f064163f0d8', 
  'Serralheria Bom Preço', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Av. Presidente Castelo Branco, 2220',
  '1145162659', 
  '1145162659',
  NULL, 
  NULL, 
  true, 
  'serralheria-bom-preço-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'f655c679-e473-4d84-a8e2-fde408891f5a', 
  'Gilson Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '11943434827', 
  '11943434827',
  NULL, 
  NULL, 
  true, 
  'gilson-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'e318c761-9e3c-4fbc-a2ba-7a4cf36f4c9c', 
  'Inovart Comunicação visual e serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '11973044543', 
  '11973044543',
  NULL, 
  NULL, 
  true, 
  'inovart-comunicação-visual-e-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '82dd8843-554c-46d5-9456-68736a4c24d0', 
  'Je Global', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '1145492315', 
  '1145492315',
  NULL, 
  NULL, 
  true, 
  'je-global-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '7492e4c9-f56a-4c5b-9fbf-484fa4ccdfb7', 
  'Jl Serralherias', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '1145134914', 
  '1145134914',
  NULL, 
  NULL, 
  true, 
  'jl-serralherias-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '256beb7a-3553-41b7-8695-3a1933857f66', 
  'Kaynan Montagem', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '1145783520', 
  '1145783520',
  NULL, 
  NULL, 
  true, 
  'kaynan-montagem-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '41f74f6a-9330-41f8-b8ec-8ab3267611b9', 
  'D&S Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '11972320160', 
  '11972320160',
  NULL, 
  NULL, 
  true, 
  'ds-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '36266261-435d-4301-b70d-b4dcd03aa48a', 
  'Luks Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Mauá', 
  'Rua Antônio Matrone, 463',
  '1128669889', 
  '1128669889',
  NULL, 
  NULL, 
  true, 
  'luks-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '6cd56649-5cc6-4dbd-8118-3b32dcb9f874', 
  'Mediarts', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '11977497930', 
  '11977497930',
  NULL, 
  NULL, 
  true, 
  'mediarts-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '8a4cf13f-1865-4f41-b918-668ed68c5dc2', 
  'Polymaj Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '1145772778', 
  '1145772778',
  NULL, 
  NULL, 
  true, 
  'polymaj-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'a9c74929-d1a6-4f84-9d34-4dbc82932f00', 
  'Presil Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Magini', 
  'Avenida Washington Luiz, 2631',
  '1145162890', 
  '1145162890',
  NULL, 
  NULL, 
  true, 
  'presil-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'b3228729-eca2-4dd4-a9ba-2094222a4778', 
  'Serra Ports GM', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Alto do Boa Vista', 
  'Avenida Jair Balo, 34',
  '1145443433', 
  '1145443433',
  NULL, 
  NULL, 
  true, 
  'serra-ports-gm-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '55516f9d-3b72-4ed8-83dd-6f6d1bb0bdfb', 
  'Serralheria Pontes', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Mauá, SP',
  '1145161177', 
  '1145161177',
  NULL, 
  NULL, 
  true, 
  'serralheria-pontes-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '2a8e1dbd-0118-4e62-8c2d-4c94fed5d46d', 
  'Serralheria Juliana', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Mauá, SP',
  '1145454620', 
  '1145454620',
  NULL, 
  NULL, 
  true, 
  'serralheria-juliana-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '39dd93f3-aa73-4882-8462-d13210f9b2bf', 
  'Serralheria G H T', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Mauá, SP',
  '1144546760', 
  '1144546760',
  NULL, 
  NULL, 
  true, 
  'serralheria-g-h-t-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '55c523dc-b0bf-4f97-9e07-57a058ee26c2', 
  'Serralheria Lucas', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Mauá, SP',
  '1145455583', 
  '1145455583',
  NULL, 
  NULL, 
  true, 
  'serralheria-lucas-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'c9efcf6f-3a27-4f67-8a05-8c8369d7b614', 
  'Serralheria Trinca Ferro', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Mauá, SP',
  '1145417998', 
  '1145417998',
  NULL, 
  NULL, 
  true, 
  'serralheria-trinca-ferro-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '34339cc4-9516-46aa-b272-79c2fb5aea1a', 
  'Godefer Portões Automáticos', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Mauá, SP',
  '1145413010', 
  '1145413010',
  NULL, 
  NULL, 
  true, 
  'godefer-portões-automáticos-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'd4e4ec75-08a5-4c65-b70e-5e3a1527ae79', 
  'Serralheria João Carlos', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Zaira', 
  'Mauá, SP',
  '1145146099', 
  '1145146099',
  NULL, 
  NULL, 
  true, 
  'serralheria-joão-carlos-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '2ea7003d-39ae-4f87-8924-12fade04051d', 
  'Tecfer Serralheria Artística', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Parque São Vicente', 
  'R Arthur da Costa e Silva, 235',
  '1145552899', 
  '1145552899',
  NULL, 
  NULL, 
  true, 
  'tecfer-serralheria-artística-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'c331844a-92d0-4c6b-92f6-37909f99256c', 
  'Serralheria Canaã', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Parque São Vicente', 
  'R. Pres. Venceslau Braz, 64',
  '11950357032', 
  '11950357032',
  NULL, 
  NULL, 
  true, 
  'serralheria-canaã-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '5f670c3d-039e-4597-94bc-b08179746505', 
  'S.R. Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Parque São Vicente', 
  'R. Pres. Carlos Luz, 177',
  '1128019744', 
  '1128019744',
  NULL, 
  NULL, 
  true, 
  'sr-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '8160e8b6-8f23-44e1-9faa-5472a10a94d9', 
  'Serralheria J.J.N.M.', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Magini', 
  'Mauá, SP',
  '1145430799', 
  '1145430799',
  NULL, 
  NULL, 
  true, 
  'serralheria-jjnm-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  'a4c0507d-88c0-47d4-ab54-0723fa071846', 
  'MB Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Magini', 
  'Mauá, SP',
  '11959891040', 
  '11959891040',
  NULL, 
  NULL, 
  true, 
  'mb-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
  '760dff34-2f2a-405a-9e4c-eea4b5b4e9d9', 
  'Assis Inox Serralheria', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Magini', 
  'Mauá, SP',
  '11997992112', 
  '11997992112',
  NULL, 
  NULL, 
  true, 
  'assis-inox-serralheria-maua',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Mauá', 
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
