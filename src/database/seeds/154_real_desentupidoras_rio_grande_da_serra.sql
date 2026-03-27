-- Inserção de Desentupidoras (Saneamento) em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'desentupidora')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'desentupidora'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'desentupidora')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'desentupidora'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'desentupidora')
OR slug LIKE '%-rio-grande-da-serra' AND category = 'desentupidora';

INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '7bb1d2f4-1511-4f15-ae10-30aa313f37a8', 
  'Bio Soluções', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1132110000', 
  '1132110000',
  NULL, 
  NULL, 
  true, 
  'bio-soluções-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  'b4933e5d-b4f2-4035-8c96-76b96a51313e', 
  'Desentupidora em RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11920597774', 
  '11920597774',
  NULL, 
  NULL, 
  true, 
  'desentupidora-em-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '7d3f9d86-eaaa-4cbd-8869-0dad4ba3ff59', 
  'Santec Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11940007818', 
  '11940007818',
  NULL, 
  NULL, 
  true, 
  'santec-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '6e10b566-1d37-4053-9a70-48a8de37597d', 
  'Hidromix Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1158194555', 
  '1158194555',
  NULL, 
  NULL, 
  true, 
  'hidromix-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '451c57e1-34a1-4bca-b12a-285b70f368cc', 
  'Desentupidora Chamou Chegou', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11952699160', 
  '11952699160',
  NULL, 
  NULL, 
  true, 
  'desentupidora-chamou-chegou-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  'c806b742-1bf7-4754-9ace-240ad2370b23', 
  'Desentupidora Local', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1156689000', 
  '1156689000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-local-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  'e952dfa6-44eb-4820-a0c7-0f020088fcba', 
  'Desentupidora Brasileira', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1146372538', 
  '1146372538',
  NULL, 
  NULL, 
  true, 
  'desentupidora-brasileira-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  'b94fdda2-08e6-45c4-8459-97f373f6385a', 
  'Compasan', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '1151971503', 
  '1151971503',
  NULL, 
  NULL, 
  true, 
  'compasan-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  'b6026077-2953-459f-b043-56c8f3abf5cc', 
  'Ubaservice Desentupimento', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Vila São João', 
  'Rio Grande da Serra, SP',
  '12991697309', 
  '12991697309',
  NULL, 
  NULL, 
  true, 
  'ubaservice-desentupimento-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '59bb3995-9740-4fb2-857f-a66c667a3831', 
  'DeltaPrag RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '11947275351', 
  '1155222000',
  NULL, 
  NULL, 
  true, 
  'deltaprag-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '4d01151b-f033-424a-8332-911ed229a5c5', 
  'Desentupidora Hidroleste RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '11961652024', 
  '11961652024',
  NULL, 
  NULL, 
  true, 
  'desentupidora-hidroleste-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '9b57382e-2289-4cfb-a82e-813d9493665d', 
  'Desentupidora RGS 24 Horas', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '11941822206', 
  '11941822206',
  NULL, 
  NULL, 
  true, 
  'desentupidora-rgs-24-horas-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '1d7ba2d5-7623-42ee-81f0-01c0376b3d15', 
  'Desentupidora Esgoto Limpo', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Recanto das Rosas', 
  'Rio Grande da Serra, SP',
  '1129921000', 
  '1129921000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-esgoto-limpo-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '1368ef80-8e98-454d-9794-a1dffdda48a3', 
  'ON Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Recanto das Rosas', 
  'Rio Grande da Serra, SP',
  '11991166588', 
  '11991166588',
  NULL, 
  NULL, 
  true, 
  'on-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '88bbf100-ecbf-43d8-a2f3-d115acab6e87', 
  'Ótima Desentupidora RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Recanto das Rosas', 
  'Rio Grande da Serra, SP',
  '11978595935', 
  '11978595935',
  NULL, 
  NULL, 
  true, 
  'ótima-desentupidora-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '5abf8e0a-42a6-431a-8142-9bcf1a2b64d4', 
  'Limpa Fossa RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1151989630', 
  '1151989630',
  NULL, 
  NULL, 
  true, 
  'limpa-fossa-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  '14b8aefd-8c59-43f4-9e8a-504159319c20', 
  'Sadesp Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11970715000', 
  '11970715000',
  NULL, 
  NULL, 
  true, 
  'sadesp-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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
  'a8a8671e-1626-4636-a156-6949a5112fb7', 
  'Desentupidora Resolve Já', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'desentupidora' OR name ILIKE '%Desentupidor%' LIMIT 1), 
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11942917080', 
  '11942917080',
  NULL, 
  NULL, 
  true, 
  'desentupidora-resolve-já-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

