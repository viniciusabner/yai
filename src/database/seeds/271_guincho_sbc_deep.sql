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