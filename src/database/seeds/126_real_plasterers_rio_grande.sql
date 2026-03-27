-- Inserção de Gesseiros em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Gesseiro / Drywall)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'gesseiro')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'gesseiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'gesseiro')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'gesseiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'gesseiro')
OR slug LIKE '%-rio-grande-da-serra' AND category = 'gesseiro';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  'f5c8364e-28b9-4c62-94a6-64def66b013c', 
  'O Gesseiro', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11983630155', 
  '11983630155',
  NULL, 
  NULL, 
  true, 
  'o-gesseiro-rio-grande-da-serra',
  'Serviços de gesso e drywall em Rio Grande da Serra', 
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
  '4b235522-6c39-4fa1-94c4-a2e5590520af', 
  'Drywall Ideal RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11982442385', 
  '1143051247',
  NULL, 
  NULL, 
  true, 
  'drywall-ideal-rgs-rio-grande-da-serra',
  'Serviços de gesso e drywall em Rio Grande da Serra', 
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
  'b1a076e5-77a5-4de5-810d-285517f3e15c', 
  'Ciasul Comercial (Atendimento ABC)', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11947657252', 
  '1144638800',
  NULL, 
  NULL, 
  true, 
  'ciasul-comercial-atendimento-abc--rio-grande-da-serra',
  'Serviços de gesso e drywall em Rio Grande da Serra', 
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
  'df29ef79-f5e1-41ed-ba54-f29c6e386547', 
  'Gesso 3 Mil', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1137141748', 
  '1137663393',
  NULL, 
  NULL, 
  true, 
  'gesso-3-mil-rio-grande-da-serra',
  'Serviços de gesso e drywall em Rio Grande da Serra', 
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
  'e0a30c46-4bee-4f92-a0d0-3e9f7181aee5', 
  'Gesso Juliana Fábrica', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santa Luzia', 
  'Av. Francisco Monteiro, 2375',
  '1148276458', 
  '1148276458',
  NULL, 
  NULL, 
  true, 
  'gesso-juliana-f-brica-rio-grande-da-serra',
  'Serviços de gesso e drywall em Rio Grande da Serra', 
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
