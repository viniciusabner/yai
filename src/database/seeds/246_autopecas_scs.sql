-- Seed para Autopeças reais em São Caetano do Sul, SP
DELETE FROM public.providers WHERE category = 'autopecas' AND city_id = 'd422ecad-80b4-450a-b364-ebb888d700e1';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
        '6c55a5ec-3408-4c59-aa7f-bf2283402610', 
        'Autopeças Birigui', 
        'd422ecad-80b4-450a-b364-ebb888d700e1', 
        'Nova Gerty', 
        'Rua Nelly Pellegrino, 639', 
        '1142382020', 
        '1142382020', 
        'autopecas-birigui-6c55a5@gmail.com', 
        'manual_google', 
        true, 
        'autopecas-birigui-sao-caetano-do-sul-6c55a5', 
        'autopecas', 
        NULL, 
        'sao-caetano-do-sul', 
        'SP'
      ),
  (
        '9ef6a1fa-3db1-4a9d-8ebc-77a4728af4f6', 
        'Fast Autopeças', 
        'd422ecad-80b4-450a-b364-ebb888d700e1', 
        'Centro', 
        'Rua Pernambuco, 316', 
        '1135938720', 
        '1135938720', 
        'fast-autopecas-9ef6a1@gmail.com', 
        'manual_google', 
        true, 
        'fast-autopecas-sao-caetano-do-sul-9ef6a1', 
        'autopecas', 
        NULL, 
        'sao-caetano-do-sul', 
        'SP'
      )
ON CONFLICT (id) DO NOTHING;