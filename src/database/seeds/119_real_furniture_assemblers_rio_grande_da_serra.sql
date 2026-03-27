-- Inserção de Montadores de Móveis em Rio Grande da Serra (Apenas Verificados)
-- Cidade: Rio Grande da Serra (ID buscado via subquery)
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'montador_moveis')
  OR slug LIKE '%-rio-grande-da-serra'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'montador_moveis')
  OR slug LIKE '%-rio-grande-da-serra'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'montador_moveis')
OR slug LIKE '%-rio-grande-da-serra';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '76035923-e31b-4f52-b32c-6095475bd7e8', 
  'Montador De Móveis Chamou Montou', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11945042992', 
  '11945042992', 
  NULL, 
  NULL, 
  true, 
  'montador-de-m-veis-chamou-montou-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  'b1a75581-c0df-4e8d-9ae6-3b47fdcf9835', 
  'Montador Metrópoles', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11941326524', 
  '11941326524', 
  NULL, 
  NULL, 
  true, 
  'montador-metr-poles-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  'b778799d-a37c-4bea-98f3-37ea04f4de2e', 
  'Montador Estação RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Estação de Trem, Rio Grande da Serra',
  '11945267021', 
  '11945267021', 
  NULL, 
  NULL, 
  true, 
  'montador-esta-o-rgs-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  'f29ce07f-bd0b-4260-9b54-94c2b13ee5df', 
  'Anderson Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11954762602', 
  '11954762602', 
  NULL, 
  NULL, 
  true, 
  'anderson-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '8c5992c1-b4dc-4cb6-ab28-b5ab07b01c98', 
  'Online Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Figueiredo', 
  'Rio Grande da Serra, SP',
  '19981296687', 
  '19981296687', 
  NULL, 
  NULL, 
  true, 
  'online-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '101343df-b116-4d22-ac71-8d2f61f4db71', 
  'Ferreira Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Pedreiras', 
  'Rio Grande da Serra, SP',
  '11982435589', 
  '11982435589', 
  NULL, 
  NULL, 
  true, 
  'ferreira-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '1e2e6cf6-37be-4875-9cf9-2f2220afeca6', 
  'MontaMovel', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Recanto das Flores', 
  'Rio Grande da Serra, SP',
  '11947248127', 
  '11947248127', 
  NULL, 
  NULL, 
  true, 
  'montamovel-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '26d9b9e7-1e79-430e-baef-203de5115065', 
  'Montador 24 Horas', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Lavínia', 
  'Rio Grande da Serra, SP',
  '11991366816', 
  '11991366816', 
  NULL, 
  NULL, 
  true, 
  'montador-24-horas-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '56d9cb6f-d827-4f37-a09a-8c7851f499cd', 
  'Invictus Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11949595310', 
  '11949595310', 
  NULL, 
  NULL, 
  true, 
  'invictus-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  'b8581563-a6ec-47b2-965c-5030a2cd7167', 
  'Montador RGS WhatsApp', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1141186437', 
  '1141186437', 
  NULL, 
  NULL, 
  true, 
  'montador-rgs-whatsapp-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '0a5cdc72-a97e-4c09-bef4-4979eebaa461', 
  'Montador Prefeito Valdírio', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Av. Prefeito Valdírio Prisco, Ribeirão Pires',
  '11973048490', 
  '11973048490', 
  NULL, 
  NULL, 
  true, 
  'montador-prefeito-vald-rio-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '545c646e-1d51-4d22-afc9-5b8351077bef', 
  'JK Marido de Aluguel', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Barro Branco', 
  'Ribeirão Pires, SP',
  '11988794041', 
  '11988794041', 
  NULL, 
  NULL, 
  true, 
  'jk-marido-de-aluguel-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  'da176a3a-be1c-4dbb-bd2c-3f23c29f6586', 
  'Montador Ouro Fino', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Ouro Fino Paulista', 
  'Ouro Fino Paulista, Ribeirão Pires',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-ouro-fino-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  '85703d61-fd41-4b6c-a907-411ec1178486', 
  'Montadora Mcasa', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Rua Reynaldo Manuel, Ribeirão Pires',
  '11992304602', 
  '11992304602', 
  NULL, 
  NULL, 
  true, 
  'montadora-mcasa-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
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
  'd68a509a-07b1-4a53-b6ae-8e778f74dc75', 
  'Martelix RP', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11995743555', 
  '11995743555', 
  NULL, 
  NULL, 
  true, 
  'martelix-rp-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
