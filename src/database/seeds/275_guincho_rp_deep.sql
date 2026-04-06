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
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;