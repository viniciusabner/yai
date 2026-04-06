-- MASTER SCRIPT: RIO GRANDE DA SERRA
-- Corrige as categorias com hífen para underline, IDs hardcoded e força o ON CONFLICT


-- ===========================================
-- FROM FILE: 102_rio_grande_pest_control.sql
-- ===========================================
-- 102. Insert Pest Control (Dedetizadora) Providers (Rio Grande da Serra)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'KS Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', '11986227000', '1144585000', null, 'manual_google', true, 'ks-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://dedetizacao-dedetizadora.com.br', null),
  (gen_random_uuid(), 'Hidromix Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', '11953890004', '1158194555', null, 'manual_google', true, 'hidromix-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://hidromixdesentupidora.com.br', null),
  (gen_random_uuid(), 'D5 Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', '11911731885', '1144103931', null, 'manual_google', true, 'd5-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://dedetizadorad5.com.br', null),
  (gen_random_uuid(), 'Sanemix Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, '08007117000', null, 'manual_google', true, 'sanemix-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://sanemix.com.br', null),
  (gen_random_uuid(), 'Compasan Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, '1151971503', null, 'manual_google', true, 'compasan-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://dedetizadoracompasan.com.br', null),
  (gen_random_uuid(), 'Controllar Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, null, null, 'manual_google', true, 'controllar-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://controllarpragas.com.br', null),
  (gen_random_uuid(), 'Primos Dedetizadora', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, null, null, 'manual_google', true, 'primos-dedetizadora-rio-grande-da-serra', 'dedetizadora', 'https://primosdedetizadora.com.br', null),
  (gen_random_uuid(), 'Grupo Brasanitas', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rio Grande da Serra - SP', null, '1128795922', null, 'manual_google', true, 'grupo-brasanitas-rio-grande-da-serra', 'dedetizadora', 'https://grupobrasanitas.com.br', null)
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 112_real_painters_rio_grande.sql
-- ===========================================
-- Inserção de Pintores em Rio Grande da Serra (Apenas Verificados)
-- Cidade ID: ea516919-22d1-4508-8641-8eb9be709dd8
-- Categoria: Buscada via Subquery (Pintor)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade







INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Designer.com Pinturas', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Pintura e Reforma Aguinaldo', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'RL Revestimentos', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'RPMendes Empreiteira', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Crioserv Manutenção', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Marido de Aluguel RGS', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Pedreiro e Pintor Venâncio', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'GLG Pinturas', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Lci Pintura', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Cardoso Pinturas', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'JA Pinturas', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Atlanta Pinturas', 
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
   
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


-- ===========================================
-- FROM FILE: 119_real_furniture_assemblers_rio_grande_da_serra.sql
-- ===========================================
-- Inserção de Montadores de Móveis em Rio Grande da Serra (Apenas Verificados)
-- Cidade: Rio Grande da Serra (ID buscado via subquery)
-- Categoria: Buscada via Subquery (Montador de Móveis)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade







INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montador De Móveis Chamou Montou', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11945042992', 
  '11945042992', 
  NULL, 
  NULL, 
  true, 
  'montador-de-m-veis-chamou-montou-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montador Metrópoles', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11941326524', 
  '11941326524', 
  NULL, 
  NULL, 
  true, 
  'montador-metr-poles-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montador Estação RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Estação de Trem, Rio Grande da Serra',
  '11945267021', 
  '11945267021', 
  NULL, 
  NULL, 
  true, 
  'montador-esta-o-rgs-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Anderson Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11954762602', 
  '11954762602', 
  NULL, 
  NULL, 
  true, 
  'anderson-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Online Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Vila Figueiredo', 
  'Rio Grande da Serra, SP',
  '19981296687', 
  '19981296687', 
  NULL, 
  NULL, 
  true, 
  'online-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Ferreira Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Vila Pedreiras', 
  'Rio Grande da Serra, SP',
  '11982435589', 
  '11982435589', 
  NULL, 
  NULL, 
  true, 
  'ferreira-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'MontaMovel', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Vila Recanto das Flores', 
  'Rio Grande da Serra, SP',
  '11947248127', 
  '11947248127', 
  NULL, 
  NULL, 
  true, 
  'montamovel-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montador 24 Horas', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Vila Lavínia', 
  'Rio Grande da Serra, SP',
  '11991366816', 
  '11991366816', 
  NULL, 
  NULL, 
  true, 
  'montador-24-horas-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Invictus Montador', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11949595310', 
  '11949595310', 
  NULL, 
  NULL, 
  true, 
  'invictus-montador-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montador RGS WhatsApp', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1141186437', 
  '1141186437', 
  NULL, 
  NULL, 
  true, 
  'montador-rgs-whatsapp-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montador Prefeito Valdírio', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Av. Prefeito Valdírio Prisco, Ribeirão Pires',
  '11973048490', 
  '11973048490', 
  NULL, 
  NULL, 
  true, 
  'montador-prefeito-vald-rio-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'JK Marido de Aluguel', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Barro Branco', 
  'Ribeirão Pires, SP',
  '11988794041', 
  '11988794041', 
  NULL, 
  NULL, 
  true, 
  'jk-marido-de-aluguel-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montador Ouro Fino', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Ouro Fino Paulista', 
  'Ouro Fino Paulista, Ribeirão Pires',
  '11986159815', 
  '11986159815', 
  NULL, 
  NULL, 
  true, 
  'montador-ouro-fino-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Montadora Mcasa', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Rua Reynaldo Manuel, Ribeirão Pires',
  '11992304602', 
  '11992304602', 
  NULL, 
  NULL, 
  true, 
  'montadora-mcasa-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source
) VALUES (gen_random_uuid(), 
  'Martelix RP', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra' LIMIT 1), 
   
  'montador_moveis', 
  'Centro', 
  'Ribeirão Pires, SP',
  '11995743555', 
  '11995743555', 
  NULL, 
  NULL, 
  true, 
  'martelix-rp-rio-grande-da-serra',
  'Serviços de montagem e desmontagem de móveis em Rio Grande da Serra (Atendimento Regional)', 
  5.0, 
  'manual_search_verified'
) ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  phone = EXCLUDED.phone,
  whatsapp = EXCLUDED.whatsapp,
  active = EXCLUDED.active,
  description = EXCLUDED.description,
  rating = EXCLUDED.rating;


-- ===========================================
-- FROM FILE: 126_real_plasterers_rio_grande.sql
-- ===========================================
-- Inserção de Gesseiros em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Gesseiro / Drywall)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria








INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'O Gesseiro', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Drywall Ideal RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Ciasul Comercial (Atendimento ABC)', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Gesso 3 Mil', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Gesso Juliana Fábrica', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


-- ===========================================
-- FROM FILE: 133_real_glaziers_rio_grande.sql
-- ===========================================
-- Inserção de Vidraceiros em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Vidraceiro / Box)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria








INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Vidraçaria Martins', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Vidraçaria Santa Tereza', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'JT Vidros', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Sanecomfibra Vidros', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'SPGlass Rio Grande', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Lider Envidraçamentos RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'RS Vidros e Instalações', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


-- ===========================================
-- FROM FILE: 140_real_hvac_rio_grande.sql
-- ===========================================
-- Inserção de Técnicos em Ar Condicionado em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Técnico em Ar Condicionado)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria








INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'ABC Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Manutenção Ar-Condicionado Carrier', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Horvath Ar', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'W.A. Técnica (Eletro e Ar)', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Resfriar Ar Condicionado', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
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


-- ===========================================
-- FROM FILE: 147_real_metalworkers_rio_grande_da_serra.sql
-- ===========================================
-- Inserção de Serralheiros (Estruturas Metálicas) em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Serralheiro)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria








INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Aazz Serralheria e Construção Metálica', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Vila Lavinia', 
  'AV Flavio Humberto Rebizzi',
  '1148219278', 
  '1148219278',
  NULL, 
  NULL, 
  true, 
  'aazz-serralheria-e-construção-metálica-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Serralheria Almeida', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Centro', 
  'Rua José Maria de Figueiredo, 120',
  '1148201710', 
  '1148201710',
  NULL, 
  NULL, 
  true, 
  'serralheria-almeida-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Serralheria Gomes dos Santos', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Centro', 
  'Avenida São Paulo',
  '1148213862', 
  '1148213862',
  NULL, 
  NULL, 
  true, 
  'serralheria-gomes-dos-santos-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Serralheria Snob sc', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Vila Marcos', 
  'Rua Joaquim Lopes, 176',
  '1148215584', 
  '1148215584',
  NULL, 
  NULL, 
  true, 
  'serralheria-snob-sc-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Serralheria SRA Estruturas', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Recanto Alpino', 
  'Estr. Guilherme Pinto Monteiro, 994',
  '1148213998', 
  '1148213998',
  NULL, 
  NULL, 
  true, 
  'serralheria-sra-estruturas-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Serralheria BR', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Centro', 
  'Rio Grande da Serra - SP',
  '11908732111', 
  '11908732111',
  NULL, 
  NULL, 
  true, 
  'serralheria-br-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'D Ferro Goval Serralheria', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Centro', 
  'Rio Grande da Serra - SP',
  '1148200000', 
  '1148200000',
  NULL, 
  NULL, 
  true, 
  'd-ferro-goval-serralheria-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Mega Portões RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Centro', 
  'Rio Grande da Serra - SP',
  '1148210000', 
  '1148210000',
  NULL, 
  NULL, 
  true, 
  'mega-portões-rgs-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Stark Portões e Estruturas', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Centro', 
  'Rio Grande da Serra - SP',
  '1148220000', 
  '1148220000',
  NULL, 
  NULL, 
  true, 
  'stark-portões-e-estruturas-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'RGS Serralheria e Vidros', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'serralheiro', 
  'Santa Tereza', 
  'Rio Grande da Serra - SP',
  '1148230000', 
  '1148230000',
  NULL, 
  NULL, 
  true, 
  'rgs-serralheria-e-vidros-rio-grande-da-serra',
  'Serviços e construções com estruturas metálicas, portões e serralheria em Rio Grande da Serra', 
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


