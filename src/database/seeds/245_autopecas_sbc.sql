-- Seed para Autopeças reais em São Bernardo do Campo, SP
DELETE FROM public.providers WHERE category = 'autopecas' AND city_id = '63f5d4df-256d-4732-8e51-feffc5ef7a5f';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
        '80e776fc-c227-4be8-b597-d1a3bdbe7320', 
        'Autopeças Dg', 
        '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
        'Dos Casa', 
        'Avenida Humberto Alencar Castelo Branco, 4307', 
        '1143516509', 
        '1143516509', 
        'autopecas-dg-80e776@gmail.com', 
        'manual_google', 
        true, 
        'autopecas-dg-sao-bernardo-do-campo-80e776', 
        'autopecas', 
        NULL, 
        'sao-bernardo-do-campo', 
        'SP'
      ),
  (
        '33a22ca4-53c7-41d5-82c2-22281d948074', 
        'EVERAUTO Peças Elétricas', 
        '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
        'Centro', 
        'São Bernardo do Campo', 
        '1147040920', 
        '1147040920', 
        'everauto-pecas-eletricas-33a22c@gmail.com', 
        'manual_google', 
        true, 
        'everauto-pecas-eletricas-sao-bernardo-do-campo-33a22c', 
        'autopecas', 
        NULL, 
        'sao-bernardo-do-campo', 
        'SP'
      ),
  (
        'a748e056-6381-43bd-8568-6be8902d6393', 
        'Rufato Distribuidora Peças', 
        '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
        'Centro', 
        'São Bernardo do Campo', 
        '1120247800', 
        '1120247800', 
        'rufato-distribuidora-pecas-a748e0@gmail.com', 
        'manual_google', 
        true, 
        'rufato-distribuidora-pecas-sao-bernardo-do-campo-a748e0', 
        'autopecas', 
        NULL, 
        'sao-bernardo-do-campo', 
        'SP'
      )
ON CONFLICT (id) DO NOTHING;