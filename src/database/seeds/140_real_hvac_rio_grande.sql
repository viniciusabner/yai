-- Inserção de Técnicos em Ar Condicionado em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-rio-grande-da-serra' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-rio-grande-da-serra' AND category = 'tecnico_ar_condicionado';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '2f46414d-3449-4065-bec6-8c42404d20f7', 
  'ABC Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1142385738', 
  '1142385738',
  NULL, 
  NULL, 
  true, 
  'abc-ar-condicionado-rio-grande-da-serra',
  'Serviços e instalações de Ar Condicionado e Climatização em Rio Grande da Serra', 
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
  '45f40914-335c-458d-a1be-5c80e728af8f', 
  'Manutenção Ar-Condicionado Carrier', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11962311982', 
  '1139025938',
  NULL, 
  NULL, 
  true, 
  'manutenção-arcondicionado-carrier-rio-grande-da-serra',
  'Serviços e instalações de Ar Condicionado e Climatização em Rio Grande da Serra', 
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
  '74a2fbac-c441-4c4d-88b1-e0d2574edc43', 
  'Horvath Ar', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11942055738', 
  '1142329960',
  NULL, 
  NULL, 
  true, 
  'horvath-ar-rio-grande-da-serra',
  'Serviços e instalações de Ar Condicionado e Climatização em Rio Grande da Serra', 
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
  'a0ff8e76-3f47-4187-b9a0-6d4002701615', 
  'W.A. Técnica (Eletro e Ar)', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11940753262', 
  '1141896676',
  NULL, 
  NULL, 
  true, 
  'wa-técnica-eletro-e-ar-rio-grande-da-serra',
  'Serviços e instalações de Ar Condicionado e Climatização em Rio Grande da Serra', 
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
  '2d587957-656b-4893-9110-3d966d15f49c', 
  'Resfriar Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '5193385321', 
  '5193385321',
  NULL, 
  NULL, 
  true, 
  'resfriar-ar-condicionado-rio-grande-da-serra',
  'Serviços e instalações de Ar Condicionado e Climatização em Rio Grande da Serra', 
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
