-- Inserção de Montadores de Móveis em Santo André (Apenas Verificados)
-- Cidade ID: (Buscado via Subquery ou 85b13d20-450b-4ce2-ad14-146a13738fd1)
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') 
    OR city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') 
    OR city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM providers 
WHERE (
  city_id = (SELECT id FROM cities WHERE slug = 'santo-andre') 
  OR city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1'
) 
AND category = 'montador_moveis';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '90c4eac5-a6fa-4168-af0a-fb3f3dabef2c', 
  'Freitas Montador SP', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Luzita', 
  'Santo André, SP',
  '11949090024', 
  '11949090024', 
  NULL, 
  NULL, 
  true, 
  'freitas-montador-sp-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '98d42c29-e510-4dff-9d2a-b0cd967d97b6', 
  'Léo Montagem de Móveis', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Parque das Nações', 
  'Santo André, SP',
  '11981718913', 
  '11994455699', 
  NULL, 
  NULL, 
  true, 
  'l-o-montagem-de-m-veis-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  'e5d99581-269c-47ad-ac04-5f837e3457e4', 
  'Rogério Pires Montador', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Santo André, SP',
  '11983101118', 
  '11983101118', 
  NULL, 
  NULL, 
  true, 
  'rog-rio-pires-montador-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '5bb07b63-9ec1-4252-8153-ff044e4fde5a', 
  'Montador de Móveis Santo André', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Santo André, SP',
  '11961498143', 
  '11961498143', 
  NULL, 
  NULL, 
  true, 
  'montador-de-m-veis-santo-andr--santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '4984de67-6340-45f3-9aa1-f762fd163440', 
  'Monta Fácil Oficial', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Bairro Jardim', 
  'Agostinho Sales, 41',
  '11913436359', 
  '11913436359', 
  NULL, 
  NULL, 
  true, 
  'monta-f-cil-oficial-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '69ecf066-0f10-4826-b013-9aa6c9148f24', 
  'Destaque Montagem', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Bairro Jardim', 
  'Santo André, SP',
  '11981718913', 
  '11981718913', 
  NULL, 
  NULL, 
  true, 
  'destaque-montagem-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '03bb3953-0496-4ee2-af25-571d02b02f74', 
  'Montador Avenida Utinga', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Utinga', 
  'Av. Utinga, Santo André',
  '11956798018', 
  '11956798018', 
  NULL, 
  NULL, 
  true, 
  'montador-avenida-utinga-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '1d7a5926-cce2-418c-b711-c62f1a39344a', 
  'Montador Estação Utinga', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Utinga', 
  'Utinga, Santo André',
  '11945267021', 
  '11945267021', 
  NULL, 
  NULL, 
  true, 
  'montador-esta-o-utinga-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  'b82adcc1-f031-42d5-9509-e303be9c1577', 
  'Montador Alameda Martins', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santa Teresinha', 
  'Alameda Martins Fontes, Santo André',
  '11981636576', 
  '11981636576', 
  NULL, 
  NULL, 
  true, 
  'montador-alameda-martins-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  'cb10e3e3-6034-461d-9558-cfea51a3601e', 
  'Montador Express', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santa Teresinha', 
  'Santo André, SP',
  '11985162213', 
  '1150230567', 
  NULL, 
  NULL, 
  true, 
  'montador-express-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '09d478ee-5313-4c58-b736-192598c4a02a', 
  'Montador Vila Camilópolis', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Camilópolis', 
  'Vila Camilópolis, Santo André',
  '11958252239', 
  '11958252239', 
  NULL, 
  NULL, 
  true, 
  'montador-vila-camil-polis-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '876816a4-c15b-4eb9-9794-95cfedb919e8', 
  'Montador Rua dos Coqueiros', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Campestre', 
  'Rua dos Coqueiros, Santo André',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-rua-dos-coqueiros-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '18013e46-4c17-4e8d-b8f3-2b2876aa5b54', 
  'Montador Rockeiro', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Campestre', 
  'Cond. Jd Campestre, Santo André',
  '11973048490', 
  '11973048490', 
  NULL, 
  NULL, 
  true, 
  'montador-rockeiro-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '7ee4e8af-1e47-4422-9503-fb7b53aeb990', 
  'Devanildo Santos Silva', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Luzita', 
  'Santo André, SP',
  '11968890800', 
  '11968890800', 
  NULL, 
  NULL, 
  true, 
  'devanildo-santos-silva-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  '9425d962-2379-4c87-9700-867c2eec1491', 
  'Ageu Antonio Alves', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Luzita', 
  'Santo André, SP',
  '11986574300', 
  '11986574300', 
  NULL, 
  NULL, 
  true, 
  'ageu-antonio-alves-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  'cf367f50-09f2-4dda-be1d-659dd8c46fd0', 
  'Daniel Sousa dos Anjos', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Luzita', 
  'Santo André, SP',
  '11992220000', 
  '11992220000', 
  NULL, 
  NULL, 
  true, 
  'daniel-sousa-dos-anjos-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  'ebcbc4c3-e0be-4ac6-9798-6dedb5c8fa1a', 
  'Wagner de Sousa', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Vila Luzita', 
  'Santo André, SP',
  '11994575000', 
  '11994575000', 
  NULL, 
  NULL, 
  true, 
  'wagner-de-sousa-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  'df8afa76-3a67-4dbe-87d6-c9f33db2edbd', 
  'S.O.S Montador de Móveis', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Santo André, SP',
  '11993206733', 
  '11993206733', 
  NULL, 
  NULL, 
  true, 
  's-o-s-montador-de-m-veis-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
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
  'ba2f9a03-e9b4-44a2-a877-05d62ae6c99a', 
  'Central de Montagem', 
  (SELECT id FROM cities WHERE slug = 'santo-andre' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'Santo André, SP',
  '11949901000', 
  '1149901000', 
  NULL, 
  NULL, 
  true, 
  'central-de-montagem-santo-andre',
  'Serviços de montagem e desmontagem de móveis em Santo André (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
