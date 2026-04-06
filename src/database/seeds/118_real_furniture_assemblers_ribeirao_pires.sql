-- Inserção de Montadores de Móveis em Ribeirão Pires (Apenas Verificados)
-- Cidade: Ribeirão Pires (ID buscado via subquery)
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'montador_moveis')
  OR slug LIKE '%-ribeirao-pires'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'montador_moveis')
  OR slug LIKE '%-ribeirao-pires'
);

DELETE FROM providers 
WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'montador_moveis')
OR slug LIKE '%-ribeirao-pires';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  'a360bf85-f04c-45f3-aeb5-afd016d7923e', 
  'Montador Gabriel', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11945042992', 
  '11945042992', 
  NULL, 
  NULL, 
  true, 
  'montador-gabriel-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category, 
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
  'e95e7f75-1c7f-4157-8487-5ebdd46bfba0', 
  'Montador Metrópoles', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11944421697', 
  '11944421697', 
  NULL, 
  NULL, 
  true, 
  'montador-metr-poles-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
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
  '1b4a35dc-c53e-4a30-aac4-5b4773e315e2', 
  'Montador Estação', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11945267021', 
  '11945267021', 
  NULL, 
  NULL, 
  true, 
  'montador-esta-o-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
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
  '09909cf8-00c7-4bd9-87f8-47450f155615', 
  'Montador Prefeito Valdírio', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Av. Prefeito Valdírio Prisco, Ribeirão Pires',
  '11973048490', 
  '11973048490', 
  NULL, 
  NULL, 
  true, 
  'montador-prefeito-vald-rio-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
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
  'b81c4f50-d06c-4e42-b5c0-0b2efed1e66b', 
  'JK Marido de Aluguel', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Barro Branco', 
  'Ribeirão Pires, SP',
  '11988794041', 
  '11988794041', 
  NULL, 
  NULL, 
  true, 
  'jk-marido-de-aluguel-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
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
  '0384af6c-5cc8-4291-a6c1-edb35ce75cd1', 
  'Montador Ouro Fino', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Ouro Fino Paulista', 
  'Ouro Fino Paulista, Ribeirão Pires',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-ouro-fino-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
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
  '7a2be301-802f-47e6-87e5-e89375efeb68', 
  'Montadora Mcasa', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Rua Reynaldo Manuel, Ribeirão Pires',
  '11992304602', 
  '11992304602', 
  NULL, 
  NULL, 
  true, 
  'montadora-mcasa-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
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
  'fdb591fe-db81-4cce-aeba-18f6854798c0', 
  'WhatsApp Montador', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Ribeirão Pires, SP',
  '19995085811', 
  '19995085811', 
  NULL, 
  NULL, 
  true, 
  'whatsapp-montador-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
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
  'f95e2edb-dc30-447f-9cae-bc174ad2c6f8', 
  'Martelix RP', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11995743555', 
  '11995743555', 
  NULL, 
  NULL, 
  true, 
  'martelix-rp-ribeirao-pires',
  'Serviços de montagem e desmontagem de móveis em Ribeirão Pires (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
