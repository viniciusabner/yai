-- Inserção de Serralheiros (Estruturas Metálicas) em Diadema (Dados Reais)
-- Cidade: Diadema
-- Categoria: Buscada via Subquery (Serralheiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'serralheiro')
  OR slug LIKE '%-diadema' AND category = 'serralheiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'serralheiro')
  OR slug LIKE '%-diadema' AND category = 'serralheiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'diadema') AND category = 'serralheiro')
OR slug LIKE '%-diadema' AND category = 'serralheiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'e561af8f-b193-4061-b113-ffb88e10834a', 
  'JC Serralheria', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Piraporinha', 
  'Diadema, SP',
  '11954279501', 
  '1140497581',
  NULL, 
  NULL, 
  true, 
  'jc-serralheria-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '7805a7fe-4b7c-4dad-bbd5-77c41cbe6880', 
  'Artefama Esquadrias', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Diadema, SP',
  '11967138717', 
  '1140568719',
  NULL, 
  NULL, 
  true, 
  'artefama-esquadrias-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'c185ca5c-5aa5-4f9a-8ccd-ad017cf5b022', 
  'Serralheria Piraporinha', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Piraporinha', 
  'R. dos Miosótis, 213',
  '1140753540', 
  '1140753540',
  NULL, 
  NULL, 
  true, 
  'serralheria-piraporinha-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '6626c436-ca02-42db-ac35-b9b45bebc188', 
  'CFS Serralheria', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Rua dos Rubis, 178',
  '11940347368', 
  '11940347368',
  NULL, 
  NULL, 
  true, 
  'cfs-serralheria-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'f660c485-2d7a-46c9-ba04-a54b9eb4b523', 
  'Aço Diadema', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Salgado de Castro',
  '1129699012', 
  '1129699012',
  NULL, 
  NULL, 
  true, 
  'aço-diadema-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '79d8e206-6459-4594-9c5e-6b54c34c56ad', 
  'Jp Serralheria', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Serraria', 
  'Estrada do Rufino (Vl Sta Antonia), 637',
  '1179802696', 
  '1179802696',
  NULL, 
  NULL, 
  true, 
  'jp-serralheria-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'c20ca8e0-23a8-4be6-895f-90bff7228af3', 
  'Serralheria Sol', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Serraria', 
  'Diadema, SP',
  '1140511687', 
  '1140511687',
  NULL, 
  NULL, 
  true, 
  'serralheria-sol-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '583d2356-3073-47b4-aa49-c8f99e889317', 
  'Artes São Paulo Serralheria Artística', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Campanário', 
  'R. Albatroz, 156',
  '1128056829', 
  '1128056829',
  NULL, 
  NULL, 
  true, 
  'artes-são-paulo-serralheria-artística-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '508f278c-c41b-45a0-b5ad-6800fc22d28a', 
  'Serralheria Império da Arte', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Campanário', 
  'Rua Eca de Queiroz, 302',
  '11962870334', 
  '11962870334',
  NULL, 
  NULL, 
  true, 
  'serralheria-império-da-arte-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'a2025c94-8ac2-4e4c-a436-fd567bc31a4c', 
  'JRD Estruturas Metálicas', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Campanário', 
  'Diadema, SP',
  '11987755576', 
  '11987755576',
  NULL, 
  NULL, 
  true, 
  'jrd-estruturas-metálicas-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'abb79a60-baf3-4c40-8954-680db29761ff', 
  'Vulcano Serralheria', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Piraporinha', 
  'Diadema, SP',
  '1128051805', 
  '1128051805',
  NULL, 
  NULL, 
  true, 
  'vulcano-serralheria-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '101528b4-40d2-4a54-abc3-134be90428ed', 
  'NGT Portões Automáticos', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Piraporinha', 
  'Diadema, SP',
  '1140716237', 
  '1140716237',
  NULL, 
  NULL, 
  true, 
  'ngt-portões-automáticos-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'f6725a67-6799-4653-8616-54fcb4980966', 
  'Piraporinha Portões', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Piraporinha', 
  'Diadema, SP',
  '1140677993', 
  '1140677993',
  NULL, 
  NULL, 
  true, 
  'piraporinha-portões-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '6088a886-5163-410c-b466-ad1999648b71', 
  'Serralheria Eldorado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Eldorado', 
  'Avenida Nossa Senhora dos Navegantes, 1616',
  '1140494133', 
  '1140494133',
  NULL, 
  NULL, 
  true, 
  'serralheria-eldorado-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'f30f44f5-fe72-466e-8a55-b7ce82e13c90', 
  'Erdape Serralheria', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Taboão', 
  'Av. Água Funda, 449',
  '11985220708', 
  '1123345848',
  NULL, 
  NULL, 
  true, 
  'erdape-serralheria-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'c8774e5c-e425-4e1d-bd46-ed1006cdd802', 
  'Tropical Serralheria', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Taboão', 
  'R. Noruega, 97',
  '1140713944', 
  '1140713944',
  NULL, 
  NULL, 
  true, 
  'tropical-serralheria-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '5f7bef35-4031-4eab-919f-b84443b20342', 
  'Diafer Serralheria', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Taboão', 
  'Rua Portugal, 16',
  '1140753626', 
  '1140753626',
  NULL, 
  NULL, 
  true, 
  'diafer-serralheria-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '369cc904-cd6c-4a00-b35e-14bcbf6fe11f', 
  'Serralheria Inamar', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Inamar', 
  'Rua Canopo, 82',
  '1140492855', 
  '1140492855',
  NULL, 
  NULL, 
  true, 
  'serralheria-inamar-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'a83cd895-2e4e-49b3-a6aa-beaa50ff93db', 
  'Ferragens Eldorado', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Eldorado', 
  'Diadema, SP',
  '1140436094', 
  '1140436094',
  NULL, 
  NULL, 
  true, 
  'ferragens-eldorado-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  'a74d939b-468a-444d-bcbe-da0261487e3e', 
  'Metalúrgica Diadema', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Centro', 
  'Diadema, SP',
  '1140510000', 
  '1140510000',
  NULL, 
  NULL, 
  true, 
  'metalúrgica-diadema-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '3499dbf4-b8a6-47fe-b25d-f5c1a32d4d09', 
  'Serralheria ABC Diadema', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Serraria', 
  'Diadema, SP',
  '1140430000', 
  '1140430000',
  NULL, 
  NULL, 
  true, 
  'serralheria-abc-diadema-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
  '8111cea1-9792-48a6-846b-2c50b79202d9', 
  'Estruturas Metálicas Diadema', 
  (SELECT id FROM cities WHERE slug = 'diadema'), 
  (SELECT id FROM categories WHERE slug = 'serralheiro' OR name ILIKE '%Serralher%' LIMIT 1), 
  'serralheiro', 
  'Taboão', 
  'Diadema, SP',
  '1140560000', 
  '1140560000',
  NULL, 
  NULL, 
  true, 
  'estruturas-metálicas-diadema-diadema',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Diadema', 
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
