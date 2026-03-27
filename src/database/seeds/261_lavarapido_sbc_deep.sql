-- Seed para Lava Rapido reais em São Bernardo do Campo, SP (Deep Search)
DELETE FROM public.providers WHERE category IN ('lava-rapido', 'estetica-automotiva') AND city_id = '63f5d4df-256d-4732-8e51-feffc5ef7a5f';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '21d4ee6d-b12c-4386-8268-9c6c3a1e528b', 
    'Lava Rápido Versátil', 
    '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
    'Jardim Yraja', 
    'Rua José D Angelo, 563', 
    '1141014047', 
    '1141014047', 
    'lava-rapido-versatil-21d4ee@gmail.com', 
    'manual_google', 
    true, 
    'lava-rapido-versatil-sao-bernardo-do-campo-21d4ee', 
    'estetica-automotiva', 
    NULL, 
    'sao-bernardo-do-campo', 
    'SP'
  ),
  (
    'e1ac46af-0772-4f08-a66d-e8817103a29b', 
    'BM Exclusive Car Lava Rápido', 
    '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
    'Vila Alvaro Marques', 
    'R. Bela Vista, 748', 
    '11930245252', 
    '11930245252', 
    'bm-exclusive-car-lava-rapido-e1ac46@gmail.com', 
    'manual_google', 
    true, 
    'bm-exclusive-car-lava-rapido-sao-bernardo-do-campo-e1ac46', 
    'estetica-automotiva', 
    NULL, 
    'sao-bernardo-do-campo', 
    'SP'
  ),
  (
    'df52c022-b39e-444b-953c-84b7058c552e', 
    'Zenit Car Detail', 
    '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
    'Centro', 
    'Rua Borda de Campo, 23', 
    '11985754205', 
    '11985754205', 
    'zenit-car-detail-df52c0@gmail.com', 
    'manual_google', 
    true, 
    'zenit-car-detail-sao-bernardo-do-campo-df52c0', 
    'estetica-automotiva', 
    NULL, 
    'sao-bernardo-do-campo', 
    'SP'
  ),
  (
    'e3ee5ac3-14dc-48f4-ad40-e64e73de67d5', 
    'Japa Car Lava Rápido', 
    '63f5d4df-256d-4732-8e51-feffc5ef7a5f', 
    'Baeta Neves', 
    'Rua Thales dos Santos Freire', 
    '1144267061', 
    '1144267061', 
    'japa-car-lava-rapido-e3ee5a@gmail.com', 
    'manual_google', 
    true, 
    'japa-car-lava-rapido-sao-bernardo-do-campo-e3ee5a', 
    'estetica-automotiva', 
    NULL, 
    'sao-bernardo-do-campo', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;