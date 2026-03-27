-- Inserção de Montadores de Móveis em Mauá (Apenas Verificados)
-- Cidade: Mauá (ID buscado via subquery)
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'montador_moveis')
  OR slug LIKE '%-maua'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'montador_moveis')
  OR slug LIKE '%-maua'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'montador_moveis')
OR slug LIKE '%-maua';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '0a0986cb-26cc-44a0-8680-d1f1f22d78fa', 
  'Montador de Móveis Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Mauá, SP',
  '11961498143', 
  '11961498143', 
  NULL, 
  NULL, 
  true, 
  'montador-de-m-veis-mau--maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  'f0e63bb1-38ad-4d7a-b1f6-ce11f6c71762', 
  'Águia Montagem', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Bocaina', 
  'Mauá, SP',
  '11981718913', 
  '11981718913', 
  NULL, 
  NULL, 
  true, 
  '-guia-montagem-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  'c3b1d28b-4c87-44a3-bf3c-8c238bdb26df', 
  'Rodrigo Pires Montador', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Parque São Vicente', 
  'Mauá, SP',
  '11983119179', 
  '11983119179', 
  NULL, 
  NULL, 
  true, 
  'rodrigo-pires-montador-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  'a6ef4eaa-d42f-4b85-9a44-7088b99c2fdc', 
  'POM Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Mauá, SP',
  '11984661136', 
  '11984661136', 
  NULL, 
  NULL, 
  true, 
  'pom-mau--maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  'f1073fe8-380c-4431-89a4-8bd8fa60d909', 
  'Metrópoles Montador', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Guapituba', 
  'Mauá, SP',
  '11945267021', 
  '11945267021', 
  NULL, 
  NULL, 
  true, 
  'metr-poles-montador-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '3e7b6067-6ec8-49c2-8b7f-fa07e8aa6964', 
  'Freitas Montador', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Mauá, SP',
  '11949090024', 
  '11949090024', 
  NULL, 
  NULL, 
  true, 
  'freitas-montador-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  'c3983fea-8f23-46ce-b760-e49b1d5770cf', 
  'Martelix Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Parque São Vicente', 
  'Mauá, SP',
  '11995743555', 
  '11995743555', 
  NULL, 
  NULL, 
  true, 
  'martelix-mau--maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '9f86b934-59b8-4b08-889e-481deadefe61', 
  'Cícero Jardim Zaíra', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Jardim Zaíra', 
  'Jardim Zaíra, Mauá',
  '11986709949', 
  '11986709949', 
  NULL, 
  NULL, 
  true, 
  'c-cero-jardim-za-ra-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '8ef4aaab-842f-404c-8560-37ccfe54d36d', 
  'Gabriel Mattos', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Assis', 
  'Mauá, SP',
  '11945042992', 
  '11945042992', 
  NULL, 
  NULL, 
  true, 
  'gabriel-mattos-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '7846a9bf-2537-444b-9c24-36000e9d1d2c', 
  'Montador Vila Magini', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Magini', 
  'Vila Magini, Mauá',
  '11942906615', 
  '11942906615', 
  NULL, 
  NULL, 
  true, 
  'montador-vila-magini-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  'a1ab1d3d-29b7-4458-a2f3-e27597214722', 
  'Sampa Móveis', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Magini', 
  'Mauá, SP',
  '11941628192', 
  '11941628192', 
  NULL, 
  NULL, 
  true, 
  'sampa-m-veis-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '0b89694b-b09b-4d5c-942e-51f8006150b2', 
  'Willians Santos', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Jardim Itapark', 
  'Jardim Itapark, Mauá',
  '11959540923', 
  '11959540923', 
  NULL, 
  NULL, 
  true, 
  'willians-santos-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  'aca4bcd3-bcf3-453c-b34b-1cb6a691d23a', 
  'Montador Jardim Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Jardim Mauá', 
  'Jardim Mauá, Mauá',
  '11990017107', 
  '11990017107', 
  NULL, 
  NULL, 
  true, 
  'montador-jardim-mau--maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '54964b07-d8e9-4e4a-872f-6b941d113a87', 
  'Montador Barão de Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Av. Barão de Mauá, Centro',
  '11944421697', 
  '11944421697', 
  NULL, 
  NULL, 
  true, 
  'montador-bar-o-de-mau--maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '0bee5a27-6fc3-49b2-9d6a-90f2fd93d047', 
  'Montador 24h Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Jardim Pedroso', 
  'Mauá, SP',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-24h-mau--maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
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
  '773267f8-286b-4299-b070-16d5ff1925c4', 
  'Montador Vila Noêmia', 
  (SELECT id FROM cities WHERE slug = 'maua' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Noêmia', 
  'Vila Noêmia, Mauá',
  '1129660340', 
  '1129660340', 
  NULL, 
  NULL, 
  true, 
  'montador-vila-no-mia-maua',
  'Serviços de montagem e desmontagem de móveis em Mauá (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
