-- Seed para Lava Rapido reais em Rio Grande da Serra, SP (Deep Search)
DELETE FROM public.providers WHERE category IN ('lava-rapido', 'estetica-automotiva') AND city_id = 'ea516919-22d1-4508-8641-8eb9be709dd8';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    'ad1ad9e2-9249-48dd-8b4c-31f2ce48c583', 
    'Alemao Borracharia Lava Rápido', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Parque América', 
    'Rua 16, Casa 06', 
    '1142254344', 
    '1142254344', 
    'alemao-borracharia-lava-rapido-ad1ad9@gmail.com', 
    'manual_google', 
    true, 
    'alemao-borracharia-lava-rapido-rio-grande-da-serra-ad1ad9', 
    'estetica-automotiva', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;