-- 101. Insert Pest Control (Dedetizadora) Providers (Ribeirão Pires)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Encontrados com dados reais
  (gen_random_uuid(), 'Fran Prag Dedetizadora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Bocaina', 'Avenida Humberto de Campos, 676', '1148234920', '1148234920', null, 'manual_google', true, 'fran-prag-dedetizadora-ribeirao-pires', 'dedetizadora', 'https://franprag.com.br', null),
  (gen_random_uuid(), 'Vazatecx Dedetizadora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', '11947178130', '1142689904', null, 'manual_google', true, 'vazatecx-dedetizadora-ribeirao-pires', 'dedetizadora', 'https://vazatecx.com.br', null),
  (gen_random_uuid(), 'KS Serviços Dedetizadora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', null, '1144585000', null, 'manual_google', true, 'ks-servicos-dedetizadora-ribeirao-pires', 'dedetizadora', 'https://dedetizacao-dedetizadora.com.br', null),
  (gen_random_uuid(), 'Protec Pragas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', '11940103334', null, null, 'manual_google', true, 'protec-pragas-ribeirao-pires', 'dedetizadora', 'https://protecpragas.com.br', null),
  (gen_random_uuid(), 'DD Pilar Dedetizadora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', '11943710171', null, null, 'manual_google', true, 'dd-pilar-dedetizadora-ribeirao-pires', 'dedetizadora', 'https://dedetizadoraddpilar.com.br', null),
  (gen_random_uuid(), 'Zet-Tec Dedetizadora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'zet-tec-dedetizadora-ribeirao-pires', 'dedetizadora', 'https://zet-tecdedetizadora.com.br', null),
  (gen_random_uuid(), 'Universo Ambiental', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'universo-ambiental-ribeirao-pires', 'dedetizadora', 'https://universoambiental.eco.br', null),
  (gen_random_uuid(), 'Galli Dedetizadora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'galli-dedetizadora-ribeirao-pires', 'dedetizadora', 'https://dedetizadoragalli.com.br', null),
  (gen_random_uuid(), 'Os Cacas Pragas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'os-cacas-pragas-ribeirao-pires', 'dedetizadora', null, null),
  (gen_random_uuid(), 'D D Clim Dedetizadora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Ribeirão Pires - SP', null, null, null, 'manual_google', true, 'd-d-clim-dedetizadora-ribeirao-pires', 'dedetizadora', null, null)
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;
