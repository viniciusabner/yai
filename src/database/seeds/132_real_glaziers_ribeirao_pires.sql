-- Inserção de Vidraceiros em Ribeirão Pires (Dados Reais)
-- Cidade: Ribeirão Pires
-- Categoria: Buscada via Subquery (Vidraceiro / Box)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'vidraceiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'vidraceiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'vidraceiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'vidraceiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'vidraceiro')
OR slug LIKE '%-ribeirao-pires' AND category = 'vidraceiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '9367e280-35fa-42e7-b7aa-7628c58ff26d', 
  'M & S Vidros', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Av. Francisco Monteiro, 143',
  '1148282821', 
  '1148282821',
  NULL, 
  NULL, 
  true, 
  'm-s-vidros-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '043d63bf-bf8e-45ba-a43a-bf005e678c28', 
  'Top Glass Sacadas', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Jardim Roncon', 
  'R. Eugênio Roncon, 897',
  '1148252397', 
  '1148252397',
  NULL, 
  NULL, 
  true, 
  'top-glass-sacadas-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '5dd5b840-8600-4c31-a7e0-a8a42e295021', 
  'Orient Vidros', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1148246747', 
  '1148246747',
  NULL, 
  NULL, 
  true, 
  'orient-vidros-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '88ba6e78-db66-494b-9e67-9bc927ae3d5c', 
  'Vidraçaria SP Box Ribeirão', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11911767390', 
  '11911767390',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-sp-box-ribeirão-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  'a263689b-17a3-4f9c-8514-ed7f7112879d', 
  'Design Plano Vidraçaria Ribeirão', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11982851453', 
  '11982851453',
  NULL, 
  NULL, 
  true, 
  'design-plano-vidraçaria-ribeirão-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '81bfcfd7-e138-4aa6-9a95-922457876a03', 
  'Vidraçaria Paiva', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11960133622', 
  '11960133622',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-paiva-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '55c62fcc-d5b2-4c71-aab4-d537b33ded26', 
  'Efraim Vidraçaria Ribeirão', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11994269658', 
  '11994269658',
  NULL, 
  NULL, 
  true, 
  'efraim-vidraçaria-ribeirão-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  'd6aaba13-3df1-4e81-80d0-bd55a307ae74', 
  'Beska Vidros e Espelhos', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1148244731', 
  '1148244731',
  NULL, 
  NULL, 
  true, 
  'beska-vidros-e-espelhos-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '18a0c330-ddd5-4a51-9e77-120e55056f52', 
  'Vidraçamento', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11986642668', 
  '11986642668',
  NULL, 
  NULL, 
  true, 
  'vidraçamento-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '3f276c7d-9a14-4836-99f0-01144f985e93', 
  'SPGlass Ribeirão', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11940714225', 
  '11940714225',
  NULL, 
  NULL, 
  true, 
  'spglass-ribeirão-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '07e69c2b-b682-4d20-b7f3-a9c86f9571ce', 
  'Vidraçaria Fioravante', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1148256850', 
  '1148256850',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-fioravante-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '15f6e45c-04c8-403e-8db6-d9ebcfc5989e', 
  'Lider Envidraçamentos', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1149925757', 
  '1149925757',
  NULL, 
  NULL, 
  true, 
  'lider-envidraçamentos-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
  '775d513f-338d-4e35-9c26-9bdaed8dd6f0', 
  'Vidraçaria Centro Alto', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro Alto', 
  'Av. Santo André, 659',
  '1148255769', 
  '1148255769',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-centro-alto-ribeirao-pires',
  'Serviços e instalações de vidros, box e esquadrias em Ribeirão Pires', 
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
