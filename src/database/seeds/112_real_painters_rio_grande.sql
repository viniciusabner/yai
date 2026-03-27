-- Inserção de Pintores em Rio Grande da Serra (Apenas Verificados)
-- Cidade ID: ea516919-22d1-4508-8641-8eb9be709dd8
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade
DELETE FROM contact_events
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'pintor')
  OR slug LIKE '%-rio-grande-da-serra'
);

DELETE FROM conversations
WHERE provider_id IN (
  SELECT id FROM providers 
  WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'pintor')
  OR slug LIKE '%-rio-grande-da-serra'
);

DELETE FROM providers 
WHERE (city_id = (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra') AND category = 'pintor')
OR slug LIKE '%-rio-grande-da-serra';


INSERT INTO providers (
  id, name, city_id, category_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (
  '9219583e-0092-4a11-afd3-a0cfe1de28e7', 
  'Designer.com Pinturas', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Parque Indaiá', 
  'Rua Deputado Silva Prado, 94',
  '11963750086', 
  '1148215909', 
  NULL, 
  NULL, 
  true, 
  'designer-com-pinturas-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  'de8a0a4d-e267-49ac-874c-bfc7a482507d', 
  'Pintura e Reforma Aguinaldo', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Prefeito Francisco Arnoni, 7',
  '1148213655', 
  '1148213655', 
  NULL, 
  NULL, 
  true, 
  'pintura-e-reforma-aguinaldo-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '3db63a72-e3b2-4166-9963-1323e10916dd', 
  'RL Revestimentos', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1148268229', 
  '1148268455', 
  NULL, 
  NULL, 
  true, 
  'rl-revestimentos-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '3c84d1af-3854-495f-ad67-4455d509c108', 
  'RPMendes Empreiteira', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11914793603', 
  '11914793603', 
  NULL, 
  NULL, 
  true, 
  'rpmendes-empreiteira-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '04110f3a-e90a-47bc-8af1-3379f83398d5', 
  'Crioserv Manutenção', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Parque Pouso Alegre', 
  'Estrada Pouso Alegre, 7',
  '1148215784', 
  '1148215784', 
  NULL, 
  NULL, 
  true, 
  'crioserv-manuten-o-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '546fe41a-0c5d-40f7-b55e-6a1e17d1f858', 
  'Marido de Aluguel RGS', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1141144004', 
  '1141144004', 
  NULL, 
  NULL, 
  true, 
  'marido-de-aluguel-rgs-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '34c0e2a4-17f5-4339-96fa-01930a834805', 
  'Pedreiro e Pintor Venâncio', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rua Venâncio Orsini, 112',
  '1148201011', 
  '1148201011', 
  NULL, 
  NULL, 
  true, 
  'pedreiro-e-pintor-ven-ncio-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '168f992a-0fbb-4418-b8ce-78489c3c23b0', 
  'GLG Pinturas', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1127319596', 
  '1127319596', 
  NULL, 
  NULL, 
  true, 
  'glg-pinturas-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '5413cc2d-e0e3-4d69-bf94-e65eda2469eb', 
  'Lci Pintura', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11947793775', 
  '1123914195', 
  NULL, 
  NULL, 
  true, 
  'lci-pintura-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '4296e892-f81f-4729-8e13-deb0bf44f1c8', 
  'Cardoso Pinturas', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11962200830', 
  '1138672484', 
  NULL, 
  NULL, 
  true, 
  'cardoso-pinturas-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  '386fdc32-0527-4f9c-806b-8debe0ed8503', 
  'JA Pinturas', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11982282868', 
  '11982282868', 
  NULL, 
  NULL, 
  true, 
  'ja-pinturas-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
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
  'ab90c9ce-ac15-4a60-87e1-84141a4aaf38', 
  'Atlanta Pinturas', 
  'ea516919-22d1-4508-8641-8eb9be709dd8', 
  (SELECT id FROM categories WHERE slug = 'pintor' OR name ILIKE '%Pintor%' LIMIT 1), 
  'pintor', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11940824490', 
  '11940824490', 
  NULL, 
  NULL, 
  true, 
  'atlanta-pinturas-rio-grande-da-serra',
  'Serviços de pintura profissional em Rio Grande da Serra', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;
