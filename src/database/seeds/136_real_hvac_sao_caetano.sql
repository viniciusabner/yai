-- Inserção de Técnicos em Ar Condicionado em São Caetano do Sul (Dados Reais)
-- Cidade: São Caetano do Sul
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-sao-caetano' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-sao-caetano' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-sao-caetano' AND category = 'tecnico_ar_condicionado';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '43d5c7dc-2197-47e8-b1b8-eea816ed674c', 
  'Cold Quality', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11992834907', 
  '1143036227',
  NULL, 
  NULL, 
  true, 
  'cold-quality-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  '32ee06de-90ca-49f9-8d71-bc56e08ad63d', 
  'HORVATH Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Caetano do Sul, SP',
  '1127864264', 
  '1142329960',
  NULL, 
  NULL, 
  true, 
  'horvath-ar-condicionado-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  '29fac32d-a8f1-4ac8-87e2-b287ec5f2dee', 
  'Rey do Ar Condicionado (Grupo 4S)', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Caetano do Sul, SP',
  '1141174113', 
  '1128915777',
  NULL, 
  NULL, 
  true, 
  'rey-do-ar-condicionado-grupo-4s-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  '7573d2c4-16df-48ef-8b16-7cd2215806a2', 
  'Manutenção Ar Condicionado Carrier SBC/SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11962311982', 
  '1139025938',
  NULL, 
  NULL, 
  true, 
  'manutenção-ar-condicionado-carrier-sbcscs-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  '7dc91da0-036b-4366-9313-f3533b3f9053', 
  'ABC Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Santa Paula', 
  'São Caetano do Sul, SP',
  '1142385738', 
  '1142385738',
  NULL, 
  NULL, 
  true, 
  'abc-ar-condicionado-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  '297e5cbc-fc38-46a0-b93c-1475c51690a3', 
  'Gelar SP', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11942500551', 
  '11942500551',
  NULL, 
  NULL, 
  true, 
  'gelar-sp-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  '0cfc90ba-e04b-4ad1-9dc9-7ea8396eb1e5', 
  'Climagel', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11946182237', 
  '11946182237',
  NULL, 
  NULL, 
  true, 
  'climagel-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  'a0a991ba-e513-4dbb-aae2-40263021edbb', 
  'EkoClimax', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Cerâmica', 
  'São Caetano do Sul, SP',
  '11971054922', 
  '11971054922',
  NULL, 
  NULL, 
  true, 
  'ekoclimax-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  'ec4cff19-c3ba-40d7-b2fc-ec84cf1dd3c9', 
  'JCC Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'São Caetano do Sul, SP',
  '08006068137', 
  '08006068137',
  NULL, 
  NULL, 
  true, 
  'jcc-ar-condicionado-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
  'd29df057-b0be-4cd9-8475-787f460e0f77', 
  'Refrimar Assistência Técnica', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Oswaldo Cruz', 
  'Rua Coronel Camisão, 273',
  '1142328270', 
  '1142328270',
  NULL, 
  NULL, 
  true, 
  'refrimar-assistência-técnica-sao-caetano',
  'Serviços e instalações de Ar Condicionado e Climatização em São Caetano do Sul', 
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
