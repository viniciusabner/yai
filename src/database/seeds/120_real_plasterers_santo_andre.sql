-- Inserção de Gesseiros em Santo André (Dados Reais)
-- Cidade ID: 85b13d20-450b-4ce2-ad14-146a13738fd1
-- Categoria: Buscada via Subquery (Gesseiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'gesseiro')
  OR slug LIKE '%-santo-andre' AND category = 'gesseiro'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'gesseiro')
  OR slug LIKE '%-santo-andre' AND category = 'gesseiro'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') AND category = 'gesseiro')
OR slug LIKE '%-santo-andre' AND category = 'gesseiro';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (
  '13db8fed-5bde-4f1e-8c89-6823dc2a610b', 
  'GessoArt Utinga', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Utinga', 
  'Rua Conceição, 72',
  '11959233254', 
  '1121260666', 
  NULL, 
  NULL, 
  true, 
  'gessoart-utinga-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '4cd4d470-df97-445d-b7d6-2209433f0f72', 
  'Império do Gesso Vila Pires', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Pires', 
  'Av. Dom Pedro I, 2342',
  '1144518280', 
  '1144518280', 
  NULL, 
  NULL, 
  true, 
  'imp-rio-do-gesso-vila-pires-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '16f9882a-bd69-4e0b-810f-5b7eca4bc8f9', 
  'Gesso HD Palmares', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Palmares', 
  'R. Embú, 33',
  '11984760006', 
  '11984760006', 
  NULL, 
  NULL, 
  true, 
  'gesso-hd-palmares-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'e2e72f19-cd1f-4448-8749-7767e3052063', 
  'DC Mais Drywall Campestre', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Campestre', 
  'Rua das Laranjeiras, 771',
  '11987063707', 
  '1144215665', 
  NULL, 
  NULL, 
  true, 
  'dc-mais-drywall-campestre-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'f6aaad9d-cbcd-4a14-b0a5-22a2bdc4c56a', 
  'Ciasul Comercial Matriz', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Metalúrgica', 
  'Avenida dos Estados, 2030',
  '11940204956', 
  '1144638800', 
  NULL, 
  NULL, 
  true, 
  'ciasul-comercial-matriz-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'a43c5baa-e26c-4a54-9700-cddbbef23be4', 
  'Loja Elegancy Forros', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Assunção', 
  'Rua Jorge Moreira, 130',
  '11989398688', 
  '1125954700', 
  NULL, 
  NULL, 
  true, 
  'loja-elegancy-forros-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'a2717fa3-ecb0-4e85-ac40-b8fb9a9fd070', 
  'ABC Gesso e Texturas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Maritaca, 510',
  '1144555346', 
  '1144555346', 
  NULL, 
  NULL, 
  true, 
  'abc-gesso-e-texturas-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '40a2410d-4f36-4b99-a733-4bb8ba49a657', 
  'Adonai Gesso Decorações', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Morro Grande, 4',
  '1144558457', 
  '1144558457', 
  NULL, 
  NULL, 
  true, 
  'adonai-gesso-decora-es-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'e96978ec-37f2-4b7c-a1c5-e9d15feaa481', 
  'Alfa Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Doutor Simão de Lima, 55',
  '1149913824', 
  '1149913824', 
  NULL, 
  NULL, 
  true, 
  'alfa-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '368a6704-b629-4ae6-8f52-df86e22d2718', 
  'Angra Gesso Atlântica', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Valparaíso', 
  'Avenida Atlântica, 712',
  '1144267261', 
  '1144267261', 
  NULL, 
  NULL, 
  true, 
  'angra-gesso-atl-ntica-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '6f650469-6ab1-4038-838e-801e49be1b07', 
  'Brasilian Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Jorge Beretta, 151',
  '1144722034', 
  '1144722034', 
  NULL, 
  NULL, 
  true, 
  'brasilian-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '779b037c-8108-477d-a948-90e7212f86c0', 
  'Cad Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Alexandreta, 300',
  '1144633747', 
  '1144633747', 
  NULL, 
  NULL, 
  true, 
  'cad-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'e1280561-3b3d-4c40-ba50-6addb876b03e', 
  'Casa & Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Silveira Martins, 200',
  '1149976000', 
  '1149976000', 
  NULL, 
  NULL, 
  true, 
  'casa-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'f68e1019-54df-441e-a20c-d6db87684da3', 
  'Center Gesso Anhaia', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Parque das Nações', 
  'Avenida Professor Luíz Inácio de Anhaia Melo, 2480',
  '1144528100', 
  '1144528100', 
  NULL, 
  NULL, 
  true, 
  'center-gesso-anhaia-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'd6095e19-cd1c-471b-a8c3-8f34ca72dbc2', 
  'Divicentro Drywall', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11958757840', 
  '11958757840', 
  NULL, 
  NULL, 
  true, 
  'divicentro-drywall-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '7be406e6-7d4c-43a7-a7c0-23650e8927c2', 
  'Teto Futura', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11940207114', 
  '1123043034', 
  NULL, 
  NULL, 
  true, 
  'teto-futura-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '44c7cfe9-7473-4fab-be4b-aaa87084c524', 
  'Exclusive Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11940320969', 
  '11940320969', 
  NULL, 
  NULL, 
  true, 
  'exclusive-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'fceffe12-9db9-41a1-b25f-f535df791ed6', 
  'Dekko Lux Forros', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '1156866882', 
  '1156866882', 
  NULL, 
  NULL, 
  true, 
  'dekko-lux-forros-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '42a3f373-42b2-40ea-9f40-1dbfa835edaf', 
  'Steel Home Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Parque Jaçatuba', 
  'R. Ver. José Nanci, 231',
  '11953422174', 
  '1140044004', 
  NULL, 
  NULL, 
  true, 
  'steel-home-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '0623fce0-1098-4251-80eb-a2ac0f1d39b2', 
  'Gesso Evolution', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Pires', 
  'Av. Ibirapitanga, 66',
  '1144530363', 
  '1144530363', 
  NULL, 
  NULL, 
  true, 
  'gesso-evolution-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '8f0b6aa2-ed3e-4aa1-a4ba-6e6e59c17b8b', 
  'Gesso Rufino', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Campestre', 
  'Bairro Campestre',
  '1144215566', 
  '1144215566', 
  NULL, 
  NULL, 
  true, 
  'gesso-rufino-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'd52c72cf-3143-4dd7-b6aa-91eebe56d111', 
  'Gesso Jongo', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim Estádio', 
  'Jardim Estádio',
  '1144512605', 
  '1142493517', 
  NULL, 
  NULL, 
  true, 
  'gesso-jongo-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '223141fb-e2d1-412d-b9d2-226eb8685597', 
  'Jomag', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11996171090', 
  '11996171090', 
  NULL, 
  NULL, 
  true, 
  'jomag-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '1d3c9175-374c-4ddc-b430-6ea26fd5a4a8', 
  'Select Engenharia', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11941064149', 
  '11941064149', 
  NULL, 
  NULL, 
  true, 
  'select-engenharia-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '27b90f02-8822-4dfb-bff4-37a286889b52', 
  'FG Fábrica de Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Bom Pastor', 
  'Rua Cotia, 145',
  '11980355509', 
  '1128353637', 
  NULL, 
  NULL, 
  true, 
  'fg-f-brica-de-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'a01e0155-09c7-4784-a6c0-2d20dd72fccb', 
  'Art e Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Helena', 
  'Av. Áurea, 483',
  '1127783840', 
  '1127783840', 
  NULL, 
  NULL, 
  true, 
  'art-e-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '75987297-bbb9-4a47-896a-309eb786545d', 
  'Forros e Divisórias Paraíba', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '1146791431', 
  '1146791431', 
  NULL, 
  NULL, 
  true, 
  'forros-e-divis-rias-para-ba-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'd64055e8-3d66-4915-ae6d-1f5b9956f205', 
  'Ventura Gessos', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Helena', 
  'Jardim Santa Helena',
  '11948807022', 
  '11948807022', 
  NULL, 
  NULL, 
  true, 
  'ventura-gessos-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '2903d3ee-5e45-48d0-b883-56bca598e4dc', 
  'Gesseiro SOS Santo André', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11983630155', 
  '11983630155', 
  NULL, 
  NULL, 
  true, 
  'gesseiro-sos-santo-andr--santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '20351034-0677-49d5-9e04-684b88994a51', 
  'Depósito Santo Antonio Drywall', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santo Antônio', 
  'Santo André, SP',
  '1155334466', 
  '1155334466', 
  NULL, 
  NULL, 
  true, 
  'dep-sito-santo-antonio-drywall-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'da4bb283-8ba0-4dfe-a4f2-a7d6e5c41576', 
  'Nápoles Empreiteira', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Pires', 
  'Vila Pires',
  '11976505941', 
  '1149731832', 
  NULL, 
  NULL, 
  true, 
  'n-poles-empreiteira-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '7eb0b182-1cb7-4f98-9601-390fe741f29f', 
  'Décio Azulejista e Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Luzita', 
  'Santo André, SP',
  '11985111131', 
  '1143527457', 
  NULL, 
  NULL, 
  true, 
  'd-cio-azulejista-e-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'a21893c9-f134-4734-8f2f-dd9849dd2c1b', 
  'A Hora da Reforma', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11957919510', 
  '11957919510', 
  NULL, 
  NULL, 
  true, 
  'a-hora-da-reforma-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '9d932c86-5d8e-43df-9aa0-e5d6655b6774', 
  'RPMendes Empreiteira', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11914793603', 
  '11914793603', 
  NULL, 
  NULL, 
  true, 
  'rpmendes-empreiteira-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '3b14b2e3-0fcd-49b0-ab67-07ff11f01c69', 
  'ETC Reformas ABC', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Eldizia', 
  'R. Aníbal Freire, 25',
  '11997728438', 
  '11997728438', 
  NULL, 
  NULL, 
  true, 
  'etc-reformas-abc-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '17e0191e-3a82-4f4d-8bb5-df802cc535ad', 
  'Luz Castelli Construtora', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11989293082', 
  '11989293082', 
  NULL, 
  NULL, 
  true, 
  'luz-castelli-construtora-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '3474cdb7-43b4-48a8-b287-5261e7104903', 
  'JB Serviços Empreiteiros', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11989377221', 
  '11981621379', 
  NULL, 
  NULL, 
  true, 
  'jb-servi-os-empreiteiros-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '60736f2a-4a68-4994-8ec9-d7751b15276e', 
  'Antônio Empreiteiro', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Palmares', 
  'R. Pedro Setti, 141',
  '11985340882', 
  '1144215751', 
  NULL, 
  NULL, 
  true, 
  'ant-nio-empreiteiro-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'dc574e2c-7de9-47e0-b3b2-41c2faccf832', 
  'Dr Construção e Reformas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Linda', 
  'Rua Maria Cândida, 120',
  '11999974097', 
  '11999974097', 
  NULL, 
  NULL, 
  true, 
  'dr-constru-o-e-reformas-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'e6101b28-f8ee-4965-99d4-32ed72e4ceb0', 
  'Gesso Santo André', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11999999999', 
  '11999999999', 
  NULL, 
  NULL, 
  true, 
  'gesso-santo-andr--santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '3ce12677-a567-4dd0-9b3a-ea3c3a1ff69b', 
  'Gessos Decor', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11942456789', 
  '11942456789', 
  NULL, 
  NULL, 
  true, 
  'gessos-decor-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '7357cde4-a323-4e40-8f8e-4e553f9fbf76', 
  'Shopping de Serviços', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11986154000', 
  '11986154000', 
  NULL, 
  NULL, 
  true, 
  'shopping-de-servi-os-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'd3db432b-1009-4462-b0cd-e1e32dbca4a6', 
  'Guima Service', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11916780108', 
  '11916780108', 
  NULL, 
  NULL, 
  true, 
  'guima-service-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '08176f49-fc94-472e-ad19-917d08a112db', 
  'Marido de Aluguel ABC', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Santo André, SP',
  '11947446375', 
  '11947446375', 
  NULL, 
  NULL, 
  true, 
  'marido-de-aluguel-abc-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'c04e5d44-51fb-4d55-99b8-000e1640ffa3', 
  'Inove Reformas e Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Linda', 
  'Rua Carijós, 1856',
  '11952226462', 
  '11952226462', 
  NULL, 
  NULL, 
  true, 
  'inove-reformas-e-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'b8571be2-eb33-43aa-97f9-6b94f1a3dcf4', 
  'Stoc Pinturas e Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Vila Pires', 
  'Rua Visconde de Mauá, 509',
  '11978225539', 
  '1141171349', 
  NULL, 
  NULL, 
  true, 
  'stoc-pinturas-e-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'fd4638b2-1bd8-4b79-acc2-90462f2dd67a', 
  'JA Pinturas e Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santo André', 
  'Santo André, SP',
  '11982282868', 
  '11966601567', 
  NULL, 
  NULL, 
  true, 
  'ja-pinturas-e-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'd88e04b8-28e2-4b90-8fcb-f993f0cdc75a', 
  'Atlanta Gesso e Pintura', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santo André', 
  'Santo André, SP',
  '11940824490', 
  '11940824490', 
  NULL, 
  NULL, 
  true, 
  'atlanta-gesso-e-pintura-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '81fc06e9-8ccc-4b90-9e2d-99286d65e406', 
  'WellColor Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santo André', 
  'Santo André, SP',
  '11986124461', 
  '11986124461', 
  NULL, 
  NULL, 
  true, 
  'wellcolor-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'bdefe8d1-f359-445e-8d85-1d59bb79783c', 
  'F&F Reformas', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Jardim', 
  'Rua das Figueiras, 465',
  '11947234399', 
  '11947234399', 
  NULL, 
  NULL, 
  true, 
  'f-f-reformas-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  'a2d86fa2-8a09-4261-9dff-7d14efdc00dc', 
  'Mogi Paint e Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Santo André', 
  'Santo André, SP',
  '11947225134', 
  '11947225134', 
  NULL, 
  NULL, 
  true, 
  'mogi-paint-e-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
  '8b4fa50b-4e9a-4a2e-91fa-be80fd86c4c2', 
  'Pintura & Cia e Gesso', 
  '85b13d20-450b-4ce2-ad14-146a13738fd1', 
  (SELECT id FROM categories WHERE slug = 'gesseiro' OR name ILIKE '%Gesseiro%' LIMIT 1), 
  'gesseiro', 
  'Centro', 
  'Rua Coronel Oliveira Lima, 45',
  '11981559865', 
  '11981559865', 
  NULL, 
  NULL, 
  true, 
  'pintura-cia-e-gesso-santo-andre',
  'Serviços de gesso e drywall em Santo André', 
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
