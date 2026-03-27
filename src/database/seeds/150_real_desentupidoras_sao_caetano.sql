-- Inserção de Desentupidoras (Saneamento) em São Caetano do Sul (Dados Reais)
-- Cidade: São Caetano do Sul
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'desentupidora')
  OR slug LIKE '%-sao-caetano' AND category = 'desentupidora'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'desentupidora')
  OR slug LIKE '%-sao-caetano' AND category = 'desentupidora'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') AND category = 'desentupidora')
OR slug LIKE '%-sao-caetano' AND category = 'desentupidora';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '1d9bf19b-0066-42d6-80e2-7df49ef62b82', 
  'Desentupidora HidroZen', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '13992073959', 
  '13992073959',
  NULL, 
  NULL, 
  true, 
  'desentupidora-hidrozen-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '80c40dad-db6e-4c30-8203-34e0550976e7', 
  'JR Hidro Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11947132496', 
  '11947132496',
  NULL, 
  NULL, 
  true, 
  'jr-hidro-desentupidora-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '8bc30d68-a4e6-4d4c-883c-5051306d7215', 
  'Hidro Urgente SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11952699160', 
  '11952699160',
  NULL, 
  NULL, 
  true, 
  'hidro-urgente-scs-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '21b3961f-6e6a-4961-9f4e-16314a4f6285', 
  'Son Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11946699263', 
  '11946699263',
  NULL, 
  NULL, 
  true, 
  'son-desentupidora-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '50c4d92e-c772-4001-a992-3f9254a30cd6', 
  'Esgotecnica SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11982085000', 
  '11982085000',
  NULL, 
  NULL, 
  true, 
  'esgotecnica-scs-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  'ca4300b9-e458-4c90-b2d9-8b2c558e6c6d', 
  'Desentupidora Hidrotex SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11948082000', 
  '1150843780',
  NULL, 
  NULL, 
  true, 
  'desentupidora-hidrotex-scs-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '0c9e327c-aa69-43ea-bc5f-b9940a5ef950', 
  'Desentupidora Menor Valor SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11913628000', 
  '11913628000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-menor-valor-scs-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '70482baf-11bd-4d8b-a72f-df06a5726f51', 
  'Desentupidora OK SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11947032038', 
  '11947032038',
  NULL, 
  NULL, 
  true, 
  'desentupidora-ok-scs-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  'e8804f66-0b0e-4ac4-af9d-2de2e03282a8', 
  'Yoshi Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Barcelona', 
  'São Caetano do Sul, SP',
  '11966907022', 
  '1128936146',
  NULL, 
  NULL, 
  true, 
  'yoshi-desentupidora-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  'cf96fedb-5238-4bf0-bc0a-92f5da337a95', 
  'HidrojatoeVacuo SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Barcelona', 
  'São Caetano do Sul, SP',
  '11977511305', 
  '11977511305',
  NULL, 
  NULL, 
  true, 
  'hidrojatoevacuo-scs-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '22270382-d5e3-4090-8e07-efbeb5ca6dd8', 
  'Desentupidora Rei dos Reis SCS', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Barcelona', 
  'São Caetano do Sul, SP',
  '11948470437', 
  '11948470437',
  NULL, 
  NULL, 
  true, 
  'desentupidora-rei-dos-reis-scs-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
  '0d40a167-2559-4206-a5e2-42b2fe93cabd', 
  'Desentupidora Santa Paula', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Santa Paula', 
  'São Caetano do Sul, SP',
  '1125399192', 
  '1125399192',
  NULL, 
  NULL, 
  true, 
  'desentupidora-santa-paula-sao-caetano',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Caetano do Sul', 
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
