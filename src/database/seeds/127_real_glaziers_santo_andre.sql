-- Inserção de Vidraceiros em Santo André (Dados Reais)
-- Cidade: Santo André
-- Categoria: Buscada via Subquery (Vidraceiro / Box)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'vidraceiro')
  OR slug LIKE '%-santo-andre' AND category = 'vidraceiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'vidraceiro')
  OR slug LIKE '%-santo-andre' AND category = 'vidraceiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'vidraceiro')
OR slug LIKE '%-santo-andre' AND category = 'vidraceiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'e19d6ae8-9ee8-482f-97e2-ebd18869b1da', 
  'Casa dos Vidros', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Sacadura Cabral', 
  'Av. Novo Horizonte, 117',
  '1144282840', 
  '1144282840',
  NULL, 
  NULL, 
  true, 
  'casa-dos-vidros-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  'a98d6bf4-d223-41e8-9e12-5ebb84212f50', 
  'ABC Central Vidros', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Vila Pires', 
  'Av. D. Pedro I, 1864',
  '11997429497', 
  '1128965818',
  NULL, 
  NULL, 
  true, 
  'abc-central-vidros-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '6f18cbd9-a8d8-4048-8c30-a587303eb20a', 
  'Safira Vidraçaria', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Jardim Santo André', 
  'Santo André - SP',
  '11992224129', 
  '11992224129',
  NULL, 
  NULL, 
  true, 
  'safira-vidra-aria-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '2c7a2f0f-bf60-481f-a3cf-6bc6b22d27ad', 
  'Efraim Vidraçaria', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Vila Curuçá', 
  'Santo André - SP',
  '11994269658', 
  '11994269658',
  NULL, 
  NULL, 
  true, 
  'efraim-vidra-aria-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '1a639293-08e5-4727-a8d5-43e715268aee', 
  'Vidraçaria Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Jardim Utinga', 
  'Santo André - SP',
  '11932204397', 
  '11932204397',
  NULL, 
  NULL, 
  true, 
  'vidra-aria-santo-andr--santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  'd86e9d86-4145-43e7-8d1d-964476cc1e59', 
  'ABC Vidro Max', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Santo André - SP',
  '11952039617', 
  '1149961010',
  NULL, 
  NULL, 
  true, 
  'abc-vidro-max-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '2bb4bc21-273f-4d8b-a7b5-34f65f187cd7', 
  'Abcd Vidraçaria', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Santo André - SP',
  '1142213334', 
  '1142213334',
  NULL, 
  NULL, 
  true, 
  'abcd-vidra-aria-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '5a60e53b-da72-4ccf-aeff-711e8c3582bb', 
  'Alfab Esquadrias de Alumínio e Vidro', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Santo André - SP',
  '1144575711', 
  '1144575711',
  NULL, 
  NULL, 
  true, 
  'alfab-esquadrias-de-alum-nio-e-vidro-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '6d32cbba-f269-41d4-9838-a6014c02870f', 
  'Alliance Vidros', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Jardim Bela Vista', 
  'R. Tuiuti, 99',
  '1144224477', 
  '1144224477',
  NULL, 
  NULL, 
  true, 
  'alliance-vidros-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  'cd1337c6-1a13-473e-a8b4-21a0e5b9d6e3', 
  'Vidraçaria Paiva', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Santo André - SP',
  '11960133622', 
  '11960133622',
  NULL, 
  NULL, 
  true, 
  'vidra-aria-paiva-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '8b5bc9cc-21df-4056-9e62-0274e99379b9', 
  'Cristal Line Vidros', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Vila Valparaíso', 
  'Rua José Lins do Rego, 307',
  '11994892434', 
  '1149921616',
  NULL, 
  NULL, 
  true, 
  'cristal-line-vidros-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  'c752af66-5733-42a1-a035-68084bddd7b3', 
  'MAX VIDROS', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Vila Luzita', 
  'Av. Dom Pedro I, 3713',
  '1144511255', 
  '1144511255',
  NULL, 
  NULL, 
  true, 
  'max-vidros-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '74e9e57c-930a-432c-bdab-0158a686d686', 
  'Vidraçaria Decorama', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Parque das Nações', 
  'Av. Brasil, 534',
  '1144728955', 
  '1144728955',
  NULL, 
  NULL, 
  true, 
  'vidra-aria-decorama-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  'de5c5832-c07a-45f4-8679-6261860fa6d5', 
  'Vidraçaria Gênesis', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Jardim Utinga', 
  'Av. Martim Francisco, 1374',
  '1144754439', 
  '1144754439',
  NULL, 
  NULL, 
  true, 
  'vidra-aria-g-nesis-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  '5984d54c-df6d-438d-a47f-a17663d381b7', 
  'J & G Vidros e Cristais', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Utinga', 
  'Avenida Utinga, 367',
  '1149973487', 
  '1149973487',
  NULL, 
  NULL, 
  true, 
  'j-g-vidros-e-cristais-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  'fc878ea6-cf1c-45ab-845e-69ca3dbdb3bc', 
  'VERELUX INDÚSTRIA E COMÉRCIO DE VIDROS', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Campestre', 
  'R. dos Coqueiros, 144',
  '1144633800', 
  '1144633800',
  NULL, 
  NULL, 
  true, 
  'verelux-ind-stria-e-com-rcio-de-vidros-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
  'ef8d2246-8089-41da-97cc-0240829edc32', 
  'Auto Vidros Jair', 
  (SELECT id FROM cities WHERE slug = 'santo-andre'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Vila Alzira', 
  'R. Carijós, 560',
  '1144535858', 
  '1144539932',
  NULL, 
  NULL, 
  true, 
  'auto-vidros-jair-santo-andre',
  'Serviços e instalações de vidros, box e esquadrias em Santo André', 
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
