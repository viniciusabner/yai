-- Inserção de Desentupidoras (Saneamento) em Ribeirão Pires (Dados Reais)
-- Cidade: Ribeirão Pires
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'desentupidora')
  OR slug LIKE '%-ribeirao-pires' AND category = 'desentupidora'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'desentupidora')
  OR slug LIKE '%-ribeirao-pires' AND category = 'desentupidora'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'desentupidora')
OR slug LIKE '%-ribeirao-pires' AND category = 'desentupidora';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '918fcf98-48a4-4ba9-9e03-a04372ee4a37', 
  'Desentupidora Mais Ribeirão Pires', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11920597774', 
  '11920597774',
  NULL, 
  NULL, 
  true, 
  'desentupidora-mais-ribeirão-pires-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '9a6d1c1e-c8e6-4c98-9615-06c83234ef28', 
  'JBC Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11968358991', 
  '11968358991',
  NULL, 
  NULL, 
  true, 
  'jbc-desentupidora-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '093fc782-42d9-4189-a357-291d0f98e4e4', 
  'Rei do Esgoto Ribeirão Pires', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11961652024', 
  '11944699801',
  NULL, 
  NULL, 
  true, 
  'rei-do-esgoto-ribeirão-pires-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '82c17b4a-99f4-44f0-9f31-f74eb9bbf63c', 
  'Desentupidora Ribeirão Pires 24h', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1138673710', 
  '1138673710',
  NULL, 
  NULL, 
  true, 
  'desentupidora-ribeirão-pires-24h-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '0793cc68-04e8-429c-8e4f-541001055298', 
  'Cidade Desentupimento', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11946699263', 
  '11946699263',
  NULL, 
  NULL, 
  true, 
  'cidade-desentupimento-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  'bd715fac-8966-44c2-ba69-8d8b4086a2ff', 
  'Desentupidora SP Ribeirão Pires', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11947437000', 
  '11947437000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-sp-ribeirão-pires-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '86314790-bae6-41c1-b177-2534412928e0', 
  'Desentupidora RP Centro', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11940007818', 
  '11940007818',
  NULL, 
  NULL, 
  true, 
  'desentupidora-rp-centro-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '12be0586-c177-464d-934f-e17528f81ff6', 
  'Super Limp Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11930710937', 
  '11930710937',
  NULL, 
  NULL, 
  true, 
  'super-limp-desentupidora-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '9c0d0587-6d94-4361-a60b-0f5a729d0e08', 
  'Desentupidora Brasileira', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1146372538', 
  '1146372538',
  NULL, 
  NULL, 
  true, 
  'desentupidora-brasileira-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  'd11a1916-a5ac-4013-918b-7c75448a8474', 
  'Desentupidora Guardião Ouro Fino', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Ouro Fino Paulista', 
  'Ribeirão Pires, SP',
  '1129127893', 
  '1129127893',
  NULL, 
  NULL, 
  true, 
  'desentupidora-guardião-ouro-fino-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '00276a21-4848-43f1-bc76-d8c5cb458f1a', 
  'Desentupidora Ouro Fino RP', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Ouro Fino Paulista', 
  'Ribeirão Pires, SP',
  '11941822206', 
  '11941822206',
  NULL, 
  NULL, 
  true, 
  'desentupidora-ouro-fino-rp-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '27d0608a-cc9c-47ee-87de-2e69debb2729', 
  'Ótima Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Quarta Divisão', 
  'Ribeirão Pires, SP',
  '11978595935', 
  '11978595935',
  NULL, 
  NULL, 
  true, 
  'ótima-desentupidora-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '3d4ab2bf-bd5e-46f8-8071-db1f280fab1a', 
  'Nova Capital Desentupidora Soma', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Soma', 
  'Ribeirão Pires, SP',
  '11945030569', 
  '11945030569',
  NULL, 
  NULL, 
  true, 
  'nova-capital-desentupidora-soma-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '4c757452-0e43-4838-b8e7-e199a49ed2c4', 
  'Limpa Fossa Ribeirão Pires', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Ribeirão Pires', 
  'Ribeirão Pires, SP',
  '1151973900', 
  '1151973900',
  NULL, 
  NULL, 
  true, 
  'limpa-fossa-ribeirão-pires-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
  '6834623b-8d92-46e9-b07b-92f1dabbd718', 
  'Desentupidora Rei dos Reis RP', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Jardim Ribeirão Pires', 
  'Ribeirão Pires, SP',
  '11948470437', 
  '11948470437',
  NULL, 
  NULL, 
  true, 
  'desentupidora-rei-dos-reis-rp-ribeirao-pires',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Ribeirão Pires', 
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
