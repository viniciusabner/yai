-- Inserção de Montadores de Móveis em São Bernardo do Campo (Dados Reais)
-- Cidade ID: 63f5d4df-256d-4732-8e51-feffc5ef7a5f
-- Categoria: Buscada via Subquery (Montador de Móveis)


-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') 
    OR city_id = '63f5d4df-256d-4732-8e51-feffc5ef7a5f'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') 
    OR city_id = '63f5d4df-256d-4732-8e51-feffc5ef7a5f'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM providers 
WHERE (
  city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') 
  OR city_id = '63f5d4df-256d-4732-8e51-feffc5ef7a5f'
) 
AND category = 'montador_moveis';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  'c3042922-27d7-4e7e-a736-38efdd8ccc33', 
  'Montador Express', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11985162213', 
  '11985162213', 
  NULL, 
  NULL, 
  true, 
  'montador-express-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '74bddd78-5f88-4f0b-9506-f967ce56caa0', 
  'Devanildo Santos Silva', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila São Pedro', 
  'Vila São Pedro, SBC',
  '11968890881', 
  '11968890881', 
  NULL, 
  NULL, 
  true, 
  'devanildo-santos-silva-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '94dcac78-1e9b-4a40-b937-8e802a9e1c3e', 
  'Montador de Móveis Roberto', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11961498143', 
  '11961498143', 
  NULL, 
  NULL, 
  true, 
  'montador-de-m-veis-roberto-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  'f9acfe5a-85cd-4601-9a11-90ff64b90418', 
  'POM Brasil - Gabriel', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11945042992', 
  '11945042992', 
  NULL, 
  NULL, 
  true, 
  'pom-brasil-gabriel-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '25dd941f-ac15-458d-8f22-fc07be537ec0', 
  'Montador Metrópoles', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11973039258', 
  '11973039258', 
  NULL, 
  NULL, 
  true, 
  'montador-metr-poles-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '0477139c-6fe1-4925-9819-ca86810235b0', 
  'Montador Alves Dias', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Alves Dias', 
  'Av. Humberto A. Castelo Branco',
  '11956798018', 
  '11956798018', 
  NULL, 
  NULL, 
  true, 
  'montador-alves-dias-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '1818d9d1-6c87-43fa-9f3b-060f8507d9d8', 
  'Montador 24 Horas', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11991368160', 
  '11991368160', 
  NULL, 
  NULL, 
  true, 
  'montador-24-horas-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '60c94c31-afcb-457b-8ea5-8e87a55e3132', 
  'Super Montagens', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Rudge Ramos', 
  'Rudge Ramos, SBC',
  '11958252239', 
  '11958252239', 
  NULL, 
  NULL, 
  true, 
  'super-montagens-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  'c7c7e08d-6844-4b49-b39a-667d10a3bdfa', 
  'Montador Rudge Ramos', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Rudge Ramos', 
  'Rua Harmonia, Rudge Ramos',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-rudge-ramos-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '18a990a1-532d-4c6e-b83f-45494c6b1375', 
  'Freitas Montador', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Rudge Ramos', 
  'São Bernardo do Campo, SP',
  '11949090024', 
  '11949090024', 
  NULL, 
  NULL, 
  true, 
  'freitas-montador-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  'ae5fef30-7a59-40e7-af59-ecc2424e5604', 
  'Montador Vila Baeta', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Baeta Neves', 
  'Vila Baeta Neves, SBC',
  '11942906615', 
  '11942906615', 
  NULL, 
  NULL, 
  true, 
  'montador-vila-baeta-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  'd869d174-ff4b-40b1-bd06-6b49aed8a11a', 
  'Alves Montador', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Alves Dias', 
  'São Bernardo do Campo, SP',
  '11981582253', 
  '11981582253', 
  NULL, 
  NULL, 
  true, 
  'alves-montador-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '0201ea70-54c7-4956-b761-bc1295c37dd9', 
  'Montador de Móveis Paulista', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Taboão', 
  'Taboão, SBC',
  '11981636576', 
  '11981636576', 
  NULL, 
  NULL, 
  true, 
  'montador-de-m-veis-paulista-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  'd41c3515-8043-44a7-86ad-df1b15757965', 
  'Montagem Top Planalto', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Planalto', 
  'R. Oragnof, 60, Vila Jupiter',
  '11979715469', 
  '11979715469', 
  NULL, 
  NULL, 
  true, 
  'montagem-top-planalto-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '2286ecfb-c24b-4eda-9d66-be64311daac3', 
  'Jossivan Montador', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Planalto', 
  'Planalto, SBC',
  '11996591707', 
  '11996591707', 
  NULL, 
  NULL, 
  true, 
  'jossivan-montador-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
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
  '7257c82d-053c-46c7-9b5d-2a2aca0ddf02', 
  'POM NET', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Ferrazópolis', 
  'São Bernardo do Campo, SP',
  '11984423676', 
  '11984423676', 
  NULL, 
  NULL, 
  true, 
  'pom-net-sbc',
  'Serviços de montagem e desmontagem de móveis em São Bernardo do Campo', 
  5.0, 
  'manual_search'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
