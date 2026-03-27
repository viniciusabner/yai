-- Inserção de Pintores em Santo André (Apenas Verificados)
-- Cidade ID: 85b13d20-450b-4ce2-ad14-146a13738fd1
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'pintor')
  OR slug LIKE '%-santo-andre'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'pintor')
  OR slug LIKE '%-santo-andre'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'pintor')
OR slug LIKE '%-santo-andre';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '2886f2b5-87e1-437f-8555-459cb084565e', 
  'JA Pinturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Santo André', 
  'Santo André, SP',
  '11982282868', 
  '11966601567', 
  NULL, 
  NULL, 
  true, 
  'ja-pinturas-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  'b71b3fed-bf21-44e2-bed9-4d5948515253', 
  'Atlanta Pinturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Santo André', 
  'Santo André, SP',
  '11940824490', 
  '11940824490', 
  NULL, 
  NULL, 
  true, 
  'atlanta-pinturas-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  'eca6545f-a303-4812-81e2-0b185bbbf0b4', 
  'Stoc Pinturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Vila Pires', 
  'Rua Visconde de Mauá, 509',
  '11978225539', 
  '1141171349', 
  NULL, 
  NULL, 
  true, 
  'stoc-pinturas-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  '52255306-53e1-413e-b247-8bb10b3e5465', 
  'WellColor', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Santo André', 
  'Santo André, SP',
  '11986124461', 
  '11986124461', 
  NULL, 
  NULL, 
  true, 
  'wellcolor-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  '0617e065-38e8-43cb-b62d-976121328e21', 
  'A&C Pinturas em Geral', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Vila Scarpelli', 
  'Rua Tucuruma, 35',
  '1145457595', 
  '1145457595', 
  NULL, 
  NULL, 
  true, 
  'a-c-pinturas-em-geral-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  '6bae2fc4-5ede-4bc5-b268-78c645f1e772', 
  'Inove Reformas e Pinturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Vila Linda', 
  'Rua Carijós, 1856',
  '11952226462', 
  '11952226462', 
  NULL, 
  NULL, 
  true, 
  'inove-reformas-e-pinturas-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  '79172abe-fdac-4666-a512-eba22f9cb513', 
  'F&F Pinturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Jardim', 
  'Rua das Figueiras, 465',
  '11947234399', 
  '11947234399', 
  NULL, 
  NULL, 
  true, 
  'f-f-pinturas-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  'd6433837-c980-41ac-9fda-70527180c634', 
  'LC Pinturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Parque das Nações', 
  'Rua Oratório, 1600',
  '11995055088', 
  '11995055088', 
  NULL, 
  NULL, 
  true, 
  'lc-pinturas-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  '14cfb8d3-f62c-4d6b-b095-7fc1d5d78a77', 
  'Mogi Paint', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Santo André', 
  'Santo André, SP',
  '11947225134', 
  '11947225134', 
  NULL, 
  NULL, 
  true, 
  'mogi-paint-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  'df1297bf-d632-46a2-921d-454b5a3edc87', 
  'Pintura & Cia', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Coronel Oliveira Lima, 45',
  '11981559865', 
  '11981559865', 
  NULL, 
  NULL, 
  true, 
  'pintura-cia-santo-andre',
  'Serviços de pintura profissional em Santo André', 
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
  '321fdd64-1c61-42ec-8da2-8e47e021163f', 
  'Start Pinturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Jardim', 
  'Santo André, SP',
  '11932312077', 
  '11932312077', 
  NULL, 
  NULL, 
  true, 
  'start-pinturas-santo-andre',
  'Serviços de pintura profissional em Santo André', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
