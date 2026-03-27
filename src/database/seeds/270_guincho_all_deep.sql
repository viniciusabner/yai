-- Seed unificado para Guincho 24h (Deep Search - ABC Completo)

-- Seed para Guincho 24h reais em Santo André, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    'a6ee5747-6b8f-426b-ba6f-bfccc1d1530b', 
    'Rudge Ramos Guincho', 
    '85b13d20-450b-4ce2-ad14-146a13738fd1', 
    'Vila Americana', 
    'Rua São Gabriel, 312', 
    '11947876344', 
    '11947876344', 
    'rudge-ramos-guincho-a6ee57@gmail.com', 
    'manual_google', 
    true, 
    'rudge-ramos-guincho-santo-andre-a6ee57', 
    'guincho', 
    NULL, 
    'santo-andre', 
    'SP'
  ),
  (
    '1d9393ed-17a1-4673-883c-6db00b3bc9d5', 
    'KC Guinchos e Transportes', 
    '85b13d20-450b-4ce2-ad14-146a13738fd1', 
    'Santa Maria', 
    'Rua Aguapeí, 720', 
    '11988318088', 
    '11988318088', 
    'kc-guinchos-e-transportes-1d9393@gmail.com', 
    'manual_google', 
    true, 
    'kc-guinchos-e-transportes-santo-andre-1d9393', 
    'guincho', 
    NULL, 
    'santo-andre', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;

-- Seed para Guincho 24h reais em São Bernardo do Campo, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '63f5d4df-256d-4732-8e51-feffc5ef7a5f';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    'dfec0d49-8358-4ea1-b244-9b0cf9588c9d', 
    'Auto Socorro Nova Paulinho', 
    '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
    'Parque São Diogo', 
    'Rua Professor Almeida Prado, 69', 
    '1143415806', 
    '1143415806', 
    'auto-socorro-nova-paulinho-dfec0d@gmail.com', 
    'manual_google', 
    true, 
    'auto-socorro-nova-paulinho-sao-bernardo-do-campo-dfec0d', 
    'guincho', 
    NULL, 
    'sao-bernardo-do-campo', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;

-- Seed para Guincho 24h reais em São Caetano do Sul, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = 'd422ecad-80b4-450a-b364-ebb888d700e1';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '1409eebb-6879-481e-abbd-4a6cfdb4d29f', 
    'Guincho TLT', 
    'd422ecad-80b4-450a-b364-ebb888d700e1', 
    'Centro', 
    'Rua Para, 139', 
    '11984620630', 
    '11984620630', 
    'guincho-tlt-1409ee@gmail.com', 
    'manual_google', 
    true, 
    'guincho-tlt-sao-caetano-do-sul-1409ee', 
    'guincho', 
    NULL, 
    'sao-caetano-do-sul', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;

-- Seed para Guincho 24h reais em Diadema, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '205e475f-44aa-418f-8835-434cd5e913d2';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '0949b315-43be-4951-baa9-fe329547a94b', 
    'Amauri Serviço de reboque', 
    '205e475f-44aa-418f-8835-434cd5e913d2', 
    'Parque Sete de Setembro', 
    'Avenida Alda, 1345', 
    '11940245056', 
    '11940245056', 
    'amauri-servico-de-reboque-0949b3@gmail.com', 
    'manual_google', 
    true, 
    'amauri-servico-de-reboque-diadema-0949b3', 
    'guincho', 
    NULL, 
    'diadema', 
    'SP'
  ),
  (
    '8998f982-733e-4b2e-a46e-13dc11e20b1f', 
    'Auto Socorro Ferrari', 
    '205e475f-44aa-418f-8835-434cd5e913d2', 
    'Centro', 
    'Rua Salgado de Castro, 230', 
    '1140573873', 
    '1140573873', 
    'auto-socorro-ferrari-8998f9@gmail.com', 
    'manual_google', 
    true, 
    'auto-socorro-ferrari-diadema-8998f9', 
    'guincho', 
    NULL, 
    'diadema', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;

-- Seed para Guincho 24h reais em Mauá, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '6f15b756-1913-4ca0-81ea-5a82f11740a3';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '4aa8a37e-e312-4f11-b17e-da71e44c5b1a', 
    'Célio Guinchos', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11948989887', 
    '11948989887', 
    'celio-guinchos-4aa8a3@gmail.com', 
    'manual_google', 
    true, 
    'celio-guinchos-maua-4aa8a3', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  ),
  (
    '11a5dc21-98da-4c0d-993c-466bc2cbcdf9', 
    'Durique Guincho 24 Horas', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11947976523', 
    '11947976523', 
    'durique-guincho-24-horas-11a5dc@gmail.com', 
    'manual_google', 
    true, 
    'durique-guincho-24-horas-maua-11a5dc', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  ),
  (
    '85ff4806-e572-4406-b26c-9b58851273eb', 
    'Gabriel Guinchos', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '1141104959', 
    '1141104959', 
    'gabriel-guinchos-85ff48@gmail.com', 
    'manual_google', 
    true, 
    'gabriel-guinchos-maua-85ff48', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  ),
  (
    'aa5c5b49-2ac0-4cdd-80d5-0268517884f5', 
    'Rick Guinchos', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11995001828', 
    '11995001828', 
    'rick-guinchos-aa5c5b@gmail.com', 
    'manual_google', 
    true, 
    'rick-guinchos-maua-aa5c5b', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;

-- Seed para Guincho 24h reais em Ribeirão Pires, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    'b008cef8-ae3c-4fcd-a09e-906767245c24', 
    'Auto Socorro Bonitão', 
    '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
    'Centro', 
    'Rua Padre Marcos Simoni, 138', 
    '1148232599', 
    '1148232599', 
    'auto-socorro-bonitao-b008ce@gmail.com', 
    'manual_google', 
    true, 
    'auto-socorro-bonitao-ribeirao-pires-b008ce', 
    'guincho', 
    NULL, 
    'ribeirao-pires', 
    'SP'
  ),
  (
    'be82b959-52d3-4512-8384-f65bf23ac760', 
    'Remoção de Entulho e Guincho Roberto', 
    '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
    'Centro', 
    'Rua da Glória, 160', 
    '1148282913', 
    '1148282913', 
    'remocao-de-entulho-e-guincho-roberto-be82b9@gmail.com', 
    'manual_google', 
    true, 
    'remocao-de-entulho-e-guincho-roberto-ribeirao-pires-be82b9', 
    'guincho', 
    NULL, 
    'ribeirao-pires', 
    'SP'
  ),
  (
    '5855a2e9-0903-43e8-942d-1c424888ce8a', 
    'Marco Guincho 24 Horas', 
    '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
    'Barro Branco', 
    'Av. Pedro Ripoli, 920', 
    '11998447203', 
    '11998447203', 
    'marco-guincho-24-horas-5855a2@gmail.com', 
    'manual_google', 
    true, 
    'marco-guincho-24-horas-ribeirao-pires-5855a2', 
    'guincho', 
    NULL, 
    'ribeirao-pires', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;

-- Seed para Guincho 24h reais em Rio Grande da Serra, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = 'ea516919-22d1-4508-8641-8eb9be709dd8';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '408dfc29-8879-45df-b3b2-0dc831a49215', 
    'Dbalas Guinchos', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
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
  (
    'fb215005-4fdc-4775-b918-df730f1890c3', 
    'Veio do Guincho / Flash Rápido', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
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
  (
    'db27f57f-65dc-432e-b89f-f00bd7a80d9b', 
    'Guincho São Paulo', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
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
ON CONFLICT (id) DO NOTHING;

