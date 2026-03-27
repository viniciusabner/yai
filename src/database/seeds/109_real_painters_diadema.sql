-- Inserção de Pintores em Diadema (Apenas Verificados)
-- Cidade ID: 205e475f-44aa-418f-8835-434cd5e913d2
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'pintor')
  OR slug LIKE '%-diadema'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'pintor')
  OR slug LIKE '%-diadema'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'pintor')
OR slug LIKE '%-diadema';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '3396b13e-0da6-4608-a7fb-760deb389c03', 
  'J.A Pinturas e Reformas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '11982282868', 
  '11982282868', 
  NULL, 
  NULL, 
  true, 
  'j-a-pinturas-e-reformas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '5889871d-27da-454e-88a2-6431d3ea2656', 
  'Atlanta Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '11940824490', 
  '11940824490', 
  NULL, 
  NULL, 
  true, 
  'atlanta-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '5c2fdcbb-d2fc-4a68-b576-5f6b7acdafe4', 
  'HTL Brasil', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '11972016079', 
  '1141237237', 
  NULL, 
  NULL, 
  true, 
  'htl-brasil-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '6e02492f-c73b-457d-9f36-c104e2d18c03', 
  'A5web Pintor', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '17981002981', 
  '17981002981', 
  NULL, 
  NULL, 
  true, 
  'a5web-pintor-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '62bb62fa-e82a-4c97-ab5c-7fdb2f6c5c01', 
  'A S Grafiato', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140913576', 
  '1140913576', 
  NULL, 
  NULL, 
  true, 
  'a-s-grafiato-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '494a34e5-912d-4c2e-a306-79c9b3c5ae8b', 
  'Hml Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Eldorado', 
  'Rua Caranguejo, 129',
  '1140590467', 
  '1140590467', 
  NULL, 
  NULL, 
  true, 
  'hml-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '4b2b2f07-8c94-4a3a-94a1-41aaede97547', 
  'Kadi Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140911077', 
  '1140911077', 
  NULL, 
  NULL, 
  true, 
  'kadi-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '9d8bcb9b-69d1-49e1-aa07-ea318b6fa6c7', 
  'Luizão Pintor', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140752014', 
  '1140752014', 
  NULL, 
  NULL, 
  true, 
  'luiz-o-pintor-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'c3fe1de2-3c2b-443d-a797-ed6306d9054e', 
  'Marcos Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140771082', 
  '1140771082', 
  NULL, 
  NULL, 
  true, 
  'marcos-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'ccfda1aa-989f-4ef4-8800-51498301477c', 
  'Martins Serviço de Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140591504', 
  '1140591504', 
  NULL, 
  NULL, 
  true, 
  'martins-servi-o-de-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'eb5b3964-dc49-4e3e-b745-39770a32f734', 
  'MRP Reformas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1134124053', 
  '1134124053', 
  NULL, 
  NULL, 
  true, 
  'mrp-reformas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '12fdafd4-3f94-4166-a7c1-b02f845c5d73', 
  'Pinturas Fortaleza', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140772446', 
  '1140772446', 
  NULL, 
  NULL, 
  true, 
  'pinturas-fortaleza-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'e8e0e3ea-4698-4a76-8cc2-e97f68c0641a', 
  'RFY Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140919880', 
  '1140919880', 
  NULL, 
  NULL, 
  true, 
  'rfy-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '47cfae3a-8575-404b-9d4f-315fee4db7bf', 
  'SS Pintura', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140714833', 
  '1140714833', 
  NULL, 
  NULL, 
  true, 
  'ss-pintura-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '05f88fd0-6b57-46e6-a4fa-0ef043bc4f23', 
  'Tupi Limpeza e Pintura', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '1140753368', 
  '1140753368', 
  NULL, 
  NULL, 
  true, 
  'tupi-limpeza-e-pintura-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '8a848212-0fbc-4426-ab33-c6f315af303b', 
  'GBL Pinturas Eletrostáticas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Piraporinha', 
  'Diadema, SP',
  '11932312077', 
  '11932312077', 
  NULL, 
  NULL, 
  true, 
  'gbl-pinturas-eletrost-ticas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '59c79f5b-d897-4725-a29a-dc82a8c5e2d1', 
  'Pintor Piraporinha', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Piraporinha', 
  'Rua Frei Caneca, 53',
  '1123752486', 
  '1123752486', 
  NULL, 
  NULL, 
  true, 
  'pintor-piraporinha-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '8739a3d8-dec0-4bf9-9141-12bd77526f53', 
  'A Casa da Pintura', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Piraporinha', 
  'Avenida Piraporinha, 1111',
  '1125966666', 
  '1125966666', 
  NULL, 
  NULL, 
  true, 
  'a-casa-da-pintura-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '49d224a2-fad5-439b-ac9e-32feb48ccc1c', 
  'Colore Technical Parts', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Piraporinha', 
  'Av. Piraporinha, 246',
  '1140445083', 
  '1140445083', 
  NULL, 
  NULL, 
  true, 
  'colore-technical-parts-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'f6725548-e103-472c-8474-07f2098e0084', 
  'KJ Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Eldorado', 
  'Rua 13',
  '1184706097', 
  '1184706097', 
  NULL, 
  NULL, 
  true, 
  'kj-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'c1ff47e3-8fe3-4221-aa51-dca2cf066116', 
  'Uenderson Souza', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Eldorado', 
  'Rua Camarupim, 184',
  '1140493019', 
  '1140493019', 
  NULL, 
  NULL, 
  true, 
  'uenderson-souza-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'f9d408e2-4bd8-4155-beec-b4d86b907d05', 
  'Pablo Miguel Silva', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Eldorado', 
  'Rua Cachalote, 358',
  '1144050665', 
  '1144050665', 
  NULL, 
  NULL, 
  true, 
  'pablo-miguel-silva-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  '15501a94-ad55-43d9-b9e1-8e3f2142e0f9', 
  'Color House Pinturas', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Canhema', 
  'Diadema, SP',
  '11980675510', 
  '11980675510', 
  NULL, 
  NULL, 
  true, 
  'color-house-pinturas-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'd0efe51b-ff83-4550-9aab-54bb0a3f1392', 
  'Pintor Centro', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Orense, 41',
  '1135930724', 
  '1135930724', 
  NULL, 
  NULL, 
  true, 
  'pintor-centro-diadema',
  'Serviços de pintura profissional em Diadema', 
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
  'b7262939-d59a-4f4d-84b0-473a59f3f9ea', 
  'Equipe Cesar', 
  '205e475f-44aa-418f-8835-434cd5e913d2', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Diadema, SP',
  '11992495177', 
  '11992495177', 
  NULL, 
  NULL, 
  true, 
  'equipe-cesar-diadema',
  'Serviços de pintura profissional em Diadema', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
