-- Inserção de Vidraceiros em São Caetano do Sul (Dados Reais)
-- Cidade: São Caetano do Sul
-- Categoria: Buscada via Subquery (Vidraceiro / Box)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'vidraceiro')
  OR slug LIKE '%-sao-caetano' AND category = 'vidraceiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'vidraceiro')
  OR slug LIKE '%-sao-caetano' AND category = 'vidraceiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'vidraceiro')
OR slug LIKE '%-sao-caetano' AND category = 'vidraceiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '395cc0d9-fa97-4192-aa41-efff4cc201b6', 
  'Vidraçaria SP Box', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11911767390', 
  '11911767390',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-sp-box-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '68b6e012-1c0c-4825-94fb-2e6cb0b26b4a', 
  'Efraim Vidraçaria', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11994269658', 
  '11994269658',
  NULL, 
  NULL, 
  true, 
  'efraim-vidraçaria-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  'e89e80b6-7505-494d-aa6c-68accc64bb06', 
  'RR Espelhos', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Barcelona', 
  'Rua Alegre, 1155',
  '11983019850', 
  '1143184800',
  NULL, 
  NULL, 
  true, 
  'rr-espelhos-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '7e947234-2d1a-4ea8-9d2f-5f501cf26577', 
  'Alameda Glass', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11998641425', 
  '1142206056',
  NULL, 
  NULL, 
  true, 
  'alameda-glass-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '9a2f31ed-c5c1-4300-b088-804378b45f3e', 
  'Vidraçaria Minelli (Ateliê Vidros)', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Fundação', 
  'Av. Conde Francisco Matarazzo, 624',
  '1142260363', 
  '1142260363',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-minelli-ateliê-vidros-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '51f710bc-308f-4b2e-8245-3036af6c036d', 
  'Box De vidro LM', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '1126295744', 
  '1126295744',
  NULL, 
  NULL, 
  true, 
  'box-de-vidro-lm-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '20b7db61-225d-41ba-933f-b2c72f7d2080', 
  'BrasilGlass', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '1142241563', 
  '1142241563',
  NULL, 
  NULL, 
  true, 
  'brasilglass-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '6c703920-7186-4318-a1f6-2b45345e97f6', 
  'Vidros Regina', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Cerâmica', 
  'Av. Sen. Roberto Símonsen, 1289',
  '1142246692', 
  '1142246692',
  NULL, 
  NULL, 
  true, 
  'vidros-regina-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '0bc21ce8-9f7a-481a-9ec3-ab01a3c02143', 
  'São Caetano Glass', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '1135651064', 
  '1135651064',
  NULL, 
  NULL, 
  true, 
  'são-caetano-glass-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '405350a5-aa79-460a-9508-8015ae1246e6', 
  'SHOW GLASS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11947659593', 
  '1150680960',
  NULL, 
  NULL, 
  true, 
  'show-glass-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '2ee34a79-76bf-40e8-8121-60fb0bae7a86', 
  'Ofir Glass', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11939350298', 
  '11939350298',
  NULL, 
  NULL, 
  true, 
  'ofir-glass-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '8a032ab4-feef-4908-9430-e7c3b01ee0a8', 
  'Kza Box Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11993061688', 
  '1123761688',
  NULL, 
  NULL, 
  true, 
  'kza-box-vidros-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '9cfacada-996f-4e98-a605-b7f23c32beae', 
  'GMS Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11951080449', 
  '11951080449',
  NULL, 
  NULL, 
  true, 
  'gms-vidros-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '88fa0419-2eee-4078-b8af-2d154b554f34', 
  'Pacaembu Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Santo Antônio', 
  'Rua Conceição, 506',
  '11974210069', 
  '1142248999',
  NULL, 
  NULL, 
  true, 
  'pacaembu-vidros-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '820d5e75-3981-45b1-a4a0-f5287ee21617', 
  'Vidraçaria A.B.C.D.', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Santa Paula', 
  'Av. Goiás, 1780',
  '1142241315', 
  '1142241315',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-abcd-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
  '58eca32e-a822-4b9e-aeb2-3c19c3aa93b8', 
  'Vidraçaria Barcelona', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Barcelona', 
  'Rua Taipas, 613',
  '1142283097', 
  '1142283097',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-barcelona-sao-caetano',
  'Serviços e instalações de vidros, box e esquadrias em São Caetano do Sul', 
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
