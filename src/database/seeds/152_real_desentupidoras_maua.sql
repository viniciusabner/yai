-- Inserção de Desentupidoras (Saneamento) em Mauá (Dados Reais)
-- Cidade: Mauá
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'desentupidora')
  OR slug LIKE '%-maua' AND category = 'desentupidora'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'desentupidora')
  OR slug LIKE '%-maua' AND category = 'desentupidora'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'desentupidora')
OR slug LIKE '%-maua' AND category = 'desentupidora';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '37844694-4d7a-4243-9f43-36b182898b1c', 
  'Desentupidora Mauá 24h', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque das Américas', 
  'Mauá, SP',
  '1145415506', 
  '1145415506',
  NULL, 
  NULL, 
  true, 
  'desentupidora-mauá-24h-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '6b4ba366-5bab-4e77-86f5-b8540cc22de3', 
  'Desentupidora sampa Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Mauá, SP',
  '1125399192', 
  '1125399192',
  NULL, 
  NULL, 
  true, 
  'desentupidora-sampa-mauá-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '6bd0a6c4-0efc-45d6-8d2b-d373409727d1', 
  'Desentupidora BR Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Mauá, SP',
  '11920597774', 
  '11920597774',
  NULL, 
  NULL, 
  true, 
  'desentupidora-br-mauá-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  'ce379911-822f-4379-b520-146637d4bd29', 
  'Desentupidora Chamou Chegou Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Mauá, SP',
  '11952699160', 
  '11952699160',
  NULL, 
  NULL, 
  true, 
  'desentupidora-chamou-chegou-mauá-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '8b65fbef-cd46-4576-9431-caf67c60787c', 
  'Desentupidora em SP Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Mauá, SP',
  '1123597531', 
  '1123597531',
  NULL, 
  NULL, 
  true, 
  'desentupidora-em-sp-mauá-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '8004635e-8a83-4e3d-809e-42188a5dec63', 
  'Mauá Desentupidora Pq São Vicente', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque São Vicente', 
  'Mauá, SP',
  '11992002542', 
  '1144263704',
  NULL, 
  NULL, 
  true, 
  'mauá-desentupidora-pq-são-vicente-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '8f3d3f92-443c-4b62-a9dd-fcd8463f742b', 
  'Super Limp Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque São Vicente', 
  'Mauá, SP',
  '11930710937', 
  '11930710937',
  NULL, 
  NULL, 
  true, 
  'super-limp-desentupidora-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '17328cca-9807-4147-bddd-b943967d4f9f', 
  'Madalena Desentupidora Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Mauá, SP',
  '11946699263', 
  '11946699263',
  NULL, 
  NULL, 
  true, 
  'madalena-desentupidora-mauá-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  'd56d74a9-16e7-44f5-a5d7-a999e9d14310', 
  'Peritec Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Mauá, SP',
  '11976770685', 
  '11949275018',
  NULL, 
  NULL, 
  true, 
  'peritec-desentupidora-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '98c066dd-ef96-4f88-840d-e32dc118e1a0', 
  'Desentupidora Jardim Zaira', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Zaíra', 
  'Mauá, SP',
  '11930186000', 
  '11930186000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-jardim-zaira-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  'c1b48b55-6049-4975-9b68-4542212fc0bb', 
  'Desentupidora Esgoto Limpo', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Zaíra', 
  'Mauá, SP',
  '1129921000', 
  '1129921000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-esgoto-limpo-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  'a2b1a33e-01fe-42ed-a884-abedf8b3537b', 
  'Desentupidora D5', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Zaíra', 
  'Mauá, SP',
  '11911731885', 
  '1144103931',
  NULL, 
  NULL, 
  true, 
  'desentupidora-d5-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '6a1eb6ce-fb31-4b04-b0de-8cb4d0e1c6e4', 
  'Trindade Desentupimento Guapituba', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Guapituba', 
  'Mauá, SP',
  '11982226770', 
  '1137965814',
  NULL, 
  NULL, 
  true, 
  'trindade-desentupimento-guapituba-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  'f3772747-4651-4a79-bcf4-e6071c27e7b3', 
  'Desentupidora HL', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Guapituba', 
  'Mauá, SP',
  '11961652024', 
  '11961652024',
  NULL, 
  NULL, 
  true, 
  'desentupidora-hl-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  '59ecbc88-933b-40d5-80c5-d6e864b2610c', 
  'Desentupidora Brasil SP', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Guapituba', 
  'Mauá, SP',
  '11958099316', 
  '11958099316',
  NULL, 
  NULL, 
  true, 
  'desentupidora-brasil-sp-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
  'af1cdda6-3810-47ca-8161-6a4ff8f9eb05', 
  'RotorSystem Capuava', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Capuava', 
  'Mauá, SP',
  '1144510933', 
  '1144510933',
  NULL, 
  NULL, 
  true, 
  'rotorsystem-capuava-maua',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Mauá', 
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
