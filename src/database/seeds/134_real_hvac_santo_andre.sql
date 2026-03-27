-- Inserção de Técnicos em Ar Condicionado em Santo André (Dados Reais)
-- Cidade: Santo André
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-santo-andre' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-santo-andre' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-santo-andre' AND category = 'tecnico_ar_condicionado';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'fbd9a741-e743-4cac-a425-70466b9d46bc', 
  'Cold Quality', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '11992834907', 
  '1143036227',
  NULL, 
  NULL, 
  true, 
  'cold-quality-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  'c50cdd76-2a82-4318-b405-a181757e8f8b', 
  'ABC Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '1142385738', 
  '1142385738',
  NULL, 
  NULL, 
  true, 
  'abc-ar-condicionado-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '35b09216-5acf-4877-8a00-bbbcde3b72fc', 
  'Técnico Ar-Condicionado Santo André Carrier', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '11962311982', 
  '1136443392',
  NULL, 
  NULL, 
  true, 
  'técnico-arcondicionado-santo-andré-carrier-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '42793a32-5ed3-427f-a0bd-96b385efb75a', 
  'JDR Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '11917336444', 
  '11917336444',
  NULL, 
  NULL, 
  true, 
  'jdr-ar-condicionado-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '4c7c79d5-9d31-4d7d-9326-4f83056c9ac3', 
  'HORVATH Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '1142329960', 
  '1142329960',
  NULL, 
  NULL, 
  true, 
  'horvath-ar-condicionado-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '2967959a-8011-4874-a698-e2c25a382585', 
  'O Rey do Ar Condicionado (Grupo 4S)', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '1141174113', 
  '1128915777',
  NULL, 
  NULL, 
  true, 
  'o-rey-do-ar-condicionado-grupo-4s-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '82976472-7441-482f-b147-56cb1fad7b20', 
  'Eletrônica Giovani', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '1144267746', 
  '1144267746',
  NULL, 
  NULL, 
  true, 
  'eletrônica-giovani-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  'e8482b18-fea4-49a5-8af4-81948036e1a1', 
  'JC Assistência Técnica', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '11981065931', 
  '1123648076',
  NULL, 
  NULL, 
  true, 
  'jc-assistência-técnica-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  'cc650345-7bb6-40a5-97ef-71a3bd6d8aa2', 
  'ABC Tecnoar', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Campestre', 
  'Santo André, SP',
  '11940826711', 
  '1144274245',
  NULL, 
  NULL, 
  true, 
  'abc-tecnoar-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  'e8d8eb7b-041c-4478-a515-dad174053539', 
  'Assistência Profissional Eletrodomésticos Vila Luzita', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Vila Luzita', 
  'Santo André, SP',
  '11997327309', 
  '1120169215',
  NULL, 
  NULL, 
  true, 
  'assistência-profissional-eletrodomésticos-vila-luzita-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '6f0e4adc-b0aa-4396-8958-beadf83596bd', 
  'D Clima Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '11949993022', 
  '11949993022',
  NULL, 
  NULL, 
  true, 
  'd-clima-ar-condicionado-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '262cb4cb-0630-44ea-9b71-7c373794ff37', 
  'ABR Refrigerações Comercial', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Parque das Nações', 
  'R. Iugoslávia, 122',
  '11984840104', 
  '1149756944',
  NULL, 
  NULL, 
  true, 
  'abr-refrigerações-comercial-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
  '102f56cb-827e-4cfa-960c-dc5d00850a68', 
  'Climart Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Santo André, SP',
  '11982429946', 
  '11982429946',
  NULL, 
  NULL, 
  true, 
  'climart-ar-condicionado-santo-andre',
  'Serviços e instalações de Ar Condicionado e Climatização em Santo André', 
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
