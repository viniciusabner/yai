-- Inserção de Técnicos em Ar Condicionado em Ribeirão Pires (Dados Reais)
-- Cidade: Ribeirão Pires
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-ribeirao-pires' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'tecnico_ar_condicionado')
  OR slug LIKE '%-ribeirao-pires' AND category = 'tecnico_ar_condicionado'
);

DELETE FROM providers 
WHERE (city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea' AND category = 'tecnico_ar_condicionado')
OR slug LIKE '%-ribeirao-pires' AND category = 'tecnico_ar_condicionado';



INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '8d627eea-1998-4fc9-ba59-cb25e0051249', 
  'WG Ar Condicionado', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rua Antônio da Costa Luciano, 222',
  '11970917294', 
  '11970917294',
  NULL, 
  NULL, 
  true, 
  'wg-ar-condicionado-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
  5.0, 
  'manual_google',
  '2026-02-13T15:00:00.000Z'
) ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category, 
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
  '58fd0744-f60c-41d7-a2b9-4bed8567cced', 
  'Casa do Ar Condicionado', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Rua Doutor Felício Laurito, 294',
  '1142438101', 
  '1142438101',
  NULL, 
  NULL, 
  true, 
  'casa-do-ar-condicionado-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
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
  '082fc74a-0ec7-45ad-bcb0-8fa3eb8e1417', 
  'Horvath Ar', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11942055738', 
  '1142329960',
  NULL, 
  NULL, 
  true, 
  'horvath-ar-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
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
  'f4eafe83-325a-4618-8c22-45a0e283af95', 
  'Mr Ar Condicionado', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11986843617', 
  '11986843617',
  NULL, 
  NULL, 
  true, 
  'mr-ar-condicionado-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
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
  '950495ab-5a13-425f-a324-cd6239a4c8d5', 
  'ABC Ar Condicionado', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Ribeirão Pires, SP',
  '1142385738', 
  '1142385738',
  NULL, 
  NULL, 
  true, 
  'abc-ar-condicionado-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
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
  'e924d24a-aea8-42e0-a1c7-81dc634b6c5a', 
  'Gelar SP', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11942500551', 
  '11942500551',
  NULL, 
  NULL, 
  true, 
  'gelar-sp-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
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
  '567b72ec-2d12-44ec-b228-8125fe797b2f', 
  'Manutenção Ar Condicionado Carrier Ribeirão', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11962311982', 
  '1139025938',
  NULL, 
  NULL, 
  true, 
  'manutenção-ar-condicionado-carrier-ribeirão-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
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
  '9ba5138d-8733-481b-a951-9d899bb9a6fd', 
  'M Techar Instalação e Manutenção', 
  '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
  (SELECT id FROM categories WHERE slug = 'tecnico-ar-condicionado' OR name ILIKE '%Ar Condicionado%' LIMIT 1), 
  'tecnico_ar_condicionado', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11973580627', 
  '1148251157',
  NULL, 
  NULL, 
  true, 
  'm-techar-instalação-e-manutenção-ribeirao-pires',
  'Serviços e instalações de Ar Condicionado e Climatização em Ribeirão Pires', 
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
