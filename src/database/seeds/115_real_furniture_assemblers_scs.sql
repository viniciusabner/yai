-- Inserção de Montadores de Móveis em São Caetano do Sul (Apenas Verificados)
-- Cidade ID: d422ecad-80b4-450a-b364-ebb888d700e1
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') 
    OR city_id = 'd422ecad-80b4-450a-b364-ebb888d700e1'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (
    city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') 
    OR city_id = 'd422ecad-80b4-450a-b364-ebb888d700e1'
  ) 
  AND category = 'montador_moveis'
);

DELETE FROM providers 
WHERE (
  city_id = (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul') 
  OR city_id = 'd422ecad-80b4-450a-b364-ebb888d700e1'
) 
AND category = 'montador_moveis';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  'bf7daeb6-afc8-4e1b-ad98-aab86215e54d', 
  'Cícero Alves Montador', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11981582253', 
  '11981582253', 
  NULL, 
  NULL, 
  true, 
  'c-cero-alves-montador-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '5b8ec87f-2f2b-45dc-9be3-03145bcb3ab9', 
  'Montador Express', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11985162213', 
  '11985162213', 
  NULL, 
  NULL, 
  true, 
  'montador-express-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  'ff012e43-7b06-4663-ac1c-74d25d20b050', 
  'Destaque Montagem', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santa Paula', 
  'São Caetano do Sul, SP',
  '11978546109', 
  '11978546109', 
  NULL, 
  NULL, 
  true, 
  'destaque-montagem-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '08f64939-60d9-4843-b12a-b6d499d08119', 
  'Montador Roberto', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11961498143', 
  '11961498143', 
  NULL, 
  NULL, 
  true, 
  'montador-roberto-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '9f99c354-752c-47fc-bc0f-c224d7025b26', 
  'Montador Santo Antônio', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santo Antônio', 
  'Rua Monte Alegre, Santo Antônio',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-santo-ant-nio-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '44fb4825-4cbc-46ff-b10a-fcce17ac039f', 
  'Montador Santa Paula', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santa Paula', 
  'Av. Presidente Kennedy, Santa Paula',
  '11956798018', 
  '11956798018', 
  NULL, 
  NULL, 
  true, 
  'montador-santa-paula-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '7446e934-67dc-4aad-b990-303effa55dd8', 
  'Montador Avenida Goiás', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santo Antônio', 
  'Avenida Goiás, Santo Antônio',
  '11973048490', 
  '11973048490', 
  NULL, 
  NULL, 
  true, 
  'montador-avenida-goi-s-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '3c937c77-2652-48ab-a5e7-48bf11c0dcfa', 
  'JK Marido de Aluguel', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11988794041', 
  '11988794041', 
  NULL, 
  NULL, 
  true, 
  'jk-marido-de-aluguel-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '680b2c4c-9e51-4dfd-b57b-02b71a563356', 
  'Monta Fácil Oficial', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santa Paula', 
  'São Caetano do Sul, SP',
  '11913436359', 
  '11913436359', 
  NULL, 
  NULL, 
  true, 
  'monta-f-cil-oficial-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '08663943-14e2-40b7-80ac-10ea28d67ee3', 
  'KM Montador de Móveis', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santa Paula', 
  'São Caetano do Sul, SP',
  '1199999866864', 
  '11999866864', 
  NULL, 
  NULL, 
  true, 
  'km-montador-de-m-veis-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '80d60525-9e25-4e9e-a5b8-3e73a995eb43', 
  'Montador Alameda Porcelana', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Cerâmica', 
  'Alameda Porcelana, Cerâmica',
  '11981636576', 
  '11981636576', 
  NULL, 
  NULL, 
  true, 
  'montador-alameda-porcelana-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '941fee47-e9b6-4112-9686-4b0b64f1f2cd', 
  'Montador Metrópoles', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Cerâmica', 
  'São Caetano do Sul, SP',
  '11973039258', 
  '11973039258', 
  NULL, 
  NULL, 
  true, 
  'montador-metr-poles-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '6e041313-db77-4dfb-83f1-fdd93d8ad7e1', 
  'Ageu Montador', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Cerâmica', 
  'São Caetano do Sul, SP',
  '11940275274', 
  '11940275274', 
  NULL, 
  NULL, 
  true, 
  'ageu-montador-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '4b45ec77-d825-4fc1-9d29-e12ffb24bb5d', 
  'Mateus Montador', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Centro', 
  'São Caetano do Sul, SP',
  '11948955455', 
  '11948955455', 
  NULL, 
  NULL, 
  true, 
  'mateus-montador-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  'd18fbec7-1901-4362-887e-09613c298625', 
  'Martelix Montador', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Mauá', 
  'Mauá, SCS',
  '11995743555', 
  '11995743555', 
  NULL, 
  NULL, 
  true, 
  'martelix-montador-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '09f632a3-ce43-4c2f-9bc6-a4e63e0963e1', 
  'Montador Nova Gerty', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Nova Gerty', 
  'Nova Gerty, SCS',
  '41997070554', 
  '41997070554', 
  NULL, 
  NULL, 
  true, 
  'montador-nova-gerty-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  '4b12c78e-13e6-4507-9534-04f65e4772e7', 
  'Montador Profissional 24h', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Boa Vista', 
  'São Caetano do Sul, SP',
  '11991366816', 
  '11991366816', 
  NULL, 
  NULL, 
  true, 
  'montador-profissional-24h-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  'a5f7450b-79bb-49be-8b29-8006847451f8', 
  'Super Montagens', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Prosperidade', 
  'Prosperidade, SCS',
  '11958252239', 
  '11958252239', 
  NULL, 
  NULL, 
  true, 
  'super-montagens-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  'a0782095-c4b9-42f8-9f59-91c8374f0d6d', 
  'Léo Montagem', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Mauá', 
  'São Caetano do Sul, SP',
  '11981718913', 
  '11981718913', 
  NULL, 
  NULL, 
  true, 
  'l-o-montagem-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
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
  'bd73e1eb-5fb1-4e76-8a9a-d36a910f64dd', 
  'Restauração Santa Paula', 
  (SELECT id FROM cities WHERE slug = 'sao-caetano-do-sul' LIMIT 1), 
  (SELECT id FROM categories WHERE slug = 'montador_moveis' OR name ILIKE '%Montador%' LIMIT 1), 
  'montador_moveis', 
  'Santa Paula', 
  'R. São Paulo, 1564 B, Santa Paula',
  '11983219422', 
  '11983219422', 
  NULL, 
  NULL, 
  true, 
  'restaura-o-santa-paula-scs',
  'Serviços de montagem e desmontagem de móveis em São Caetano do Sul (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
