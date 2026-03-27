-- Seed para Funilaria e Pintura reais em São Caetano do Sul, SP
DELETE FROM public.providers WHERE category = 'funilaria' AND city_id = 'd422ecad-80b4-450a-b364-ebb888d700e1';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    'ddfb1e22-d96c-4105-991c-11898cb90fd4', 
    'Oficina Funilaria e Pintura AEV', 
    'd422ecad-80b4-450a-b364-ebb888d700e1', 
    'Santa Maria', 
    'Rua Silvia, 986', 
    '1142394026', 
    '1142394026', 
    'oficina-funilaria-e-pintura-aev-ddfb1e@gmail.com', 
    'manual_google', 
    true, 
    'oficina-funilaria-e-pintura-aev-sao-caetano-do-sul-ddfb1e', 
    'funilaria', 
    NULL, 
    'sao-caetano-do-sul', 
    'SP'
  ),
  (
    '62e2d8b8-3a33-44f8-9c9f-d74d4573f777', 
    'Pokbom – Reparação e Estética Automotiva', 
    'd422ecad-80b4-450a-b364-ebb888d700e1', 
    'Santa Paula', 
    'Alameda São Caetano, 677', 
    '1142217820', 
    '1142217820', 
    'pokbom-reparacao-e-estetica-automotiva-62e2d8@gmail.com', 
    'manual_google', 
    true, 
    'pokbom-reparacao-e-estetica-automotiva-sao-caetano-do-sul-62e2d8', 
    'funilaria', 
    NULL, 
    'sao-caetano-do-sul', 
    'SP'
  ),
  (
    '3b1ad0e0-16aa-4161-a3a1-ef8dd23055cb', 
    'Pint Car', 
    'd422ecad-80b4-450a-b364-ebb888d700e1', 
    'Santa Maria', 
    'Alameda São Caetano, 2845', 
    '1142201701', 
    '1142201701', 
    'pint-car-3b1ad0@gmail.com', 
    'manual_google', 
    true, 
    'pint-car-sao-caetano-do-sul-3b1ad0', 
    'funilaria', 
    NULL, 
    'sao-caetano-do-sul', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;