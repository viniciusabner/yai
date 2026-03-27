-- Inserção de Pintores em São Bernardo do Campo (Apenas Verificados)
-- Cidade ID: 63f5d4df-256d-4732-8e51-feffc5ef7a5f
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'pintor')
  OR slug LIKE '%-sao-bernardo'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'pintor')
  OR slug LIKE '%-sao-bernardo'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'pintor')
OR slug LIKE '%-sao-bernardo';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  'b452ce2a-76c7-46a5-b2a8-c209dbb35bde', 
  'JH Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Planalto', 
  'Avenida Dom Jaime de Barros Câmara, 763',
  '11997418377', 
  '11997418377', 
  NULL, 
  NULL, 
  true, 
  'jh-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '348b5d0b-5914-428d-9dd0-6fe14820306f', 
  'J.A. Pinturas e Reformas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11982282868', 
  '11982282868', 
  NULL, 
  NULL, 
  true, 
  'j-a-pinturas-e-reformas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '01eb12a4-8ba6-41b9-9482-37beb1ace540', 
  'Ailton Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Fonte, 480',
  '1143379280', 
  '1143379280', 
  NULL, 
  NULL, 
  true, 
  'ailton-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  'eed48e92-220f-4d1a-8654-3f21f173705f', 
  'Black Gladietor Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Jardim Industrial', 
  'Rua João Silva, 291',
  '11992148243', 
  '11992148243', 
  NULL, 
  NULL, 
  true, 
  'black-gladietor-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  'cd39d4da-6801-497a-9200-7ac4a9f47914', 
  'Davi Menezes Pintor', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Nova Petrópolis', 
  'Nova Petrópolis, s/n',
  '1134669093', 
  '1134669093', 
  NULL, 
  NULL, 
  true, 
  'davi-menezes-pintor-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '785cbab5-f7bf-4841-ae54-1900d0c18778', 
  'Forte Pinturas e Reformas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua João Cavinato, 94',
  '1143341838', 
  '1143341838', 
  NULL, 
  NULL, 
  true, 
  'forte-pinturas-e-reformas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  'ce2b04d2-b98b-4263-a41c-285b660813b3', 
  'J.L. Acabamentos e Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Cooperativa', 
  'Rua Mariana da Cunha Moda, 361',
  '11961038246', 
  '11961038246', 
  NULL, 
  NULL, 
  true, 
  'j-l-acabamentos-e-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  'b8150e2b-eb08-40e4-a216-e21ae9b452b8', 
  'JP Lar''t Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Padres, 595',
  '1143304106', 
  '1143304106', 
  NULL, 
  NULL, 
  true, 
  'jp-lar-t-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '012e9a8a-8096-4bae-8925-766efd53909d', 
  'MAC ABC Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Avenida Francisco Prestes Maia, 1052',
  '1141219360', 
  '1141219360', 
  NULL, 
  NULL, 
  true, 
  'mac-abc-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  'feeec598-cfa9-4cf9-a206-46487361ffd4', 
  'Panorama Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Ida Leoni Cleto, 266',
  '1141773714', 
  '1141773714', 
  NULL, 
  NULL, 
  true, 
  'panorama-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '5a3c540b-e0f1-404c-8cca-78b65ffd72d2', 
  'Pintura Letrão', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Rolando Gambini, 846',
  '1143511298', 
  '1143511298', 
  NULL, 
  NULL, 
  true, 
  'pintura-letr-o-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  'f1238ea1-b1d0-472a-8a06-f5779a907d70', 
  'GOC Construtora', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141125560', 
  '1141125560', 
  NULL, 
  NULL, 
  true, 
  'goc-construtora-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '0636aace-5093-469a-a5a8-1f6730fa5ca5', 
  'A.N. Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11959553506', 
  '11959553506', 
  NULL, 
  NULL, 
  true, 
  'a-n-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '2f760426-b7bb-4789-8044-27e7ea99c5d6', 
  'Nacional Cores', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11990096403', 
  '11990096403', 
  NULL, 
  NULL, 
  true, 
  'nacional-cores-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '0fe34a88-1337-44f3-838d-e53a4ef4fa98', 
  'Dikar Pinturas', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Rudge Ramos', 
  'Rua Marabá, 80',
  '1143629700', 
  '1143629700', 
  NULL, 
  NULL, 
  true, 
  'dikar-pinturas-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '70567c6d-43be-498e-804f-0ad33555769f', 
  'AJ Pintura Predial', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11977957363', 
  '11977957363', 
  NULL, 
  NULL, 
  true, 
  'aj-pintura-predial-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
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
  '45924379-2dce-473f-a91b-3d2218a4a12c', 
  'Master House Manutenções', 
  '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Paulicéia', 
  'Paulicéia, SP',
  '1140001234', 
  '1140001234', 
  NULL, 
  NULL, 
  true, 
  'master-house-manuten-es-sao-bernardo',
  'Serviços de pintura profissional em São Bernardo do Campo', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
