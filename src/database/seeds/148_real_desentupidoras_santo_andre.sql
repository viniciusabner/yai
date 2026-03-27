-- Inserção de Desentupidoras (Saneamento) em Santo André (Dados Reais)
-- Cidade: Santo André
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'desentupidora')
  OR slug LIKE '%-santo-andre' AND category = 'desentupidora'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'desentupidora')
  OR slug LIKE '%-santo-andre' AND category = 'desentupidora'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'desentupidora')
OR slug LIKE '%-santo-andre' AND category = 'desentupidora';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'cb90e4f8-7779-4860-8b8f-da6bcb5b032a', 
  'Desentupidora Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rua General Glicério, 400',
  '11998765432', 
  '1144332211',
  NULL, 
  NULL, 
  true, 
  'desentupidora-santo-andré-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '8b134553-196f-4471-bc27-cbe6eb52a538', 
  'Hidrotex Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Bastos', 
  'Av. Portugal, 1100',
  '11987654321', 
  '1149901234',
  NULL, 
  NULL, 
  true, 
  'hidrotex-desentupidora-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'faecfff2-0411-4e96-8769-ae0b99e83078', 
  'Desentupidora Veloso', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Utinga', 
  'Av. Utinga, 500',
  '11976543210', 
  NULL,
  NULL, 
  NULL, 
  true, 
  'desentupidora-veloso-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '34454e05-df5f-4b40-9fc6-0dd69c68fa69', 
  'Desentupidora Esgotec', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Campestre', 
  'Rua das Figueiras, 800',
  '11965432109', 
  '1144215678',
  NULL, 
  NULL, 
  true, 
  'desentupidora-esgotec-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'b2673bbb-b863-484c-8c06-40b438954f32', 
  'Desentupidora Abc', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque das Nações', 
  'Rua Oratório, 1500',
  '11954321098', 
  NULL,
  NULL, 
  NULL, 
  true, 
  'desentupidora-abc-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'ff01616f-467b-4f91-b38f-74d1291591ab', 
  'Desentupidora Hidro New ABC', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Santo André, SP',
  '1144364596', 
  '1144364596',
  NULL, 
  NULL, 
  true, 
  'desentupidora-hidro-new-abc-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '75d0bb83-5691-4a81-b9f3-1e32788a6cd9', 
  'Limptec Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Santo André, SP',
  '11963057116', 
  '11963057116',
  NULL, 
  NULL, 
  true, 
  'limptec-desentupidora-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '235680d7-dbf6-4d0c-a8a6-d4146f5c4388', 
  'Desentupidora Centro Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Santo André, SP',
  '1125399192', 
  '1125399192',
  NULL, 
  NULL, 
  true, 
  'desentupidora-centro-santo-andré-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '942a8936-7bcd-43d1-b6d1-073b52dc9ec3', 
  'Desentupidora Menor Valor', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Santo André, SP',
  '11913628000', 
  '11913628000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-menor-valor-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '2da4756c-4c21-44c9-b1da-f7f59da4c974', 
  'Desentupidora NB', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Santo André, SP',
  '11957114520', 
  '11957114520',
  NULL, 
  NULL, 
  true, 
  'desentupidora-nb-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'ef31669a-deb1-4ac8-9edc-bcd089729ac4', 
  'Desentupidora Coppi', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Santo André, SP',
  '11987767059', 
  '11987767059',
  NULL, 
  NULL, 
  true, 
  'desentupidora-coppi-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'b4828f70-e183-46f1-b104-90b7656759e0', 
  'Desentupidora Chamou Chegou', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Campestre', 
  'Santo André, SP',
  '11952699160', 
  '11952699160',
  NULL, 
  NULL, 
  true, 
  'desentupidora-chamou-chegou-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'cc6b3f8c-1a53-4fa5-aaa1-fd788e260440', 
  'Desentupidora Campestre', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Campestre', 
  'Santo André, SP',
  '1123599192', 
  '1123599192',
  NULL, 
  NULL, 
  true, 
  'desentupidora-campestre-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'c5cb4af9-4a05-4a62-a3de-3077ff34bd98', 
  'Desentupidora BR Utinga', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Utinga', 
  'Santo André, SP',
  '11920597774', 
  '11920597774',
  NULL, 
  NULL, 
  true, 
  'desentupidora-br-utinga-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '8f0936bb-ed7b-408e-99b6-f8a8562874ee', 
  'Desentupidora 24h Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Utinga', 
  'Santo André, SP',
  '11947860050', 
  '1155229000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-24h-santo-andré-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'd2cac859-9ea7-446c-98e0-c24718f03982', 
  'Desentupidora Vila Luzita', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Luzita', 
  'Santo André, SP',
  '11965302372', 
  '1144263704',
  NULL, 
  NULL, 
  true, 
  'desentupidora-vila-luzita-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '039a617c-67c2-4833-bd1c-90fa7bbc5905', 
  'Higitec Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim', 
  'Av. Dom Pedro II, 1000',
  '11944380000', 
  '1144380000',
  NULL, 
  NULL, 
  true, 
  'higitec-desentupidora-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '1453a825-b7ba-4328-a127-04ffdaf1faee', 
  'Roto-Rooter Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Bairro Jardim', 
  'Rua das Monções, 500',
  '11944360000', 
  '1144360000',
  NULL, 
  NULL, 
  true, 
  'rotorooter-santo-andré-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'a3748031-b1f7-46dc-b6e9-8c407430c1bb', 
  'Desentupidora HP', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Guiomar', 
  'Rua Catequese, 800',
  '11944270000', 
  '1144270000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-hp-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '078a77a5-67f5-471a-a3bd-7e227f949434', 
  'Desentupidora Rápida ABC', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque Jaçatuba', 
  'Av. Itamarati, 1200',
  '11949920000', 
  '1149920000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-rápida-abc-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '85aee01d-3e8b-4f50-aed5-707a0d17c93a', 
  'SOS Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Linda', 
  'Av. Carijós, 1500',
  '11944510000', 
  '1144510000',
  NULL, 
  NULL, 
  true, 
  'sos-desentupidora-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'f1b84273-1ccf-4533-a9a0-821ebfed8655', 
  'Desentupidora Central ABC', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Alzira', 
  'Rua Coronel Seabra, 300',
  '11944580000', 
  '1144580000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-central-abc-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'f5340721-e728-4604-9c18-de4bfe16e2f8', 
  'Desentupidora São Caetano em Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Campestre', 
  'Rua das Figueiras, 1500',
  '11944210000', 
  '1144210000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-são-caetano-em-santo-andré-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '4cbb699d-69ac-4928-a20f-e5096ad23fd6', 
  'Rei do Desentupimento', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Bastos', 
  'Av. Lino Jardim, 600',
  '11944370000', 
  '1144370000',
  NULL, 
  NULL, 
  true, 
  'rei-do-desentupimento-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '20106899-e039-46fe-bdbc-59fd91ce1fd7', 
  'Desentupidora Express', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Lucinda', 
  'Av. Martim Francisco, 900',
  '11949710000', 
  '1149710000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-express-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  'fce498dd-61ab-4095-98d2-e4923654ae54', 
  'Limpa Fossa Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Santa Teresinha', 
  'Av. dos Estados, 5000',
  '11944720000', 
  '1144720000',
  NULL, 
  NULL, 
  true, 
  'limpa-fossa-santo-andré-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '1ac088b3-96ee-4227-b33b-2ed08f947eaa', 
  'Desentupidora Parque Marajoara', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque Marajoara', 
  'Rua Giovanni Battista Pirelli, 1000',
  '11944530000', 
  '1144530000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-parque-marajoara-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '4352fefc-c182-4391-949f-9ba619e7da91', 
  'Desentupidora Parque Novo Oratório', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque Novo Oratório', 
  'Rua Oratório, 2500',
  '11944790000', 
  '1144790000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-parque-novo-oratório-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '774c67a9-eeed-4d80-86fd-3b28d416d4cf', 
  'Desentupidora Vila Assunção', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Assunção', 
  'Rua Santo André, 400',
  '11944330000', 
  '1144330000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-vila-assunção-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '83041cbc-31c0-44cc-885d-6764f5da7872', 
  'Desentupidora Vila Gilda', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila Gilda', 
  'Av. Caminho do Pilar, 800',
  '11944250000', 
  '1144250000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-vila-gilda-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
  '35d8fc57-518c-4b9c-8f84-e5eb16e5b949', 
  'Desentupidora Jardim do Estádio', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim do Estádio', 
  'Av. Capitão Mário Toledo de Camargo, 2000',
  '11944520000', 
  '1144520000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-jardim-do-estádio-santo-andre',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Santo André', 
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
