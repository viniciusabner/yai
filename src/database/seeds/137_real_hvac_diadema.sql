-- Inserção de Técnicos em Ar Condicionado em Diadema (Dados Reais)
-- Cidade: Diadema
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-diadema' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-diadema' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-diadema' AND category = 'tecnico_ar_condicionado';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '61394228-9f31-49a2-a0a9-d917c4da684d', 
  'SRS Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Piraporinha', 
  'Rua Carumbata, 75 - Conj. 02',
  '11974032390', 
  '11982580578',
  NULL, 
  NULL, 
  true, 
  'srs-ar-condicionado-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  '3237bfb4-013d-4385-9d51-7ca12a28fa03', 
  'BelluAr Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rua Corunha, 16',
  '11947196341', 
  '1156218211',
  NULL, 
  NULL, 
  true, 
  'belluar-ar-condicionado-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  '301bcaae-0c03-4f3e-a9fd-0fe6235d92d8', 
  'Artec Service', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Diadema, SP',
  '11948762120', 
  '1146163314',
  NULL, 
  NULL, 
  true, 
  'artec-service-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  '8c1296bf-fa71-4dfe-a6b5-7c878f366def', 
  'Horvath Ar', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Serraria', 
  'Diadema, SP',
  '11942055738', 
  '1142329960',
  NULL, 
  NULL, 
  true, 
  'horvath-ar-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  '90621f8c-7dee-4397-9df7-4914c3f36cb1', 
  'ABC Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Diadema, SP',
  '1142385738', 
  '1142385738',
  NULL, 
  NULL, 
  true, 
  'abc-ar-condicionado-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  '4652e9d3-bd59-40ce-8cd5-a3dda5fba11c', 
  'Raia Radiadores e Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Vila Nogueira', 
  'Avenida Piraporinha, 1895',
  '11945234475', 
  '1123118345',
  NULL, 
  NULL, 
  true, 
  'raia-radiadores-e-ar-condicionado-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  'cef896d0-fbf6-4b28-8b50-cbd01b05b838', 
  'Air Focus Ar Condicionado E Refrigeração', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Piraporinha', 
  'Rua Maria Luiza, 155',
  '1123551940', 
  '1123551940',
  NULL, 
  NULL, 
  true, 
  'air-focus-ar-condicionado-e-refrigeração-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  'f5ca59e2-adfa-43a5-afbd-2d44022f4eb9', 
  'União Ar-condicionado e Refrigeração', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Avenida Piraporinha, 464',
  '1140712988', 
  '1140712988',
  NULL, 
  NULL, 
  true, 
  'união-arcondicionado-e-refrigeração-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  'fe4ed865-9667-423f-869e-66f7cf3dba91', 
  'Assistência Técnica JS', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Serraria', 
  'Diadema, SP',
  '11974277624', 
  '11974277624',
  NULL, 
  NULL, 
  true, 
  'assistência-técnica-js-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  'a6e12c06-f775-4834-a97d-7ea3f876963a', 
  'A M Firmino Ar Condicionado Eldorado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Eldorado', 
  'Rua Aruana, 175',
  '1140592893', 
  '1140592893',
  NULL, 
  NULL, 
  true, 
  'a-m-firmino-ar-condicionado-eldorado-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  'eb3e471b-c1d0-4aa1-aafa-220db976b205', 
  'CGS Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Diadema, SP',
  '1127423499', 
  '1127423499',
  NULL, 
  NULL, 
  true, 
  'cgs-ar-condicionado-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  'd0c0de60-80cc-44e2-a481-a339e8f5dba3', 
  'DL Climatização', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Diadema, SP',
  '11965240944', 
  '11965240944',
  NULL, 
  NULL, 
  true, 
  'dl-climatização-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
  '92a4b6dc-c897-4a1f-a3cd-134d97c0ea0b', 
  'TKL Serv', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Diadema, SP',
  '1126679940', 
  '1126679940',
  NULL, 
  NULL, 
  true, 
  'tkl-serv-diadema',
  'Serviços e instalações de Ar Condicionado e Climatização em Diadema', 
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
