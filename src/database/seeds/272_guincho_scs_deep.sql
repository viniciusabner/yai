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