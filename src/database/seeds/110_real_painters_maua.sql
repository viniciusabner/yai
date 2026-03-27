-- Inserção de Pintores em Mauá (Apenas Verificados)
-- Cidade ID: 6f15b756-1913-4ca0-81ea-5a82f11740a3
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'pintor')
  OR slug LIKE '%-maua'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'pintor')
  OR slug LIKE '%-maua'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'maua') AND category = 'pintor')
OR slug LIKE '%-maua';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  'ab96e344-501f-4773-9258-751f569389a9', 
  'Lci Pintura', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Av. Juscelino Kubitschek, 1455',
  '11947793775', 
  '1123914195', 
  NULL, 
  NULL, 
  true, 
  'lci-pintura-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '5f3ba8cf-fa42-437e-8f19-d3e897a0a086', 
  'JA Pinturas', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Mauá, SP',
  '11982282868', 
  '11982282868', 
  NULL, 
  NULL, 
  true, 
  'ja-pinturas-maua',
  'Serviços de pintura profissional em Mauá', 
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
  'a5ca22ec-09b4-4292-b664-4d7155611457', 
  'Maxcolor Pinturas', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Loteamento Industrial Coral', 
  'Rua Girassol, 246',
  '11984900683', 
  '11984910187', 
  NULL, 
  NULL, 
  true, 
  'maxcolor-pinturas-maua',
  'Serviços de pintura profissional em Mauá', 
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
  'ed6a4949-a310-436e-97f3-97bf7a182283', 
  'AJ Empreiteira', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Mauá, SP',
  '11977535336', 
  '11977535336', 
  NULL, 
  NULL, 
  true, 
  'aj-empreiteira-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '56d2b404-218d-4c71-98bb-b0300b6b0b12', 
  'A5web Pintor', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Vila Bocaina', 
  'R. Manoel Pedro Júnior',
  '17981002981', 
  '17981002981', 
  NULL, 
  NULL, 
  true, 
  'a5web-pintor-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '52567c77-9be1-4c13-bac6-c10d97604ecf', 
  'Visual Pinturas', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Mauá, SP',
  '11940361339', 
  '11940361339', 
  NULL, 
  NULL, 
  true, 
  'visual-pinturas-maua',
  'Serviços de pintura profissional em Mauá', 
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
  'cb09538a-11ab-44bc-a2bb-c7dc0f81a857', 
  'Kolli Pinturas', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Mauá, SP',
  '11951774005', 
  '11951774005', 
  NULL, 
  NULL, 
  true, 
  'kolli-pinturas-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '6abc9e32-3db2-43b6-bf39-659e795f259b', 
  'GOC Construtora', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Mauá, SP',
  '1141125560', 
  '1141125560', 
  NULL, 
  NULL, 
  true, 
  'goc-construtora-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '8ab2cdac-bae3-4fb8-a487-a4b4c278092b', 
  'GOK Construtora', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Mauá, SP',
  '11940098978', 
  '11940098978', 
  NULL, 
  NULL, 
  true, 
  'gok-construtora-maua',
  'Serviços de pintura profissional em Mauá', 
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
  'a98ddef8-c9fe-47ef-9946-394844385612', 
  'Pinturas Residências', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Mauá, SP',
  '11981423084', 
  '11981423084', 
  NULL, 
  NULL, 
  true, 
  'pinturas-resid-ncias-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '6c11e6ba-9ab7-459a-9d9e-d2183814443a', 
  'Domenico Funilaria e Pintura', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Vila Bocaina', 
  'Rua João Pessoa, 45',
  '1145142897', 
  '1145142897', 
  NULL, 
  NULL, 
  true, 
  'domenico-funilaria-e-pintura-maua',
  'Serviços de pintura profissional em Mauá', 
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
  'af16a222-43e6-456a-b919-0f45f2f1c4d9', 
  'Funilaria e Pintura Versatt', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Parque São Vicente', 
  'Rua Presidente Arthur da Costa e Silva, 35',
  '1145555996', 
  '1145555996', 
  NULL, 
  NULL, 
  true, 
  'funilaria-e-pintura-versatt-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '1e541a77-e87c-40c7-a77b-bb72133e2a4f', 
  'FL Pinturas', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Jardim Zaíra', 
  'Rua Antônio Viana de Freitas, s/n',
  '11972568271', 
  '1123757818', 
  NULL, 
  NULL, 
  true, 
  'fl-pinturas-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '7b500706-2c64-4d2b-97ba-e098d45842c3', 
  'Valter Marques Alves', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Jardim Zaíra', 
  'Avenida Saturnino João da Silva, 32',
  '1145452751', 
  '1145452751', 
  NULL, 
  NULL, 
  true, 
  'valter-marques-alves-maua',
  'Serviços de pintura profissional em Mauá', 
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
  'ae771d4b-952c-46a6-aeb4-ff0c81e0b319', 
  'MP Pinturas', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Jardim Zaíra', 
  'R. Ricardo Mariano dos Santos, 146',
  '11947648448', 
  '11947648448', 
  NULL, 
  NULL, 
  true, 
  'mp-pinturas-maua',
  'Serviços de pintura profissional em Mauá', 
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
  '5e09c774-f965-4102-93e8-3fbd128992f1', 
  'Master Tintas', 
  '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Vila Bocaina', 
  'Avenida Itapark, 4377',
  '11994320478', 
  '1134204840', 
  NULL, 
  NULL, 
  true, 
  'master-tintas-maua',
  'Serviços de pintura profissional em Mauá', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