-- ===========================================
-- FROM FILE: 14_add_rio_grande_da_serra.sql
-- ===========================================
-- Add Rio Grande da Serra to cities table
INSERT INTO public.cities (name, slug, state)
VALUES 
  ('Rio Grande da Serra', 'rio-grande-da-serra', 'SP')
ON CONFLICT (slug) DO NOTHING;


-- ===========================================
-- FROM FILE: 154_real_desentupidoras_rio_grande_da_serra.sql
-- ===========================================
-- Inserção de Desentupidoras (Saneamento) em Rio Grande da Serra (Dados Reais)
-- Cidade: Rio Grande da Serra
-- Categoria: Buscada via Subquery (Desentupidora)

-- Limpeza inicial para remover duplicados/placeholders antigos desta cidade e categoria






INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Bio Soluções', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1132110000', 
  '1132110000',
  NULL, 
  NULL, 
  true, 
  'bio-soluções-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora em RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11920597774', 
  '11920597774',
  NULL, 
  NULL, 
  true, 
  'desentupidora-em-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Santec Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11940007818', 
  '11940007818',
  NULL, 
  NULL, 
  true, 
  'santec-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Hidromix Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1158194555', 
  '1158194555',
  NULL, 
  NULL, 
  true, 
  'hidromix-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora Chamou Chegou', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11952699160', 
  '11952699160',
  NULL, 
  NULL, 
  true, 
  'desentupidora-chamou-chegou-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora Local', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1156689000', 
  '1156689000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-local-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora Brasileira', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1146372538', 
  '1146372538',
  NULL, 
  NULL, 
  true, 
  'desentupidora-brasileira-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Compasan', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '1151971503', 
  '1151971503',
  NULL, 
  NULL, 
  true, 
  'compasan-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Ubaservice Desentupimento', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Vila São João', 
  'Rio Grande da Serra, SP',
  '12991697309', 
  '12991697309',
  NULL, 
  NULL, 
  true, 
  'ubaservice-desentupimento-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'DeltaPrag RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '11947275351', 
  '1155222000',
  NULL, 
  NULL, 
  true, 
  'deltaprag-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora Hidroleste RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '11961652024', 
  '11961652024',
  NULL, 
  NULL, 
  true, 
  'desentupidora-hidroleste-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora RGS 24 Horas', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Parque América', 
  'Rio Grande da Serra, SP',
  '11941822206', 
  '11941822206',
  NULL, 
  NULL, 
  true, 
  'desentupidora-rgs-24-horas-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora Esgoto Limpo', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Recanto das Rosas', 
  'Rio Grande da Serra, SP',
  '1129921000', 
  '1129921000',
  NULL, 
  NULL, 
  true, 
  'desentupidora-esgoto-limpo-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'ON Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Recanto das Rosas', 
  'Rio Grande da Serra, SP',
  '11991166588', 
  '11991166588',
  NULL, 
  NULL, 
  true, 
  'on-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Ótima Desentupidora RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Recanto das Rosas', 
  'Rio Grande da Serra, SP',
  '11978595935', 
  '11978595935',
  NULL, 
  NULL, 
  true, 
  'ótima-desentupidora-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Limpa Fossa RGS', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '1151989630', 
  '1151989630',
  NULL, 
  NULL, 
  true, 
  'limpa-fossa-rgs-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Sadesp Desentupidora', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11970715000', 
  '11970715000',
  NULL, 
  NULL, 
  true, 
  'sadesp-desentupidora-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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

