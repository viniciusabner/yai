-- Inserção de Vidraceiros em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Vidraceiro / Box)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'vidraceiro')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'vidraceiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'vidraceiro')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'vidraceiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'vidraceiro')
OR slug LIKE '%-rio-grande-da-serra' AND category = 'vidraceiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'c6a4cfe2-a68e-4676-8bd6-c2aaa004673f', 
  'Vidraçaria Martins', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Avenida Dom Pedro I, 469',
  '1148202308', 
  '1148202308',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-martins-rio-grande-da-serra',
  'Serviços e instalações de vidros, box e esquadrias em Rio Grande da Serra', 
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
  'f75c9a8f-7558-4558-9db7-0ee231f90ec5', 
  'Vidraçaria Santa Tereza', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Jardim Santa Tereza', 
  'Avenida São João, 19',
  '1148203613', 
  '1148203613',
  NULL, 
  NULL, 
  true, 
  'vidraçaria-santa-tereza-rio-grande-da-serra',
  'Serviços e instalações de vidros, box e esquadrias em Rio Grande da Serra', 
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
  '8a047abb-bbbd-415d-8416-c713e4ebe95f', 
  'JT Vidros', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Oásis Paulista', 
  'Estr. Rio Pequeno, 37',
  '11975004785', 
  '11975004785',
  NULL, 
  NULL, 
  true, 
  'jt-vidros-rio-grande-da-serra',
  'Serviços e instalações de vidros, box e esquadrias em Rio Grande da Serra', 
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
  '4588b038-e835-4c77-b22f-039e3e810566', 
  'Sanecomfibra Vidros', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Vila Figueiredo', 
  'Rua Aurélio Figueiredo, 340',
  '1148202720', 
  '1148202720',
  NULL, 
  NULL, 
  true, 
  'sanecomfibra-vidros-rio-grande-da-serra',
  'Serviços e instalações de vidros, box e esquadrias em Rio Grande da Serra', 
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
  'fbbfb484-7937-4b42-af29-b08c2cbbf3ea', 
  'SPGlass Rio Grande', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11940714225', 
  '11940714225',
  NULL, 
  NULL, 
  true, 
  'spglass-rio-grande-rio-grande-da-serra',
  'Serviços e instalações de vidros, box e esquadrias em Rio Grande da Serra', 
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
  'ff1506e7-2312-438b-b4b7-11af3a464862', 
  'Lider Envidraçamentos RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1149925757', 
  '1149925757',
  NULL, 
  NULL, 
  true, 
  'lider-envidraçamentos-rgs-rio-grande-da-serra',
  'Serviços e instalações de vidros, box e esquadrias em Rio Grande da Serra', 
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
  '8d7d71b7-af25-4b3a-9ba3-9d25365767bc', 
  'RS Vidros e Instalações', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'vidraceiro' OR name ILIKE '%Vidraceiro%' LIMIT 1), 
  'vidraceiro', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11994269658', 
  '11994269658',
  NULL, 
  NULL, 
  true, 
  'rs-vidros-e-instalações-rio-grande-da-serra',
  'Serviços e instalações de vidros, box e esquadrias em Rio Grande da Serra', 
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
