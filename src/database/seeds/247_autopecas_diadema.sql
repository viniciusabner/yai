-- Seed para Autopeças reais em Diadema, SP
DELETE FROM public.providers WHERE category = 'autopecas' AND city_id = '205e475f-44aa-418f-8835-434cd5e913d2';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
        '160e6201-587b-4669-9a7e-051a054c17fd', 
        'Gerha Peças P/ Autos', 
        '205e475f-44aa-418f-8835-434cd5e913d2', 
        'Piraporinha', 
        'Avenida Piraporinha, 1571', 
        '1140667393', 
        '1140667393', 
        'gerha-pecas-p-autos-160e62@gmail.com', 
        'manual_google', 
        true, 
        'gerha-pecas-p-autos-diadema-160e62', 
        'autopecas', 
        NULL, 
        'diadema', 
        'SP'
      ),
  (
        'd4cee594-2936-41ad-b626-150a3646ab74', 
        'Gol Autopeças', 
        '205e475f-44aa-418f-8835-434cd5e913d2', 
        'Vila Nogueira', 
        'Avenida Dona Ruyce Ferraz Alvim, 333', 
        '1140706700', 
        '1140706700', 
        'gol-autopecas-d4cee5@gmail.com', 
        'manual_google', 
        true, 
        'gol-autopecas-diadema-d4cee5', 
        'autopecas', 
        NULL, 
        'diadema', 
        'SP'
      ),
  (
        '0c10a2e6-0a3f-4c06-be68-92a727107e82', 
        'Auto Eletropeças JS', 
        '205e475f-44aa-418f-8835-434cd5e913d2', 
        'Taboão', 
        'Rua Das Ameixeiras, 979', 
        '1140753548', 
        '1140753548', 
        'auto-eletropecas-js-0c10a2@gmail.com', 
        'manual_google', 
        true, 
        'auto-eletropecas-js-diadema-0c10a2', 
        'autopecas', 
        NULL, 
        'diadema', 
        'SP'
      ),
  (
        '38d2789d-cfd7-473d-9d0c-65aca674cfc4', 
        'Auto Peças D João VI', 
        '205e475f-44aa-418f-8835-434cd5e913d2', 
        'Canhema', 
        'Avenida Dom João VI, 267', 
        '1140714640', 
        '1140714640', 
        'auto-pecas-d-joao-vi-38d278@gmail.com', 
        'manual_google', 
        true, 
        'auto-pecas-d-joao-vi-diadema-38d278', 
        'autopecas', 
        NULL, 
        'diadema', 
        'SP'
      )
ON CONFLICT (id) DO NOTHING;