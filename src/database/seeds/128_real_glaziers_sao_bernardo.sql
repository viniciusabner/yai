-- Inserção de Vidraceiros em São Bernardo do Campo (Dados Reais)
-- Cidade: São Bernardo do Campo
-- Categoria: Buscada via Subquery (Vidraceiro / Box)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'vidraceiro')
  OR slug LIKE '%-sao-bernardo' AND category = 'vidraceiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'vidraceiro')
  OR slug LIKE '%-sao-bernardo' AND category = 'vidraceiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'vidraceiro')
OR slug LIKE '%-sao-bernardo' AND category = 'vidraceiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '0986fafa-cd27-4812-a6aa-74c9510bed1b', 
  'Vidraçaria SP Box', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11911767390', 
  '11911767390',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-sp-box-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '1afb17af-b380-464d-b351-a395ab78d3c0', 
  'O Rei do Box (Vidraçaria ABC)', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11970118314', 
  '11970118314',
  NULL, 
  NULL, 
  true, 
  'o-rei-do-box-vidraçaria-abc-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '4f6bc8df-23cb-4407-910b-805d9f690495', 
  'Efraim Vidraçaria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11994269658', 
  '11994269658',
  NULL, 
  NULL, 
  true, 
  'efraim-vidraçaria-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '54fdbc0d-9b39-46e9-810c-9669f5801c4a', 
  'Virtual Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Paulicéia', 
  'Rua M.M.D.C., 244',
  '1143684176', 
  '1143684176',
  NULL, 
  NULL, 
  true, 
  'virtual-vidros-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '5c0234b9-c8b8-4fd4-83fb-c9300a182022', 
  'Vidraçaria Diamante', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Planalto', 
  'R. José de Alencar, 72',
  '11919757949', 
  '11919757949',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-diamante-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '8d4608b8-cf52-4747-a6ef-ea5f8ed416b5', 
  'Jato Vidraçaria', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Santa Terezinha', 
  'Av. Luiz Pequini, 1681',
  '11947351871', 
  '1141218964',
  NULL, 
  NULL, 
  true, 
  'jato-vidraçaria-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '131ae52c-dd9f-45a6-aeec-661a819ba43c', 
  'Ofir Glass', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11939350298', 
  '11939350298',
  NULL, 
  NULL, 
  true, 
  'ofir-glass-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '14f241bf-b624-49de-9d9a-f6c317b73a5e', 
  'Halvyr Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Demarchi', 
  'Av. Maria Servidei Demarchi, 494',
  '1143566501', 
  '1143566501',
  NULL, 
  NULL, 
  true, 
  'halvyr-vidros-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '5c0d92a4-15e6-4471-a89f-80d4c306005d', 
  'Vidraçaria Assunção', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Assunção', 
  'Rua Walte Calos Zanini, 149',
  '1143514646', 
  '1143514646',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-assunção-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  'ac113081-c8d0-4705-b51d-f696a3cec7bb', 
  'Mm Vidro', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Baeta Neves', 
  'Avenida Getúlio Vargas, 1615',
  '1141254944', 
  '1141254944',
  NULL, 
  NULL, 
  true, 
  'mm-vidro-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '127a21c8-491f-46ed-817c-ed657e862b5f', 
  'Izabela Comércio de Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Baeta Neves', 
  'Av. Getúlio Vargas, 996',
  '1141217391', 
  '1141217391',
  NULL, 
  NULL, 
  true, 
  'izabela-comércio-de-vidros-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '45db190f-76bc-4814-9480-03eeced75a54', 
  'Estrutural Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Planalto', 
  'Avenida Robert Kennedy, 3441',
  '1143513978', 
  '1143513978',
  NULL, 
  NULL, 
  true, 
  'estrutural-vidros-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
  '33db4a16-62ba-47e8-9183-f5ebdad10848', 
  'Menha Vidros', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Planalto', 
  'Rua Francisco Marotti, 73',
  '1143418050', 
  '1143418050',
  NULL, 
  NULL, 
  true, 
  'menha-vidros-sao-bernardo',
  'Serviços e instalações de vidros, box e esquadrias em São Bernardo do Campo', 
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
