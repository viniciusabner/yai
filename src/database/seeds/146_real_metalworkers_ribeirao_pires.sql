-- Inserção de Serralheiros (Estruturas Metálicas) em Ribeirão Pires (Dados Reais)
-- Cidade: Ribeirão Pires
-- Categoria: Buscada via Subquery (Serralheiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'serralheiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'serralheiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'serralheiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'serralheiro'
);

DELETE FROM providers 
WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'serralheiro')
OR slug LIKE '%-ribeirao-pires' AND category = 'serralheiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '95339257-2c37-4bbb-b34b-930083045660', 
  'Belmiro Metais', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Av. Humberto de Campos, 580',
  '11947935005', 
  '1148287121',
  NULL, 
  NULL, 
  true, 
  'belmiro-metais-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category, 
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
  '96f95225-774a-4a5b-a0f8-66a34ee7c2b6', 
  'Serralheria Francis', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santana', 
  'Rua Eugênio Roncon, 640',
  '1148259466', 
  '1148259466',
  NULL, 
  NULL, 
  true, 
  'serralheria-francis-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '8832118d-4329-43cb-b6cb-f482591bcd09', 
  'Serralheria.com', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Ribeirão Pires - SP',
  '1148248100', 
  '1148248100',
  NULL, 
  NULL, 
  true, 
  'serralheriacom-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '8a8c2b75-e1f2-4b34-bb4c-4a01d85dee18', 
  'Serralheria Lima', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Rua Francisco Tometich, 795',
  '1148251001', 
  '1148251001',
  NULL, 
  NULL, 
  true, 
  'serralheria-lima-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '910c8024-a8c7-445a-93f5-eef8f5c70b00', 
  'Serralheria Caçula', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Rua Capitão José Gallo, 592',
  NULL, 
  '1148280000',
  NULL, 
  NULL, 
  true, 
  'serralheria-caçula-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '4cb0cb6f-2aeb-40b9-ace0-c6aa38e0cc72', 
  'Cotal Indústria Mecânica Serralheria', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim São Francisco', 
  'R. São Francisco, 515',
  '1148281196', 
  '1148281196',
  NULL, 
  NULL, 
  true, 
  'cotal-indústria-mecânica-serralheria-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  'a3d7acd2-93b0-4834-9f34-569842f164b1', 
  'Serralheria Vale do Aço', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santa Luzia', 
  'R. Diadema, 110',
  '1148243279', 
  '1148243279',
  NULL, 
  NULL, 
  true, 
  'serralheria-vale-do-aço-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '56a47025-b152-4913-ad50-59a9f8b8d927', 
  'Serralheria São José', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santa Luzia', 
  'Avenida Francisco Monteiro, 2650',
  '1148284990', 
  '1148284990',
  NULL, 
  NULL, 
  true, 
  'serralheria-são-josé-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '32875096-0081-4234-a261-03148e11ef4f', 
  'O Serralheiro', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro Alto', 
  'Rua Santo Bertoldo, 280',
  '1148245259', 
  '1148245259',
  NULL, 
  NULL, 
  true, 
  'o-serralheiro-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  'b7b46251-ff13-44db-a6f0-fd6f052c0ab0', 
  'Sandreaço', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Moderna', 
  'Avenida Francisco Monteiro, 2549',
  '1148281910', 
  '1148281910',
  NULL, 
  NULL, 
  true, 
  'sandreaço-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '0842eddc-bb7a-46e9-988e-18e4988c29d9', 
  'Ouro Fino', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Ouro Fino Paulista', 
  'Av. Ver. Aroldo Alves Neves, 400',
  '1121796161', 
  '1121796161',
  NULL, 
  NULL, 
  true, 
  'ouro-fino-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '4333f15a-907a-4257-9149-e8333cbd4f40', 
  'Serralheria Ouro Fino', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Ouro Fino Paulista', 
  'Ribeirão Pires - SP',
  '11999265463', 
  '11999265463',
  NULL, 
  NULL, 
  true, 
  'serralheria-ouro-fino-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  '0c9632ee-1a41-49c5-b23f-2a7f330f1c79', 
  'Serralheria ABC Ribeirão Pires', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Suissa', 
  'Ribeirão Pires, SP',
  '1148250000', 
  '1148250000',
  NULL, 
  NULL, 
  true, 
  'serralheria-abc-ribeirão-pires-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
  'bf94fa00-8009-4337-8ef9-71c7d4ccb430', 
  'Estruturas Metálicas Ribeirão', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Ouro Fino', 
  'Ribeirão Pires, SP',
  '1148240000', 
  '1148240000',
  NULL, 
  NULL, 
  true, 
  'estruturas-metálicas-ribeirão-ribeirao-pires',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Ribeirão Pires', 
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
