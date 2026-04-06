-- 1. Ensure City Exists (Ribeirão Pires)
INSERT INTO public.cities (name, slug, state)
VALUES ('Ribeirão Pires', 'ribeirao-pires', 'SP')
ON CONFLICT (slug) DO NOTHING;

-- 2. Insert Providers (Automotive)
-- Using gen_random_uuid() for IDs
INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Via Brasil Automóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Prefeito Valdírio Prisco, 396', '11942798763', '1148237224', 'contato@viabrasilautos.com.br', 'manual_google', true, 'via-brasil-automoveis-ribeirao-pires', 'automoveis', 'https://www.viabrasilautos.com.br', null),
  (gen_random_uuid(), 'CS Motors', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Avenida Valdírio Prisco, 333', '11942468181', '1148248181', 'contato@csmotors.com.br', 'manual_google', true, 'cs-motors-ribeirao-pires', 'automoveis', 'https://www.csmotors.com.br', null),
  (gen_random_uuid(), 'Capitão Multimarcas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Capitão José Galo, 860', '11971940196', '1148580684', 'contato@capitaomultimarcas.com.br', 'manual_google', true, 'capitao-multimarcas-ribeirao-pires', 'automoveis', 'https://www.capitaomultimarcas.com.br', null),
  (gen_random_uuid(), 'Mauro Veículos', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Santa Luzia', 'Av. Francisco Monteiro, 1934', '1148265779', '1148265779', 'contato@mauroveiculos.com.br', 'manual_google', true, 'mauro-veiculos-ribeirao-pires', 'automoveis', null, null),
  (gen_random_uuid(), 'OfferCar', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Miguel Prisco, 441', '1148276000', '1148276000', 'contato@offercar.com.br', 'manual_google', true, 'offercar-ribeirao-pires', 'automoveis', 'https://www.offercar.com.br', null),
  (gen_random_uuid(), 'Adm Car', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Avenida Francisco Monteiro, 100', '1148275283', '1148275283', 'contato@admcar.com.br', 'manual_google', true, 'adm-car-ribeirao-pires', 'automoveis', null, null),
  (gen_random_uuid(), 'Panorama Veículos', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Avenida Valdírio Prisco, 980', '11997751700', '1125951700', 'contato@panoramaveiculos.com.br', 'manual_google', true, 'panorama-veiculos-ribeirao-pires', 'automoveis', 'https://www.panoramaveiculos.com.br', null),
  (gen_random_uuid(), 'Simões Veículos', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Capitão José Gallo, 862', '1148281000', '1148281000', 'contato@simoesveiculos.com.br', 'manual_google', true, 'simoes-veiculos-ribeirao-pires', 'automoveis', null, null),
  (gen_random_uuid(), 'Caricar Veículos', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Valdírio Prisco, 570', '1148285500', '1148285500', 'contato@caricarveiculos.com.br', 'manual_google', true, 'caricar-veiculos-ribeirao-pires', 'automoveis', 'https://www.caricarveiculos.com.br', null),
  (gen_random_uuid(), 'Iva Car Multimarcas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Miguel Prisco, 200', '1148252000', '1148252000', 'contato@ivacarmultimarcas.com.br', 'manual_google', true, 'iva-car-multimarcas-ribeirao-pires', 'automoveis', null, null),
  (gen_random_uuid(), 'Realiza Veículos', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Avenida Francisco Monteiro, 2665', '1148261000', '1148261000', 'contato@realizaveiculos.com.br', 'manual_google', true, 'realiza-veiculos-ribeirao-pires', 'automoveis', null, null),
  (gen_random_uuid(), 'Ideal Multimarcas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Capitão José Gallo, 1000', '1148231500', '1148231500', 'contato@idealmultimarcas.com.br', 'manual_google', true, 'ideal-multimarcas-ribeirao-pires', 'automoveis', 'https://www.idealveiculosrp.com.br', null)
ON CONFLICT (slug) DO NOTHING;
