-- Inserção de Gesseiros em São Bernardo do Campo (Dados Reais)
-- Cidade: São Bernardo do Campo
-- Categoria: Buscada via Subquery (Gesseiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'gesseiro')
  OR slug LIKE '%-sao-bernardo' AND category = 'gesseiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'gesseiro')
  OR slug LIKE '%-sao-bernardo' AND category = 'gesseiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo') AND category = 'gesseiro')
OR slug LIKE '%-sao-bernardo' AND category = 'gesseiro';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'a488684d-4fdf-41f7-a8ea-88dca2f4a36e', 
  'Gesso Mundial SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Independência', 
  'Avenida Robert Kennedy, 982',
  '11947112314', 
  '1143929432', 
  NULL, 
  NULL, 
  true, 
  'gesso-mundial-sbc-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'a601010d-9a66-4b92-9542-b63ff5935fc6', 
  'DG Gesso e Decoração', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Baeta Neves', 
  'Rua dos Vianas, 1926',
  '11965054229', 
  '11965054229', 
  NULL, 
  NULL, 
  true, 
  'dg-gesso-e-decora-o-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '71294943-5ea3-463f-a620-f2b22affd8a5', 
  'Gesso São Bernardo Independência', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Independência', 
  'R. Araci, 25',
  '11941496787', 
  '11941496787', 
  NULL, 
  NULL, 
  true, 
  'gesso-s-o-bernardo-independ-ncia-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '803e4f99-efd1-4895-bfd5-d16b31d22e26', 
  'DG Drygesso Rudge Ramos', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Rudge Ramos', 
  'Rua 25 de Março, 201',
  '11997775393', 
  '1143623321', 
  NULL, 
  NULL, 
  true, 
  'dg-drygesso-rudge-ramos-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'ef2aaea7-a89d-4081-a584-dd48fd7b9630', 
  'Fontelli Comércio e Serviços', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11940173618', 
  '1141257400', 
  NULL, 
  NULL, 
  true, 
  'fontelli-com-rcio-e-servi-os-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'd63d274c-725a-4353-91a7-c6f3e48a9e4f', 
  'Divicentro SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Jorge Pires, 35',
  '11958757840', 
  '11958757840', 
  NULL, 
  NULL, 
  true, 
  'divicentro-sbc-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '76245016-fd74-4629-8e3f-e5a1c4e66a9e', 
  'Gesseiro Jardim São Bernardo', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim São Bernardo', 
  'São Bernardo do Campo, SP',
  '11991637586', 
  '11991637586', 
  NULL, 
  NULL, 
  true, 
  'gesseiro-jardim-s-o-bernardo-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '8a4e8507-ce1d-4329-91b6-9dc75beeee7d', 
  'Gesseiro São Bernardo do Campo (O Gesseiro)', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11983630155', 
  '11983630155', 
  NULL, 
  NULL, 
  true, 
  'gesseiro-s-o-bernardo-do-campo-o-gesseiro--sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '8198ee7e-f2d7-4f4e-bbe1-6d2dd4f46ecf', 
  'Decorações Em Gesso Jair', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141782118', 
  '1141782118', 
  NULL, 
  NULL, 
  true, 
  'decora-es-em-gesso-jair-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '97adfbbd-9af4-497c-b6ea-eea0c24371c9', 
  'Dekor Arte Textura e Gesso', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1143362304', 
  '1143362304', 
  NULL, 
  NULL, 
  true, 
  'dekor-arte-textura-e-gesso-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'a4e0a3dd-a2b7-4b31-8766-1b608e8f4dbd', 
  'Dekko Lux', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1156866882', 
  '1156866882', 
  NULL, 
  NULL, 
  true, 
  'dekko-lux-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'a78fe0c9-29d7-41d7-88d0-3ba0c98ce465', 
  'Dap Steel', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1134597275', 
  '1134597275', 
  NULL, 
  NULL, 
  true, 
  'dap-steel-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'edf05053-7ee0-4e8b-b26c-4162f8bb8867', 
  'Casa do Gesso Baeta Neves', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Baeta Neves', 
  'São Bernardo do Campo, SP',
  '11942055583', 
  '11942055583', 
  NULL, 
  NULL, 
  true, 
  'casa-do-gesso-baeta-neves-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'b9e345cf-1cbb-4e9d-bbb2-60b8c98add25', 
  'Dg Decoracao Em Gesso Baeta', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Baeta Neves', 
  'São Bernardo do Campo, SP',
  '1154082982', 
  '1154082982', 
  NULL, 
  NULL, 
  true, 
  'dg-decoracao-em-gesso-baeta-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '234d8c99-1238-432d-a1d6-1532dfbdd4d3', 
  'Caetano Gesso', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Assunção', 
  'Estrada dos Alvarengas, 3503',
  '1143363271', 
  '1143363271', 
  NULL, 
  NULL, 
  true, 
  'caetano-gesso-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '2f7db9ae-ab74-4689-9119-1576407049b4', 
  'Décio Azulejista e Gesso', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Baeta Neves', 
  'São Bernardo do Campo, SP',
  '11985111131', 
  '1143527457', 
  NULL, 
  NULL, 
  true, 
  'd-cio-azulejista-e-gesso-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '77af0195-bc0b-4dfc-b15e-5b3f4941e914', 
  'Vidraçaria e Gesso Rudge Ramos', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Rudge Ramos', 
  'Rudge Ramos',
  '1143684176', 
  '1143684176', 
  NULL, 
  NULL, 
  true, 
  'vidra-aria-e-gesso-rudge-ramos-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '3d5cfa65-7884-4231-b0dd-f1941211bd5f', 
  'Gesso Ilumi', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Rudge Ramos', 
  'Rua 25 de Março, 201',
  '11976770613', 
  '1141771873', 
  NULL, 
  NULL, 
  true, 
  'gesso-ilumi-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '8af44ad9-5100-4b1b-9b0e-399309db07ae', 
  'Jomag Drywall', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11996171090', 
  '1142262243', 
  NULL, 
  NULL, 
  true, 
  'jomag-drywall-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '8f8b9186-737f-4df6-8514-3565bd3ce191', 
  'Exclusive Gesso SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11940320969', 
  '11940320969', 
  NULL, 
  NULL, 
  true, 
  'exclusive-gesso-sbc-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '9b753c09-7459-4fa0-a71e-e0f2599da432', 
  'Gesso Canaã', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141271880', 
  '1141271880', 
  NULL, 
  NULL, 
  true, 
  'gesso-cana--sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'a3c5c61f-cef3-449b-9922-d53a8a6d62e5', 
  'Roque Gesso', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141788090', 
  '1141788090', 
  NULL, 
  NULL, 
  true, 
  'roque-gesso-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '87d88a39-4ccd-49a4-81e3-c3ac3041b6f5', 
  'NOVO GESSO SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141098947', 
  '1141098947', 
  NULL, 
  NULL, 
  true, 
  'novo-gesso-sbc-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'bd816c04-5a67-44b4-9059-5d43d8faad95', 
  '333OBRA Gesso e Materiais', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1145724545', 
  '1145724545', 
  NULL, 
  NULL, 
  true, 
  '333obra-gesso-e-materiais-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'ac133c6a-4830-432f-9760-9639fad894eb', 
  'RPMendes Empreiteira (Gesso/Drywall)', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11914793603', 
  '11914793603', 
  NULL, 
  NULL, 
  true, 
  'rpmendes-empreiteira-gesso-drywall--sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'a0b2709d-08f1-4178-8fa3-875b42c29371', 
  'Reformas Inove SBC', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11950019517', 
  '11950019517', 
  NULL, 
  NULL, 
  true, 
  'reformas-inove-sbc-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'e5eef4f1-2455-475f-aadc-da749f765499', 
  'GOC Construtora e Gesso', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141125560', 
  '1141125560', 
  NULL, 
  NULL, 
  true, 
  'goc-construtora-e-gesso-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '08a71bad-6b15-4729-9036-beb01dbdb326', 
  'Guima Service (Reparos e Gesso)', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11916780108', 
  '11916780108', 
  NULL, 
  NULL, 
  true, 
  'guima-service-reparos-e-gesso--sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '5aacf30d-9ab7-488f-a3cb-1b2f6db56218', 
  'Marido de Aluguel ABC (Gesso)', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11947446375', 
  '1142353811', 
  NULL, 
  NULL, 
  true, 
  'marido-de-aluguel-abc-gesso--sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '1d943008-2707-48b4-9b9e-c75c064b164c', 
  'Marido de Aluguel SBC Central', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11948931000', 
  '11948931000', 
  NULL, 
  NULL, 
  true, 
  'marido-de-aluguel-sbc-central-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  '60384562-b637-42e7-82dd-2e4d3f0f9a68', 
  'Marido de Aluguel Hidrotex', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1141144004', 
  '1141144004', 
  NULL, 
  NULL, 
  true, 
  'marido-de-aluguel-hidrotex-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'e92d03ae-6810-4b84-951e-1d6ee643c265', 
  'Vital Serviços Reformas', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '1143480601', 
  '1143480601', 
  NULL, 
  NULL, 
  true, 
  'vital-servi-os-reformas-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
  'ceb226d1-b7c1-453c-a9ca-68e318894fb2', 
  'C.F.S Reparos Residenciais', 
  (SELECT id FROM cities WHERE slug = 'sao-bernardo-do-campo'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'São Bernardo do Campo, SP',
  '11977776666', 
  '11977776666', 
  NULL, 
  NULL, 
  true, 
  'c-f-s-reparos-residenciais-sao-bernardo',
  'Serviços de gesso e drywall em São Bernardo do Campo', 
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
