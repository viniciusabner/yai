-- Inserção de Pintores em São Caetano do Sul (Apenas Verificados)
-- Cidade ID: d422ecad-80b4-450a-b364-ebb888d700e1
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'pintor')
  OR slug LIKE '%-sao-caetano'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'pintor')
  OR slug LIKE '%-sao-caetano'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'pintor')
OR slug LIKE '%-sao-caetano';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '1d2883a7-22a2-4af0-856f-35311d9a3d36', 
  'Lci Pintura', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11947793775', 
  '1123914195', 
  NULL, 
  NULL, 
  true, 
  'lci-pintura-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
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
  '197cf9a3-6d51-4055-937b-a1c7378b4c43', 
  'Atlanta Pinturas', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11940824490', 
  '11940824490', 
  NULL, 
  NULL, 
  true, 
  'atlanta-pinturas-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
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
  'f0632c54-ee17-4617-97ae-768315881360', 
  'JA Pinturas', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Cerâmica', 
  'São Caetano do Sul, SP',
  '11982282868', 
  '11982282868', 
  NULL, 
  NULL, 
  true, 
  'ja-pinturas-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
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
  'c93a32be-e544-402d-aa1c-f3f9772d3c32', 
  'Nacional Cores', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11990096403', 
  '11990096403', 
  NULL, 
  NULL, 
  true, 
  'nacional-cores-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
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
  '4951e8d6-6c19-4452-8926-f1281171374b', 
  'Kolli Pinturas', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11951774005', 
  '11951774005', 
  NULL, 
  NULL, 
  true, 
  'kolli-pinturas-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
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
  '307ef87e-4ea1-4890-a025-412ac7ca0478', 
  'Grupo Viana', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11939561754', 
  '11939561754', 
  NULL, 
  NULL, 
  true, 
  'grupo-viana-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
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
  '49c72d51-cfb9-49be-b402-12f1f2ae2acc', 
  'Athenaz Pinturas', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Santa Paula', 
  'Rua Julieta Soares, s/n',
  '11983263456', 
  '11983263456', 
  NULL, 
  NULL, 
  true, 
  'athenaz-pinturas-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
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
  'e5c53e5d-a90a-47d4-b28b-d6d35f9419e7', 
  'Color House Pinturas', 
  'd422ecad-80b4-450a-b364-ebb888d700e1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Cerâmica', 
  'São Caetano do Sul, SP',
  '11980675510', 
  '11980675510', 
  NULL, 
  NULL, 
  true, 
  'color-house-pinturas-sao-caetano',
  'Serviços de pintura profissional em São Caetano do Sul', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
