-- Inserção de Pintores em Ribeirão Pires (Apenas Verificados)
-- Cidade ID: 1f84b6c7-69e8-49c6-a691-30da5246e0ea
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'pintor')
  OR slug LIKE '%-ribeirao-pires'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'pintor')
  OR slug LIKE '%-ribeirao-pires'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'pintor')
OR slug LIKE '%-ribeirao-pires';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '865aacc1-8a75-4a55-bb7c-89a22b57b52f', 
  'Visual Pinturas', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11940361339', 
  '11940361339', 
  NULL, 
  NULL, 
  true, 
  'visual-pinturas-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '66f42881-807c-4045-85f3-4da960e482f7', 
  'Atlanta Pinturas', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11940824490', 
  '11940824490', 
  NULL, 
  NULL, 
  true, 
  'atlanta-pinturas-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '26e9e65b-5a8b-4a51-80d2-e26d321c5f6d', 
  'HTL Brasil', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Ouro Fino Paulista', 
  'Rodovia Índio Tibiriçá, 2425',
  '11972016079', 
  '1141237237', 
  NULL, 
  NULL, 
  true, 
  'htl-brasil-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  'c8b0074a-69d5-45df-a222-9013cd4e2223', 
  'Nacional Cores', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11990096403', 
  '11990096403', 
  NULL, 
  NULL, 
  true, 
  'nacional-cores-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '0892b8c6-2a9c-4c37-9de8-9f4c266217eb', 
  'JK Marido de Aluguel', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Ouro Fino Paulista', 
  'Ribeirão Pires, SP',
  '11988794041', 
  '11988794041', 
  NULL, 
  NULL, 
  true, 
  'jk-marido-de-aluguel-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '1f8ac0de-ccbe-4ed1-bc60-9b4c72359064', 
  'André Pinturas', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Santa Luzia', 
  'R. Circular, 25',
  '11958093106', 
  '11958093106', 
  NULL, 
  NULL, 
  true, 
  'andr-pinturas-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '53471e0f-39d6-4eec-a6b0-38fa2f906418', 
  'Pintor Jardim Caçula', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Jardim Caçula', 
  'Rua Álvares de Azevedo, 141',
  '1148251737', 
  '1148251737', 
  NULL, 
  NULL, 
  true, 
  'pintor-jardim-ca-ula-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  'a4166ea0-593f-4b73-922e-62b4a35e50f8', 
  'Decor Colors Ribeirão', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Av. Francisco Monteiro, 398',
  '11978913983', 
  '11978913983', 
  NULL, 
  NULL, 
  true, 
  'decor-colors-ribeir-o-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '905e7008-555d-469a-a9c6-31c01d27d6aa', 
  'JA Pinturas', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11982282868', 
  '11982282868', 
  NULL, 
  NULL, 
  true, 
  'ja-pinturas-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '0c92e320-96d3-4a87-b996-7b0f42060f6c', 
  'Lci Pintura', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11947793775', 
  '1123914195', 
  NULL, 
  NULL, 
  true, 
  'lci-pintura-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '1be90ce2-4512-459b-92ee-f2a8fc3f37c2', 
  'Kolli Pinturas', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11951774005', 
  '11951774005', 
  NULL, 
  NULL, 
  true, 
  'kolli-pinturas-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '4d650aab-908c-4e80-9f5b-7fe4894d2973', 
  'GOC Construtora', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1141125560', 
  '1141125560', 
  NULL, 
  NULL, 
  true, 
  'goc-construtora-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '47bc0782-4979-4ed2-a6ea-c94d85e695d0', 
  'Pintor Quarta Divisão', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Quarta Divisão', 
  'Quarta Divisão, Ribeirão Pires',
  '11988794042', 
  '11988794042', 
  NULL, 
  NULL, 
  true, 
  'pintor-quarta-divis-o-ribeirao-pires',
  'Serviços de pintura profissional em Ribeirão Pires', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
