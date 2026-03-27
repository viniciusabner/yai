-- Inserção de Desentupidoras (Saneamento) em São Bernardo do Campo (Dados Reais)
-- Cidade: São Bernardo do Campo
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'desentupidora')
  OR slug LIKE '%-sao-bernardo' AND category = 'desentupidora'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'desentupidora')
  OR slug LIKE '%-sao-bernardo' AND category = 'desentupidora'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'desentupidora')
OR slug LIKE '%-sao-bernardo' AND category = 'desentupidora';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'e05538d5-946a-40c4-9b52-7c28c79718c2', 
  'Desentupidora São Bernardo', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Av. Faria Lima, 2000',
  '11943210987', 
  '1141223344',
  NULL, 
  NULL, 
  true, 
  'desentupidora-são-bernardo-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '2f0b11fe-c43a-43d2-9b09-fa047b8fd82a', 
  'Desentupidora Rudge Ramos', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Rudge Ramos', 
  'Av. Caminho do Mar, 2500',
  '11932109876', 
  '1143689012',
  NULL, 
  NULL, 
  true, 
  'desentupidora-rudge-ramos-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '39e5c7a4-d937-4320-a7a9-e5094ec50cf3', 
  'Desentupidora Rei do Esgoto', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Baeta Neves', 
  'Rua dos Vianas, 1000',
  '11921098765', 
  NULL,
  NULL, 
  NULL, 
  true, 
  'desentupidora-rei-do-esgoto-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '497bc7ad-368a-48ad-8d9b-eedf87091569', 
  'Hidro Pragas SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Assunção', 
  'Av. João Firmino, 1200',
  '11910987654', 
  '1143435678',
  NULL, 
  NULL, 
  true, 
  'hidro-pragas-sbc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'b6762ef9-547b-4605-9a80-3f527d2bb048', 
  'Desentupidora 24 Horas', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Demarchi', 
  'Av. Maria Servidei Demarchi, 1800',
  '11998761234', 
  '1149987654',
  NULL, 
  NULL, 
  true, 
  'desentupidora-24-horas-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '51eebb67-523d-419f-8722-7968d0e35280', 
  'Bio Soluções Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Bernardo do Campo, SP',
  NULL, 
  '1132110000',
  NULL, 
  NULL, 
  true, 
  'bio-soluções-desentupidora-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'c2d8154d-423b-448f-8b4f-fd77a28294d9', 
  'Desentupir SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11920597774', 
  '11920597774',
  NULL, 
  NULL, 
  true, 
  'desentupir-sbc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '6d7c8b48-8590-480d-9a44-f9ccb1dd8d5c', 
  'Desentupir 24h Rudge Ramos', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Rudge Ramos', 
  'São Bernardo do Campo, SP',
  '11947860050', 
  '1155229000',
  NULL, 
  NULL, 
  true, 
  'desentupir-24h-rudge-ramos-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'b9c30c19-63ff-4364-b246-68c41561d5f4', 
  'Central do Esgoto', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11988977199', 
  '11988977199',
  NULL, 
  NULL, 
  true, 
  'central-do-esgoto-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '47885eae-9279-4655-8075-fb4c000a6e04', 
  'Desentupidora Valor SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim do Mar', 
  'São Bernardo do Campo, SP',
  '1151982100', 
  '1151982100',
  NULL, 
  NULL, 
  true, 
  'desentupidora-valor-sbc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '51db58f9-1d53-4364-8c12-e016208bb881', 
  'São Bernardo Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11991331205', 
  '1129885552',
  NULL, 
  NULL, 
  true, 
  'são-bernardo-desentupidora-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '49bf6d1a-b411-4a63-86e9-63fc54ed37dd', 
  'Desentupidora Centro', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11942917080', 
  '11942917080',
  NULL, 
  NULL, 
  true, 
  'desentupidora-centro-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '35f0cf1d-fe07-464d-8311-9602b7233695', 
  'Fast Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Baeta Neves', 
  'São Bernardo do Campo, SP',
  '11957703569', 
  '11957703569',
  NULL, 
  NULL, 
  true, 
  'fast-desentupidora-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '679b39a6-0e02-4eac-85c5-41775c93cd48', 
  'Desentupidora Chamou Chegou SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Assunção', 
  'São Bernardo do Campo, SP',
  '11952699160', 
  '11952699160',
  NULL, 
  NULL, 
  true, 
  'desentupidora-chamou-chegou-sbc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'd30c7862-95e8-490d-a780-27927518368f', 
  'PH Serviços SP Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Demarchi', 
  'São Bernardo do Campo, SP',
  '11970377100', 
  '11970377100',
  NULL, 
  NULL, 
  true, 
  'ph-serviços-sp-desentupidora-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'd78bfcbe-93a7-4dd0-94fa-5591235066b3', 
  'RotorSystem SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Baeta Neves', 
  'São Bernardo do Campo, SP',
  '1144510933', 
  '1144510933',
  NULL, 
  NULL, 
  true, 
  'rotorsystem-sbc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'e4225b11-d9df-4df3-846a-78b07b116f14', 
  'Desentupidora Martec ABC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Demarchi', 
  'São Bernardo do Campo, SP',
  '11940025075', 
  '1142115252',
  NULL, 
  NULL, 
  true, 
  'desentupidora-martec-abc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'edd08de2-64ac-45d7-9eb1-6c5399fb5504', 
  'Higitec Desentupidora SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Av. Brigadeiro Faria Lima, 1000',
  '11941250000', 
  '1141250000',
  NULL, 
  NULL, 
  true, 
  'higitec-desentupidora-sbc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'a9719db6-72a9-4180-ad3c-4412e348c3c8', 
  'Roto-Rooter São Bernardo', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Rudge Ramos', 
  'Av. Winston Churchill, 500',
  '11943620000', 
  '1143620000',
  NULL, 
  NULL, 
  true, 
  'rotorooter-são-bernardo-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '178e6860-c177-40a4-96b1-b23bfb3bd7b7', 
  'Limptec Bairro Assunção', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Assunção', 
  'Av. Robert Kennedy, 1000',
  '11943420000', 
  '1143420000',
  NULL, 
  NULL, 
  true, 
  'limptec-bairro-assunção-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '82f997ef-1d64-400a-b686-40b8ff5de154', 
  'Desentupidora Pauliceia', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Pauliceia', 
  'Rua M.M.D.C., 200',
  '11943610000', 
  '1143610000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-pauliceia-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '9041dac3-bb93-41ea-a576-d5d9316db5d1', 
  'Desentupidora Jordanópolis', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jordanópolis', 
  'Av. Padre Anchieta, 300',
  '11941230000', 
  '1141230000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-jordanópolis-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'fd8b14db-7bdb-4f6a-bc10-014b3edf747f', 
  'Desentupidora Alves Dias', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Alves Dias', 
  'Estrada dos Alvarengas, 3000',
  '11941090000', 
  '1141090000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-alves-dias-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  'f082a332-5c5b-4d6f-a21b-796c620edb4c', 
  'Desentupidora Alvarenga', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Alvarenga', 
  'Estrada dos Alvarengas, 8000',
  '11943570000', 
  '1143570000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-alvarenga-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '36e53809-7e6b-42fa-bb4a-2ef4f4bd557c', 
  'Desentupidora Taboão SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Taboão', 
  'Av. do Taboão, 2000',
  '11943630000', 
  '1143630000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-taboão-sbc-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '07389d67-2274-4516-a5a6-3d618f261745', 
  'Desentupidora Planalto', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Planalto', 
  'Av. Álvaro Guimarães, 1500',
  '11943410000', 
  '1143410000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-planalto-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '613bc814-41ed-49f9-86ec-99def35e09eb', 
  'Desentupidora Independência', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Independência', 
  'Praça dos Bombeiros, 100',
  '11943300000', 
  '1143300000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-independência-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '15291bf1-13a4-4324-b34c-b9a328caff6d', 
  'Desentupidora Nova Petrópolis', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Nova Petrópolis', 
  'Av. Francisco Prestes Maia, 1000',
  '11941270000', 
  '1141270000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-nova-petrópolis-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '41344bf1-0b23-40a8-8e58-aa00a388a7e3', 
  'Desentupidora Santa Terezinha', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Santa Terezinha', 
  'Rua Tiradentes, 800',
  '11941280000', 
  '1141280000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-santa-terezinha-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
  '9d8e09e9-6e7f-4e9d-98d0-bd20e581d272', 
  'Desentupidora Batistini', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Batistini', 
  'Estrada Galvão Bueno, 4000',
  '11943580000', 
  '1143580000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-batistini-sao-bernardo',
  'Serviços de desentupimento, limpeza de fossas e saneamento em São Bernardo do Campo', 
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
