-- Inserção de Montadores de Móveis em Diadema (Apenas Verificados)
-- Cidade ID: (Buscado via Subquery ou 205e475f-44aa-418f-8835-434cd5e913d2)
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'diadema') 
    OR city_id = '205e475f-44aa-418f-8835-434cd5e913d2'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'diadema') 
    OR city_id = '205e475f-44aa-418f-8835-434cd5e913d2'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM providers 
WHERE (
  city_id = (SELECT id FROM cities WHERE slug = 'diadema') 
  OR city_id = '205e475f-44aa-418f-8835-434cd5e913d2'
) 
AND category = 'montador_moveis';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '433ab5fd-3365-4841-9a52-c5dc6a629b48', 
  'Montador Express', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Diadema, SP',
  '11985162213', 
  '11985162213', 
  NULL, 
  NULL, 
  true, 
  'montador-express-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '02e1d560-ab3a-4c77-b2f6-9845589ea992', 
  'Montador Diadema Zap', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Diadema, SP',
  '19997570064', 
  '19997570064', 
  NULL, 
  NULL, 
  true, 
  'montador-diadema-zap-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  'b5ff9479-5ec7-489e-8b95-48a2d5090501', 
  'Cícero Online Montador', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Canhema', 
  'Canhema, Diadema',
  '11986709949', 
  '11986709949', 
  NULL, 
  NULL, 
  true, 
  'c-cero-online-montador-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  'cccb9b0a-b7f8-4570-836d-7d0ecb5c9e51', 
  'Monta Fácil Oficial', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Diadema, SP',
  '11913436359', 
  '11913436359', 
  NULL, 
  NULL, 
  true, 
  'monta-f-cil-oficial-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '945fbc53-b23a-49d1-a03e-5027d361e623', 
  'Montador Diadema WhatsApp', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Piraporinha', 
  'Diadema, SP',
  '11959215823', 
  '11959215823', 
  NULL, 
  NULL, 
  true, 
  'montador-diadema-whatsapp-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '465950f3-4f0d-4866-836e-6de62aaf4f6d', 
  'Montador de Móveis Diadema', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Diadema, SP',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-de-m-veis-diadema-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '690d9c05-09c7-4710-bd27-cdef13829c47', 
  'Daniel Os Verificados', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Diadema, SP',
  '31996902316', 
  '31996902316', 
  NULL, 
  NULL, 
  true, 
  'daniel-os-verificados-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '80706078-cba4-49f9-9141-c56b81a7e5d1', 
  'Montador Profissional Diadema', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Diadema, SP',
  '11933136019', 
  '11933136019', 
  NULL, 
  NULL, 
  true, 
  'montador-profissional-diadema-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '138c227c-f858-4f6c-b7a8-b0fb86fab77c', 
  'Montador Vila Nogueira', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Nogueira', 
  'Av. Piraporinha, Vila Nogueira',
  '11937253650', 
  '11937253650', 
  NULL, 
  NULL, 
  true, 
  'montador-vila-nogueira-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  'd29dd84f-a80c-44bd-b95b-72d2dc93dc2c', 
  'POM Diadema', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Nogueira', 
  'Diadema, SP',
  '11946244090', 
  '11946244090', 
  NULL, 
  NULL, 
  true, 
  'pom-diadema-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  'c0959e75-1f97-4deb-978f-4d21a83ca820', 
  'Montador Serraria', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Serraria', 
  'Serraria, Diadema',
  '11973048490', 
  '11973048490', 
  NULL, 
  NULL, 
  true, 
  'montador-serraria-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '1f7adbc5-876a-42a0-bacd-663c46383643', 
  'Alves Montador', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Eldorado', 
  'Eldorado, Diadema',
  '11981582253', 
  '11981582253', 
  NULL, 
  NULL, 
  true, 
  'alves-montador-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
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
  '91ca6a6b-81de-48d1-b5b4-4df5a7190c07', 
  'Carlos Alberto ABC', 
  (SELECT id FROM cities WHERE slug = 'diadema' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Canhema', 
  'Canhema, Diadema',
  '11967730798', 
  '11967730798', 
  NULL, 
  NULL, 
  true, 
  'carlos-alberto-abc-diadema',
  'Serviços de montagem e desmontagem de móveis em Diadema (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
