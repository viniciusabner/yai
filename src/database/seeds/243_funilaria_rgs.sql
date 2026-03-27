-- Seed para Funilaria e Pintura reais em Rio Grande da Serra, SP
DELETE FROM public.providers WHERE category = 'funilaria' AND city_id = 'ea516919-22d1-4508-8641-8eb9be709dd8';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '8ff2df1e-1b0a-4389-a136-df911dedbfdb', 
    'Funilaria e Pintura Peteleco', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Jardim Lavínia', 
    'Rua Prefeito Francisco Arnoni, 4', 
    '1148201655', 
    '1148201655', 
    'funilaria-e-pintura-peteleco-8ff2df@gmail.com', 
    'manual_google', 
    true, 
    'funilaria-e-pintura-peteleco-rio-grande-da-serra-8ff2df', 
    'funilaria', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;