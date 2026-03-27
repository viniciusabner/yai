-- Inserção de Serralheiros (Estruturas Metálicas) em São Caetano do Sul (Dados Reais)
-- Cidade: São Caetano do Sul
-- Categoria: Buscada via Subquery (Serralheiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'serralheiro')
  OR slug LIKE '%-sao-caetano' AND category = 'serralheiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'serralheiro')
  OR slug LIKE '%-sao-caetano' AND category = 'serralheiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'serralheiro')
OR slug LIKE '%-sao-caetano' AND category = 'serralheiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'ce7c05ad-4fce-4ebb-bd55-afc861a6fe60', 
  'Alumiferro Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'R. Amazonas, 1430',
  '1142242744', 
  '1142242744',
  NULL, 
  NULL, 
  true, 
  'alumiferro-serralheria-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'b7e3ea54-fed6-46ec-b271-35442ed549f6', 
  'Atitude Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Rua Maj. Carlos Del Prete, 282',
  '1142283304', 
  '1142283304',
  NULL, 
  NULL, 
  true, 
  'atitude-serralheria-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'eae9889a-df3a-497d-b6a9-dd33deb488a9', 
  'CMP Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Cerâmica', 
  'Rua São Paulo, 279',
  '1142297135', 
  '1142297135',
  NULL, 
  NULL, 
  true, 
  'cmp-serralheria-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  '8b561718-d948-4b3f-82a3-6fcd7ec980e1', 
  'Egvim Solução', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Nova Gerty', 
  'R. Tocantins, 189',
  '1135653078', 
  '1135653078',
  NULL, 
  NULL, 
  true, 
  'egvim-solução-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  '56b083a0-772e-4942-a5ac-549d3efdded2', 
  'Esquadri-art Serralheria', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santo Antônio', 
  'Av. Sen. Roberto Símonsen, 977',
  '1142212374', 
  '1142212374',
  NULL, 
  NULL, 
  true, 
  'esquadriart-serralheria-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'a462a308-f30b-4cab-9e88-981fa18c38db', 
  'Serralheria Cassaquera', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Barcelona', 
  'Alameda Cassaquera, 997',
  '11991929490', 
  '1123111851',
  NULL, 
  NULL, 
  true, 
  'serralheria-cassaquera-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'ae543ccf-65c5-44aa-b24f-179aa3f836d5', 
  'Serralheria Casimiro', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santa Paula', 
  'Rua Oswaldo Cruz, 1406',
  '1142324966', 
  '1142324966',
  NULL, 
  NULL, 
  true, 
  'serralheria-casimiro-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  '1f0cc703-b0b0-4c41-83e6-b1f6558356b0', 
  'Serralheria Moura', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Rua Senador Vergueiro, 529',
  '1142216778', 
  '1142216778',
  NULL, 
  NULL, 
  true, 
  'serralheria-moura-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'e4d4735a-dcfb-4321-bf8c-541f34f13912', 
  'Serralheria Rápida', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Avenida Lions Club, 205',
  '1149918159', 
  '1149918159',
  NULL, 
  NULL, 
  true, 
  'serralheria-rápida-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  '2820d0e5-826b-4aac-8cbc-ca54969900be', 
  'Serralheria Benezer', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Estrada Lágrimas, 55',
  '1142321089', 
  '1142321089',
  NULL, 
  NULL, 
  true, 
  'serralheria-benezer-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'd9546ef6-2093-4ce4-a42d-dbddcc38b4d0', 
  'Serralheria Rebouças', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Fundação', 
  'São Caetano do Sul, SP',
  '1142243911', 
  '1142243911',
  NULL, 
  NULL, 
  true, 
  'serralheria-rebouças-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  '297ed4cb-d316-46fd-b590-01d72022402c', 
  'Serralheria Artística Metálica JJ5S', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Olímpico', 
  'Rua Francesco de Martini, 461',
  '1142327971', 
  '1142327971',
  NULL, 
  NULL, 
  true, 
  'serralheria-artística-metálica-jj5s-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'ffe105b7-62c0-42ce-9cb0-b768655a3e4b', 
  'O Portal das Maravilhas', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santa Paula', 
  'Avenida Presidente Kennedy, 1200',
  '1142243074', 
  '1142243074',
  NULL, 
  NULL, 
  true, 
  'o-portal-das-maravilhas-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'f76a2288-9347-4414-b4c3-876d97aa7543', 
  'A Alumiart Cortinas e Persianas', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santa Paula', 
  'Av Doutor Augusto de Toledo, 760',
  '1142260000', 
  '1142260000',
  NULL, 
  NULL, 
  true, 
  'a-alumiart-cortinas-e-persianas-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  '5005f2d8-f8de-4e34-9790-1440aebf0780', 
  'Serralheria São Caetano', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'São Caetano do Sul',
  '1142215000', 
  '1142215000',
  NULL, 
  NULL, 
  true, 
  'serralheria-são-caetano-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  'f3fb1183-6012-4df1-89c6-f51512a9f3c0', 
  'Metalúrgica SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Santa Paula', 
  'São Caetano do Sul',
  '1142385000', 
  '1142385000',
  NULL, 
  NULL, 
  true, 
  'metalúrgica-scs-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
  '930918f5-667f-47fd-87e5-a49313b723df', 
  'Vidraçaria e Serralheria Cerâmica', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Cerâmica', 
  'São Caetano do Sul',
  '1142296000', 
  '1142296000',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-e-serralheria-cerâmica-sao-caetano',
  'Serviços e construções com estruturas metálicas, portões e serralheria em São Caetano do Sul', 
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
