-- Inserção de Gesseiros em Ribeirão Pires (Dados Reais)
-- Cidade: Ribeirão Pires
-- Categoria: Buscada via Subquery (Gesseiro / Drywall)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'gesseiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'gesseiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'gesseiro')
  OR slug LIKE '%-ribeirao-pires' AND category = 'gesseiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'ribeirao-pires') AND category = 'gesseiro')
OR slug LIKE '%-ribeirao-pires' AND category = 'gesseiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '632b8779-f13d-451b-845f-16fb2a1d9fc6', 
  'O Gesseiro Ribeirão Pires', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11983630155', 
  '11983630155',
  NULL, 
  NULL, 
  true, 
  'o-gesseiro-ribeir-o-pires-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  '5b92517e-dde2-4f14-a517-9c31a5af945b', 
  'Gesso Juliana', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santa Luzia', 
  'Av. Francisco Monteiro, 2434',
  '1143738000', 
  '1143747868',
  NULL, 
  NULL, 
  true, 
  'gesso-juliana-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  '25ecbd87-7adb-4893-a7d9-0d02a5f06558', 
  'Gesso Ribeirão', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Avenida Francisco Monteiro, 518',
  '1148248161', 
  '1148248161',
  NULL, 
  NULL, 
  true, 
  'gesso-ribeir-o-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  'efbbcfc7-65f3-4a53-8d99-44593904a246', 
  'RM Gesso', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Parque Aliança', 
  'Rua Domingos Corrêa, 53',
  '11995513553', 
  '1148236096',
  NULL, 
  NULL, 
  true, 
  'rm-gesso-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  'c36e20ec-aaa8-4b2d-a03b-8648049b1e9c', 
  'JMG Gesso Decorações', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Sueli', 
  'Avenida Humberto de Campos, 1892',
  '11943211967', 
  '1148283546',
  NULL, 
  NULL, 
  true, 
  'jmg-gesso-decora-es-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  'a87b59eb-3377-40ca-b6e2-f5fb03ff5b61', 
  'Mari Decorações em Gesso', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santa Luzia', 
  'Rua Ipanema, 137',
  '1148258395', 
  '1148258395',
  NULL, 
  NULL, 
  true, 
  'mari-decora-es-em-gesso-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  '0d53a51b-562e-4c28-a91b-78edaaefa5f7', 
  'Gesso Guanabara', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Capitão José Gallo, 1915',
  '1148256633', 
  '1148256633',
  NULL, 
  NULL, 
  true, 
  'gesso-guanabara-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  'f8b69fcd-d166-4807-95bc-56094ad30ec0', 
  'Manoel Neto Figueredo Gesso', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Represa', 
  'Rua Eça de Queirós, 202',
  '1120627980', 
  '1120627980',
  NULL, 
  NULL, 
  true, 
  'manoel-neto-figueredo-gesso-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
  '13af3e87-3815-40aa-ace2-01c3b9276c69', 
  'Nilton Gesso', 
  (SELECT id FROM cities WHERE slug = 'ribeirao-pires'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Roncon', 
  'Rua Leme, 93',
  '1148276694', 
  '1148276694',
  NULL, 
  NULL, 
  true, 
  'nilton-gesso-ribeirao-pires',
  'Serviços de gesso e drywall em Ribeirão Pires', 
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
