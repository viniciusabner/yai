-- Seed para Autopeças reais em Ribeirão Pires, SP
DELETE FROM public.providers WHERE category = 'autopecas' AND city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
        'ebdf52a6-11f1-42e9-95d1-d7bd31d2f7ca', 
        'Tesauto Autopeças', 
        '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
        'Santa Luzia', 
        'Avenida Francisco Monteiro, 2259', 
        '1148277077', 
        '1148277077', 
        'tesauto-autopecas-ebdf52@gmail.com', 
        'manual_google', 
        true, 
        'tesauto-autopecas-ribeirao-pires-ebdf52', 
        'autopecas', 
        NULL, 
        'ribeirao-pires', 
        'SP'
      ),
  (
        '99ee25df-aca4-427c-a589-8ee362704941', 
        'Peças Domingão', 
        '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
        'Santa Luzia', 
        'Av. Francisco Monteiro, 2540', 
        '1148284787', 
        '1148284787', 
        'pecas-domingao-99ee25@gmail.com', 
        'manual_google', 
        true, 
        'pecas-domingao-ribeirao-pires-99ee25', 
        'autopecas', 
        NULL, 
        'ribeirao-pires', 
        'SP'
      ),
  (
        'ddaed275-b2d5-47dd-9980-d3ef7c04c4ca', 
        'Autopeças Brasil', 
        '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
        'Vila Gomes', 
        'Avenida Princesa Izabel, 1438', 
        '1148276759', 
        '1148276759', 
        'autopecas-brasil-ddaed2@gmail.com', 
        'manual_google', 
        true, 
        'autopecas-brasil-ribeirao-pires-ddaed2', 
        'autopecas', 
        NULL, 
        'ribeirao-pires', 
        'SP'
      ),
  (
        'f18fd956-e47f-487c-99d2-99c840b32732', 
        'Baterias Automotivas ARS', 
        '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
        'Santa Luzia', 
        'Rua São Vítor, 144', 
        '11975807440', 
        '11975807440', 
        'baterias-automotivas-ars-f18fd9@gmail.com', 
        'manual_google', 
        true, 
        'baterias-automotivas-ars-ribeirao-pires-f18fd9', 
        'autopecas', 
        NULL, 
        'ribeirao-pires', 
        'SP'
      )
ON CONFLICT (id) DO NOTHING;