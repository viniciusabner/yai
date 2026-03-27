-- Inserção de Gesseiros em Mauá (Dados Reais)
-- Cidade: Mauá
-- Categoria: Buscada via Subquery (Gesseiro / Drywall)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'gesseiro')
  OR slug LIKE '%-maua' AND category = 'gesseiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'gesseiro')
  OR slug LIKE '%-maua' AND category = 'gesseiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'gesseiro')
OR slug LIKE '%-maua' AND category = 'gesseiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'a1af09fd-4483-432d-87d0-74360e8b46cb', 
  'O Gesseiro Mauá', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Mauá, SP',
  '11983630155', 
  '11983630155',
  NULL, 
  NULL, 
  true, 
  'o-gesseiro-mau--maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '45b0653d-f98d-4325-abc1-c022599860a7', 
  'Gesso São Jorge', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim São Jorge do Guapituba', 
  'Av. José Ricardo Nalle, 765',
  '11977228729', 
  '1143090886',
  NULL, 
  NULL, 
  true, 
  'gesso-s-o-jorge-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  'c86b0f4b-e652-458c-912a-63be7116b13b', 
  'Gesso Líder', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Parque São Vicente', 
  'Rua Pres. Vital Humberto Batista Soares, 36',
  '11998433483', 
  '1145137577',
  NULL, 
  NULL, 
  true, 
  'gesso-l-der-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '7d6e8d32-baf0-42a8-b7cb-c1e2182bf83e', 
  'Gesso Novo Padrão', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Zaira', 
  'R. João Bento, 148',
  '1145474659', 
  '1145474659',
  NULL, 
  NULL, 
  true, 
  'gesso-novo-padr-o-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '79cc4083-08e1-4788-94b4-9d2bb1fd0337', 
  'Alto Estilo Gesso', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Zaira', 
  'Av. Presidente Castelo Branco, 538',
  '1127861613', 
  '1145412199',
  NULL, 
  NULL, 
  true, 
  'alto-estilo-gesso-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '096c97d8-5eee-421e-ace1-b45aead48b4a', 
  'Gesso Divisa', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Vitória', 
  'Av. Capitão João, 1173-B',
  '11978683225', 
  '1145139021',
  NULL, 
  NULL, 
  true, 
  'gesso-divisa-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '1c728932-917c-40c7-b2e7-75c01fc5e961', 
  'Art Gesso Progresso', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Oratório', 
  'Rua Gerber Wolfgang, 529',
  '1145412851', 
  '1145412851',
  NULL, 
  NULL, 
  true, 
  'art-gesso-progresso-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '1d366d01-df51-45f5-85b4-df2dbc8e4de4', 
  'Construwall Gesso e Construção', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'IV Centenário', 
  'Rua Leonel Lima e Silva, 753 casa1',
  '11966999734', 
  '11966999734',
  NULL, 
  NULL, 
  true, 
  'construwall-gesso-e-constru-o-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '2d76ef5f-d3ee-4839-95ca-195936e10d57', 
  'Artedivi Drywall divisórias e forros', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Mauá, SP',
  '11970187482', 
  '11970187482',
  NULL, 
  NULL, 
  true, 
  'artedivi-drywall-divis-rias-e-forros-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  '6166cdfa-04f1-4f70-80ac-35e67ef8a748', 
  'Dap Steel', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Mauá, SP',
  '1134597275', 
  '1134597275',
  NULL, 
  NULL, 
  true, 
  'dap-steel-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  'c69ab80d-3742-4ea1-b8af-9f9b0f933439', 
  'Gesso e Venda de Materiais', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Itapark Velho', 
  'R. Caetano Aletto, 344',
  '11934705479', 
  '11934705479',
  NULL, 
  NULL, 
  true, 
  'gesso-e-venda-de-materiais-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  'b1b5facd-74ce-40ed-8b63-6e2800622f0e', 
  'Jomag', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Mauá, SP',
  '11996171090', 
  '11996171090',
  NULL, 
  NULL, 
  true, 
  'jomag-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  'd1529b49-f248-494e-992d-18705d2ae474', 
  'Gesso Laura', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Maringá', 
  'Av. Br. de Mauá, 2506',
  '11973505123', 
  '1145482515',
  NULL, 
  NULL, 
  true, 
  'gesso-laura-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  'ce0d3822-78e9-4d69-a92c-72652554694d', 
  'JCG Divisórias e Forros', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Primavera', 
  'R. dos Jasmin, 297',
  '11954628630', 
  '11954628630',
  NULL, 
  NULL, 
  true, 
  'jcg-divis-rias-e-forros-maua',
  'Serviços de gesso e drywall em Mauá', 
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
  'cd66ea9e-77f7-4cc0-8724-1cd5956ba28a', 
  'Divisórias.Com', 
  (SELECT id FROM cities WHERE slug = 'maua'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Noemia', 
  'Av. João Ramalho, 1821',
  '1127861063', 
  '1127861063',
  NULL, 
  NULL, 
  true, 
  'divis-rias-com-maua',
  'Serviços de gesso e drywall em Mauá', 
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
