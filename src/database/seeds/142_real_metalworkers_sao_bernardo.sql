-- Inserção de Serralheiros (Estruturas Metálicas) em São Bernardo do Campo (Dados Reais)
-- Cidade: São Bernardo do Campo
-- Categoria: Buscada via Subquery (Serralheiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'serralheiro')
  OR slug LIKE '%-sao-bernardo' AND category = 'serralheiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'serralheiro')
  OR slug LIKE '%-sao-bernardo' AND category = 'serralheiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'serralheiro')
OR slug LIKE '%-sao-bernardo' AND category = 'serralheiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '70b977f1-43ff-4769-957a-49fabf76ac5c', 
  'Pivotec Serralheria SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11972871085', 
  '1142386477',
  NULL, 
  NULL, 
  true, 
  'pivotec-serralheria-sbc-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'b8d0cad3-8325-4bcb-ba42-3ad765e16672', 
  'Serralheria Elifer', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Paulicéia', 
  'Av. Humberto de Alencar Castelo Branco, 829',
  '11996596833', 
  '1143926500',
  NULL, 
  NULL, 
  true, 
  'serralheria-elifer-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'e71a6d02-3b9a-4eab-9776-1496a44aeeb5', 
  'SBC Portões', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11934737601', 
  '1143415264',
  NULL, 
  NULL, 
  true, 
  'sbc-portões-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'ba9271db-8769-416d-9695-0ebe573856ca', 
  'Acd Chapas', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Paulicéia', 
  'Avenida, 562 - Terreoparte',
  '1145437800', 
  '1145437800',
  NULL, 
  NULL, 
  true, 
  'acd-chapas-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'b9445201-9bc3-4aca-bda8-ac1a2b83d50a', 
  'A D Alves Sousa Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Assunção', 
  'Estrada Casas, 4170',
  '1143365033', 
  '1143365033',
  NULL, 
  NULL, 
  true, 
  'a-d-alves-sousa-serralheria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'e415963d-91b3-44df-aff0-feae459c1884', 
  'AF Técnica Serralheria Industrial', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Alves Dias', 
  'Av. Osvaldo Fregonezi, 284',
  '1143566156', 
  '1143566156',
  NULL, 
  NULL, 
  true, 
  'af-técnica-serralheria-industrial-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '6a64e01c-0ca4-4f15-a04f-82e50b7633c1', 
  'Aev Serralheria e Engenharia', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Demarchi', 
  'Rua Maximiliano Demarchi, 490',
  '1143962000', 
  '1143962000',
  NULL, 
  NULL, 
  true, 
  'aev-serralheria-e-engenharia-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'd38c8ccd-f5ed-4ab1-9079-9dcdcb6b61f1', 
  'Ampla Serralheria & Vidraçaria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Claudia', 
  'Estrada dos Alvarengas, 2861',
  '1143563884', 
  '1143563884',
  NULL, 
  NULL, 
  true, 
  'ampla-serralheria-vidraçaria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '3c2413ac-555a-4764-9a44-9be46d8988c6', 
  'Artal Serralheria Artística', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Parque Selecta', 
  'Rua Vicente Paschoaletti, 525',
  '1141274878', 
  '1141274878',
  NULL, 
  NULL, 
  true, 
  'artal-serralheria-artística-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '642d40f5-c640-4c31-bea3-8916c763d484', 
  'Artécnica Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Anchieta', 
  'Av. Senador Vergueiro, 2519',
  '1143622363', 
  '1143622363',
  NULL, 
  NULL, 
  true, 
  'artécnica-serralheria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '64a3ee0a-6e4a-4d4a-a108-95f3d7820a95', 
  'Belle Vision Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Claudia', 
  'Avenida Orestes Romano, 283',
  '1143513556', 
  '1143513556',
  NULL, 
  NULL, 
  true, 
  'belle-vision-serralheria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'a0441dd6-830a-4c1d-819e-8bc2f8446397', 
  'Elias J da Silva Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santa Terezinha', 
  'Rua Papa Paulo VI, 69',
  '1144885543', 
  '1144885543',
  NULL, 
  NULL, 
  true, 
  'elias-j-da-silva-serralheria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'b17d30b4-90b4-4e3f-8c55-54e268be7a10', 
  'Serralheria Lira', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Anita', 
  'Rua Quinze de Novembro, 14',
  '1143451599', 
  '1143451599',
  NULL, 
  NULL, 
  true, 
  'serralheria-lira-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'ea3dd003-34b1-4728-b53c-e8e1e357868d', 
  'Serralheria Palermo', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Jardim Atlântico', 
  'Av Luiz Pequini, 802',
  '1143359567', 
  '1143359567',
  NULL, 
  NULL, 
  true, 
  'serralheria-palermo-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'c875557b-9658-42ec-8ada-2250317f0957', 
  'Serralheria Riacho', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Rio Grande', 
  'Estr. Simão Portela, 180',
  '11985163942', 
  '11953585715',
  NULL, 
  NULL, 
  true, 
  'serralheria-riacho-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'd808a88b-1d4e-4246-9c7f-cb20dbf26edd', 
  'Serralheria Vianas', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Tupi', 
  'Rua Aimorés, 4',
  '11991381814', 
  '1141250299',
  NULL, 
  NULL, 
  true, 
  'serralheria-vianas-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '7b3320da-1550-440f-8566-73a1e33dc913', 
  'Serralheria Tibirica', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Rudge Ramos', 
  'R. Tibiriçá, 444',
  '1143688044', 
  '1143688044',
  NULL, 
  NULL, 
  true, 
  'serralheria-tibirica-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'b717b54c-a97a-4cc5-9897-875ebd268764', 
  'Serralheria Artística Alvefer', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Rudge Ramos', 
  'Av. Dr. Rudge Ramos, 738',
  '1127130315', 
  '1127130315',
  NULL, 
  NULL, 
  true, 
  'serralheria-artística-alvefer-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '5e45361e-6df3-46eb-88de-c246d004cef9', 
  'Dimensão Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Pauliceia', 
  'Rua Francisco Alves, 220',
  '1140434100', 
  '1140434100',
  NULL, 
  NULL, 
  true, 
  'dimensão-serralheria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '4b951b8c-1cdc-41a7-8db6-76b78f876506', 
  'Serralheria Solo Brasileiro', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Baeta Neves', 
  'São Bernardo do Campo, SP',
  '11959032587', 
  '11959032587',
  NULL, 
  NULL, 
  true, 
  'serralheria-solo-brasileiro-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '74326207-22bc-4a4b-bd7c-62345a40d13e', 
  'Serralheria Paiva', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Baeta Neves', 
  'São Bernardo do Campo, SP',
  '1141257892', 
  '1141257892',
  NULL, 
  NULL, 
  true, 
  'serralheria-paiva-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '76536249-3c21-46b5-a776-15d35e59f65a', 
  'Serralheria Osmar Paiva', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Baeta Neves', 
  'R. Campos do Jordão, 109',
  '11973340411', 
  '11973340411',
  NULL, 
  NULL, 
  true, 
  'serralheria-osmar-paiva-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'dde32808-66ff-4256-aecc-4ee2dd7274ac', 
  'Serralheria Obras e Artes', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Assunção', 
  'São Bernardo do Campo, SP',
  '1128964170', 
  '1128964170',
  NULL, 
  NULL, 
  true, 
  'serralheria-obras-e-artes-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '65fd2fbc-bfc3-47c2-ba9a-34b8b37435c2', 
  'Serralheria JSN Alvarenga', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Assunção', 
  'Estr. dos Alvarengas, 9557 B',
  '11987687100', 
  '11987687100',
  NULL, 
  NULL, 
  true, 
  'serralheria-jsn-alvarenga-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '8dfaafed-5541-464b-a588-680e3ca7aeb7', 
  'Serralheria JSA', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Marchi', 
  'São Bernardo do Campo, SP',
  '11969415576', 
  '1127514404',
  NULL, 
  NULL, 
  true, 
  'serralheria-jsa-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '4ee6a5ba-bdb8-4e92-baa2-82bfe4e43eb9', 
  'MSN Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Marchi', 
  'São Bernardo do Campo, SP',
  '11942639834', 
  '11942639834',
  NULL, 
  NULL, 
  true, 
  'msn-serralheria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '30699294-d60e-4adc-a1dc-a64fe5f19612', 
  'Nildo Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Vila Marchi', 
  'São Bernardo do Campo, SP',
  '11965761573', 
  '11965761573',
  NULL, 
  NULL, 
  true, 
  'nildo-serralheria-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '749b75b9-c9cb-4909-bdbb-5b1cd09ace15', 
  'Vidraçaria e Serralheria Assunção', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Assunção', 
  'São Bernardo do Campo, SP',
  '1143510000', 
  '1143510000',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-e-serralheria-assunção-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  '8ea74f57-066e-4c31-988e-47d442cc0e1b', 
  'Metalúrgica SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141270000', 
  '1141270000',
  NULL, 
  NULL, 
  true, 
  'metalúrgica-sbc-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
  'bd03e609-4396-4460-b406-1c0c34a921c7', 
  'Serralheria Rudge Ramos', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Rudge Ramos', 
  'São Bernardo do Campo, SP',
  '1143680000', 
  '1143680000',
  NULL, 
  NULL, 
  true, 
  'serralheria-rudge-ramos-sao-bernardo',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Bernardo do Campo', 
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