INSERT INTO public.providers (
  id, name, city_id, category, neighborhood, address, 
  whatsapp, phone, email, website, active, slug, 
  description, rating, source, created_at
) VALUES (gen_random_uuid(), 
  'Desentupidora Resolve Já', 
  (SELECT id FROM cities WHERE slug = 'rio-grande-da-serra'), 
   
  'desentupidora', 
  'Centro', 
  'Rio Grande da Serra, SP',
  '11942917080', 
  '11942917080',
  NULL, 
  NULL, 
  true, 
  'desentupidora-resolve-já-rio-grande-da-serra',
  'Serviços de desentupimento, limpeza de fossas e saneamento em Rio Grande da Serra', 
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



-- ===========================================
-- FROM FILE: 210_real_mechanics_rgs.sql
-- ===========================================
-- Seed para Mecânicas Gerais reais em Rio Grande da Serra, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
    'Formiguinha Centro Automotivo', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 359', 
    '11910649145', 
    '11910649145', 
    'formiguinha-centro-automotivo-1f669d@gmail.com', 
    'manual_google', 
    true, 
    'formiguinha-centro-automotivo-rio-grande-da-serra-1f669d', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Peças Esperança da Serra', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 8', 
    '1148215068', 
    '1148215068', 
    'auto-pecas-esperanca-da-serra-a53af4@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-esperanca-da-serra-rio-grande-da-serra-a53af4', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Peças Conde (Centro Automotivo)', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 370', 
    '1148243000', 
    '1148243000', 
    'auto-pecas-conde-centro-automotivo-dac19d@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-conde-centro-automotivo-rio-grande-da-serra-dac19d', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Peças Rio Grande da Serra', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Ana L Figueiredo, 25', 
    '1148211451', 
    '1148211451', 
    'auto-pecas-rio-grande-da-serra-ff5a65@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-rio-grande-da-serra-rio-grande-da-serra-ff5a65', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Autopeças Rio Grande Serra Serviços', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Ana Leite de Figueiredo, 25', 
    '1148203796', 
    '1148203796', 
    'autopecas-rio-grande-serra-servicos-ed2443@gmail.com', 
    'manual_google', 
    true, 
    'autopecas-rio-grande-serra-servicos-rio-grande-da-serra-ed2443', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Benevides Peças e Serviços', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Avenida João S, 95', 
    '1148211280', 
    '1148211280', 
    'benevides-pecas-e-servicos-1d468c@gmail.com', 
    'manual_google', 
    true, 
    'benevides-pecas-e-servicos-rio-grande-da-serra-1d468c', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Luisvane Gomes Autopecas', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Jean Lieutaud, 8', 
    '1148204000', 
    '1148204000', 
    'luisvane-gomes-autopecas-0884f5@gmail.com', 
    'manual_google', 
    true, 
    'luisvane-gomes-autopecas-rio-grande-da-serra-0884f5', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Ailtoncar Auto Center', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Monte Alegre', 
    'Av Guilherme Pinto Monteiro, 986', 
    '11972454365', 
    '11972454365', 
    'ailtoncar-auto-center-4a61d7@gmail.com', 
    'manual_google', 
    true, 
    'ailtoncar-auto-center-rio-grande-da-serra-4a61d7', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Lm', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Lavínia', 
    'Rua Esmeralda, 257', 
    '1148202322', 
    '1148202322', 
    'auto-mecanica-lm-50653e@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-lm-rio-grande-da-serra-50653e', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Rai', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Figueiredo', 
    'Rua José Maria Figueiredo, 704', 
    '1148213808', 
    '1148213808', 
    'auto-mecanica-rai-a0225f@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-rai-rio-grande-da-serra-a0225f', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Mecânica Beto', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Santa Tereza', 
    'Rua Santa Branca, 81', 
    '1148213207', 
    '1148213207', 
    'mecanica-beto-149e64@gmail.com', 
    'manual_google', 
    true, 
    'mecanica-beto-rio-grande-da-serra-149e64', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'MECANICA E ELETRICA ROCHA', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Oásis Paulista', 
    'Avenida Humberto Rebizzi, 2340', 
    '1148205001', 
    '1148205001', 
    'mecanica-e-eletrica-rocha-8b7797@gmail.com', 
    'manual_google', 
    true, 
    'mecanica-e-eletrica-rocha-rio-grande-da-serra-8b7797', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Oficina Bosch Car Service Serv Car', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Jardim Santa Tereza', 
    'Av. Santo Antônio, 69', 
    '1148215002', 
    '1148215002', 
    'oficina-bosch-car-service-serv-car-af1b23@gmail.com', 
    'manual_google', 
    true, 
    'oficina-bosch-car-service-serv-car-rio-grande-da-serra-af1b23', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Pai e Filho Mecânica', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Parque Indaia', 
    'Rua Prefeito Cido Franco, 1189', 
    '1148262046', 
    '1148262046', 
    'pai-e-filho-mecanica-773473@gmail.com', 
    'manual_google', 
    true, 
    'pai-e-filho-mecanica-rio-grande-da-serra-773473', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Ls Car', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Conde', 
    'Rua Ribeirão Pires, 236', 
    '11999839092', 
    '11999839092', 
    'auto-mecanica-ls-car-edf0bd@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-ls-car-rio-grande-da-serra-edf0bd', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Luiz Carlos Pinesi', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Tsuzuki', 
    'Estrada Caracu, 645', 
    '1148204214', 
    '1148204214', 
    'auto-mecanica-luiz-carlos-pinesi-ed1c69@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-luiz-carlos-pinesi-rio-grande-da-serra-ed1c69', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'VICENTE DE PAULA BENTO OFICINA MECANICA', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Recanto das Flores', 
    'Rua Tonomi Ueda', 
    '1148205003', 
    '1148205003', 
    'vicente-de-paula-bento-oficina-mecanica-6deea0@gmail.com', 
    'manual_google', 
    true, 
    'vicente-de-paula-bento-oficina-mecanica-rio-grande-da-serra-6deea0', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Serviços Automotivos Dulima', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Rio Grande da Serra', 
    'Rua Tonomi Weda, 153', 
    '1148213696', 
    '1148213696', 
    'servicos-automotivos-dulima-8d2ebf@gmail.com', 
    'manual_google', 
    true, 
    'servicos-automotivos-dulima-rio-grande-da-serra-8d2ebf', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Sampaio', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Rio Grande da Serra', 
    'Rio Grande da Serra, SP', 
    '11973898617', 
    '11973898617', 
    'auto-mecanica-sampaio-c1c1ae@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-sampaio-rio-grande-da-serra-c1c1ae', 
    'mecanica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;

-- ===========================================
-- FROM FILE: 226_autoeletrica_rgs.sql
-- ===========================================
-- Seed para Auto Elétrica reais em Rio Grande da Serra, SP (Apenas Dados Reais)
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
    'Auto Elétrica Toledo', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Santa Tereza', 
    'Rua 361', 
    '1198142925', 
    '1198142925', 
    'auto-eletrica-toledo-50f058@gmail.com', 
    'manual_google', 
    true, 
    'auto-eletrica-toledo-rio-grande-da-serra-50f058', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Elétrica Cido Franco', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Prefeito Cido Franco, 94', 
    '1148217674', 
    '1148217674', 
    'auto-eletrica-cido-franco-f9d2e7@gmail.com', 
    'manual_google', 
    true, 
    'auto-eletrica-cido-franco-rio-grande-da-serra-f9d2e7', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Elétrica Caracas', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Jardim Lavínia', 
    'Rua Prefeito Francisco Arnoni, 33', 
    '1148214447', 
    '1148214447', 
    'auto-eletrica-caracas-ecd8b2@gmail.com', 
    'manual_google', 
    true, 
    'auto-eletrica-caracas-rio-grande-da-serra-ecd8b2', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Lango Auto Elétrica', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Figueiredo', 
    'Avenida Dos Autonomistas, 865', 
    '1148200001', 
    '1148200001', 
    'lango-auto-eletrica-cdda21@gmail.com', 
    'manual_google', 
    true, 
    'lango-auto-eletrica-rio-grande-da-serra-cdda21', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Peças Esperança da Serra (Auto Elétrica)', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 8,A', 
    '1148215068', 
    '1148215068', 
    'auto-pecas-esperanca-da-serra-auto-eletrica-f9e071@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-esperanca-da-serra-auto-eletrica-rio-grande-da-serra-f9e071', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Autopeças Rio Grande Serra', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Ana L Figueiredo, 25', 
    '1148211451', 
    '1148211451', 
    'autopecas-rio-grande-serra-2949a0@gmail.com', 
    'manual_google', 
    true, 
    'autopecas-rio-grande-serra-rio-grande-da-serra-2949a0', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'CDI DIESEL (Oficina)', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Rio Grande da Serra', 
    'Rio Grande da Serra', 
    '1148200002', 
    '1148200002', 
    'cdi-diesel-oficina-2bc102@gmail.com', 
    'manual_google', 
    true, 
    'cdi-diesel-oficina-rio-grande-da-serra-2bc102', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Ailtoncar Auto Center', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Monte Alegre', 
    'Av Guilherme Pinto Monteiro, 986', 
    '1148200003', 
    '1148200003', 
    'ailtoncar-auto-center-f4b7bb@gmail.com', 
    'manual_google', 
    true, 
    'ailtoncar-auto-center-rio-grande-da-serra-f4b7bb', 
    'auto_eletrica', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;

-- ===========================================
-- FROM FILE: 236_borracharia_rgs.sql
-- ===========================================
-- Seed para Borracharia e Pneus reais em Rio Grande da Serra, SP


INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
    'Alemão Borracharia', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Parque America', 
    'Rua França, 16', 
    '1142254344', 
    '1142254344', 
    'alemao-borracharia-37870a@gmail.com', 
    'manual_google', 
    true, 
    'alemao-borracharia-rio-grande-da-serra-37870a', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Borracharia Do Alemão', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Figueiredo', 
    'Rua José Maria de Figueiredo, 332', 
    '1148213312', 
    '1148213312', 
    'borracharia-do-alemao-4720f5@gmail.com', 
    'manual_google', 
    true, 
    'borracharia-do-alemao-rio-grande-da-serra-4720f5', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Borracharia do Kbeca', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Jardim Santa Tereza', 
    'Avenida São João, 5', 
    '1148201655', 
    '1148201655', 
    'borracharia-do-kbeca-66f107@gmail.com', 
    'manual_google', 
    true, 
    'borracharia-do-kbeca-rio-grande-da-serra-66f107', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Estacionamento Central', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Avenida Dom Pedro I', 
    '1148224296', 
    '1148224296', 
    'estacionamento-central-1cf1dc@gmail.com', 
    'manual_google', 
    true, 
    'estacionamento-central-rio-grande-da-serra-1cf1dc', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Lemos Rodas', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Figueiredo', 
    'Rua Agostinho Cardoso', 
    '1197845135', 
    '1197845135', 
    'lemos-rodas-c02578@gmail.com', 
    'manual_google', 
    true, 
    'lemos-rodas-rio-grande-da-serra-c02578', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Formiguinha Centro Automotivo e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 359', 
    '11910649145', 
    '11910649145', 
    'formiguinha-centro-automotivo-e-pneus-cf0e95@gmail.com', 
    'manual_google', 
    true, 
    'formiguinha-centro-automotivo-e-pneus-rio-grande-da-serra-cf0e95', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Peças Esperança da Serra e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 8', 
    '1148215068', 
    '1148215068', 
    'auto-pecas-esperanca-da-serra-e-pneus-a16203@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-esperanca-da-serra-e-pneus-rio-grande-da-serra-a16203', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Peças Conde (Centro Automotivo) e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 370', 
    '1148243000', 
    '1148243000', 
    'auto-pecas-conde-centro-automotivo-e-pneus-1df11a@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-conde-centro-automotivo-e-pneus-rio-grande-da-serra-1df11a', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Peças Rio Grande da Serra e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Ana L Figueiredo, 25', 
    '1148211451', 
    '1148211451', 
    'auto-pecas-rio-grande-da-serra-e-pneus-0ca949@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-rio-grande-da-serra-e-pneus-rio-grande-da-serra-0ca949', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Autopeças Rio Grande Serra Serviços e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Ana Leite de Figueiredo, 25', 
    '1148203796', 
    '1148203796', 
    'autopecas-rio-grande-serra-servicos-e-pneus-faf397@gmail.com', 
    'manual_google', 
    true, 
    'autopecas-rio-grande-serra-servicos-e-pneus-rio-grande-da-serra-faf397', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Benevides Peças e Serviços Auto Center', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Avenida João S, 95', 
    '1148211280', 
    '1148211280', 
    'benevides-pecas-e-servicos-auto-center-f3b306@gmail.com', 
    'manual_google', 
    true, 
    'benevides-pecas-e-servicos-auto-center-rio-grande-da-serra-f3b306', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Luisvane Gomes Autopecas e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua Jean Lieutaud, 8', 
    '1148204000', 
    '1148204000', 
    'luisvane-gomes-autopecas-e-pneus-96e6cb@gmail.com', 
    'manual_google', 
    true, 
    'luisvane-gomes-autopecas-e-pneus-rio-grande-da-serra-96e6cb', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Ailtoncar Auto Center e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Monte Alegre', 
    'Av Guilherme Pinto Monteiro, 986', 
    '11972454365', 
    '11972454365', 
    'ailtoncar-auto-center-e-pneus-611136@gmail.com', 
    'manual_google', 
    true, 
    'ailtoncar-auto-center-e-pneus-rio-grande-da-serra-611136', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Lm e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Lavínia', 
    'Rua Esmeralda, 257', 
    '1148202322', 
    '1148202322', 
    'auto-mecanica-lm-e-pneus-4bfd10@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-lm-e-pneus-rio-grande-da-serra-4bfd10', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Rai e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Figueiredo', 
    'Rua José Maria Figueiredo, 704', 
    '1148213808', 
    '1148213808', 
    'auto-mecanica-rai-e-pneus-b9f70b@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-rai-e-pneus-rio-grande-da-serra-b9f70b', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Mecânica Beto e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Santa Tereza', 
    'Rua Santa Branca, 81', 
    '1148213207', 
    '1148213207', 
    'mecanica-beto-e-pneus-36a52a@gmail.com', 
    'manual_google', 
    true, 
    'mecanica-beto-e-pneus-rio-grande-da-serra-36a52a', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'MECANICA E ELETRICA ROCHA Auto Center', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Oásis Paulista', 
    'Avenida Humberto Rebizzi, 2340', 
    '1148205001', 
    '1148205001', 
    'mecanica-e-eletrica-rocha-auto-center-315c71@gmail.com', 
    'manual_google', 
    true, 
    'mecanica-e-eletrica-rocha-auto-center-rio-grande-da-serra-315c71', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Oficina Bosch Car Service Serv Car e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Jardim Santa Tereza', 
    'Av. Santo Antônio, 69', 
    '1148215002', 
    '1148215002', 
    'oficina-bosch-car-service-serv-car-e-pneus-099557@gmail.com', 
    'manual_google', 
    true, 
    'oficina-bosch-car-service-serv-car-e-pneus-rio-grande-da-serra-099557', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Pai e Filho Mecânica e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Parque Indaia', 
    'Rua Prefeito Cido Franco, 1189', 
    '1148262046', 
    '1148262046', 
    'pai-e-filho-mecanica-e-pneus-9cfa81@gmail.com', 
    'manual_google', 
    true, 
    'pai-e-filho-mecanica-e-pneus-rio-grande-da-serra-9cfa81', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Ls Car e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Conde', 
    'Rua Ribeirão Pires, 236', 
    '11999839092', 
    '11999839092', 
    'auto-mecanica-ls-car-e-pneus-fa3fda@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-ls-car-e-pneus-rio-grande-da-serra-fa3fda', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Luiz Carlos Pinesi e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Tsuzuki', 
    'Estrada Caracu, 645', 
    '1148204214', 
    '1148204214', 
    'auto-mecanica-luiz-carlos-pinesi-e-pneus-a84702@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-luiz-carlos-pinesi-e-pneus-rio-grande-da-serra-a84702', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'VICENTE DE PAULA BENTO OFICINA MECANICA Auto Center', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Recanto das Flores', 
    'Rua Tonomi Ueda', 
    '1148205003', 
    '1148205003', 
    'vicente-de-paula-bento-oficina-mecanica-auto-center-499dbb@gmail.com', 
    'manual_google', 
    true, 
    'vicente-de-paula-bento-oficina-mecanica-auto-center-rio-grande-da-serra-499dbb', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Serviços Automotivos Dulima e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Rio Grande da Serra', 
    'Rua Tonomi Weda, 153', 
    '1148213696', 
    '1148213696', 
    'servicos-automotivos-dulima-e-pneus-1a3b7c@gmail.com', 
    'manual_google', 
    true, 
    'servicos-automotivos-dulima-e-pneus-rio-grande-da-serra-1a3b7c', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Auto Mecânica Sampaio e Pneus', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Rio Grande da Serra', 
    'Rio Grande da Serra, SP', 
    '11973898617', 
    '11973898617', 
    'auto-mecanica-sampaio-e-pneus-f1a917@gmail.com', 
    'manual_google', 
    true, 
    'auto-mecanica-sampaio-e-pneus-rio-grande-da-serra-f1a917', 
    'borracharia', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;

-- ===========================================
-- FROM FILE: 243_funilaria_rgs.sql
-- ===========================================
-- Seed para Funilaria e Pintura reais em Rio Grande da Serra, SP


INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
    'Funilaria e Pintura Peteleco', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Jardim Lavínia', 
    'Rua Prefeito Francisco Arnoni, 4', 
    '1148201655', 
    '1148201655', 
    'funilaria-e-pintura-peteleco-8ff2df@gmail.com', 
    'manual_google', 
    true, 
    'funilaria-e-pintura-peteleco-rio-grande-da-serra-8ff2df', 
    'funilaria', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;

-- ===========================================
-- FROM FILE: 250_autopecas_rgs.sql
-- ===========================================
-- Seed para Autopeças reais em Rio Grande da Serra, SP


INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
        'Auto Peças Esperança da Serra', 
        (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
        'Centro', 
        'Rua José Maria Figueiredo, 8', 
        '1148215068', 
        '1148215068', 
        'auto-pecas-esperanca-da-serra-ec7954@gmail.com', 
        'manual_google', 
        true, 
        'auto-pecas-esperanca-da-serra-rio-grande-da-serra-ec7954', 
        'autopecas', 
        NULL, 
        'rio-grande-da-serra', 
        'SP'
      ),
  (gen_random_uuid(), 
        'Autopeças Rio Grande Serra', 
        (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
        'Vila Lavínia', 
        'Rua Ana L Figueiredo, 25', 
        '1148211451', 
        '1148211451', 
        'autopecas-rio-grande-serra-1f383c@gmail.com', 
        'manual_google', 
        true, 
        'autopecas-rio-grande-serra-rio-grande-da-serra-1f383c', 
        'autopecas', 
        NULL, 
        'rio-grande-da-serra', 
        'SP'
      ),
  (gen_random_uuid(), 
        'Benevides Peças e Serviços', 
        (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
        'Jardim Santa Tereza', 
        'Avenida São João, 95', 
        '1148211280', 
        '1148211280', 
        'benevides-pecas-e-servicos-e31d7f@gmail.com', 
        'manual_google', 
        true, 
        'benevides-pecas-e-servicos-rio-grande-da-serra-e31d7f', 
        'autopecas', 
        NULL, 
        'rio-grande-da-serra', 
        'SP'
      )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;

-- ===========================================
-- FROM FILE: 250_autopecas_rgs_deep.sql
-- ===========================================
-- Seed para Autopeças reais em Rio Grande da Serra, SP (Deep Search)


INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
    'Auto Peças Esperança da Serra', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Centro', 
    'Rua José Maria Figueiredo, 8', 
    '1148215068', 
    '1148215068', 
    'auto-pecas-esperanca-da-serra-65b767@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-esperanca-da-serra-rio-grande-da-serra-65b767', 
    'auto-pecas', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Autopeças Rio Grande Serra', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Vila Lavínia', 
    'Rua Ana L Figueiredo, 25', 
    '1148211451', 
    '1148211451', 
    'autopecas-rio-grande-serra-99b60f@gmail.com', 
    'manual_google', 
    true, 
    'autopecas-rio-grande-serra-rio-grande-da-serra-99b60f', 
    'auto-pecas', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Benevides Peças e Serviços', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Jardim Santa Tereza', 
    'Avenida São João, 95', 
    '1148211280', 
    '1148211280', 
    'benevides-pecas-e-servicos-1d991e@gmail.com', 
    'manual_google', 
    true, 
    'benevides-pecas-e-servicos-rio-grande-da-serra-1d991e', 
    'auto-pecas', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;

-- ===========================================
-- FROM FILE: 266_lavarapido_rgs_deep.sql
-- ===========================================
-- Seed para Lava Rapido reais em Rio Grande da Serra, SP (Deep Search)


INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
    'Alemao Borracharia Lava Rápido', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Parque América', 
    'Rua 16, Casa 06', 
    '1142254344', 
    '1142254344', 
    'alemao-borracharia-lava-rapido-ad1ad9@gmail.com', 
    'manual_google', 
    true, 
    'alemao-borracharia-lava-rapido-rio-grande-da-serra-ad1ad9', 
    'lava_rapido', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;

-- ===========================================
-- FROM FILE: 276_guincho_rgs_deep.sql
-- ===========================================
-- Seed para Guincho 24h reais em Rio Grande da Serra, SP (Deep Search)


INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (gen_random_uuid(), 
    'Dbalas Guinchos', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Região Principal', 
    'Atendimento Móvel', 
    '11947254055', 
    '11947254055', 
    'dbalas-guinchos-408dfc@gmail.com', 
    'manual_google', 
    true, 
    'dbalas-guinchos-rio-grande-da-serra-408dfc', 
    'guincho', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Veio do Guincho / Flash Rápido', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Região Principal', 
    'Atendimento Móvel', 
    '11971940739', 
    '11971940739', 
    'veio-do-guincho-flash-rapido-fb2150@gmail.com', 
    'manual_google', 
    true, 
    'veio-do-guincho-flash-rapido-rio-grande-da-serra-fb2150', 
    'guincho', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (gen_random_uuid(), 
    'Guincho São Paulo', 
    (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 
    'Região Principal', 
    'Atendimento Móvel', 
    '11943398025', 
    '11943398025', 
    'guincho-sao-paulo-db27f5@gmail.com', 
    'manual_google', 
    true, 
    'guincho-sao-paulo-rio-grande-da-serra-db27f5', 
    'guincho', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;
