-- Seed para Autopeças reais em Rio Grande da Serra, SP (Deep Search)
DELETE FROM public.providers WHERE category IN ('autopecas', 'auto-pecas') AND city_id = 'ea516919-22d1-4508-8641-8eb9be709dd8';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '65b76724-b294-4f49-9dd3-c1891ca826d4', 
    'Auto Peças Esperança da Serra', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Centro', 
    'Rua José Maria Figueiredo, 8', 
    '1148215068', 
    '1148215068', 
    'auto-pecas-esperanca-da-serra-65b767@gmail.com', 
    'manual_google', 
    true, 
    'auto-pecas-esperanca-da-serra-rio-grande-da-serra-65b767', 
    'auto-pecas', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (
    '99b60fbf-b394-47e4-84c3-068d377965a8', 
    'Autopeças Rio Grande Serra', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Vila Lavínia', 
    'Rua Ana L Figueiredo, 25', 
    '1148211451', 
    '1148211451', 
    'autopecas-rio-grande-serra-99b60f@gmail.com', 
    'manual_google', 
    true, 
    'autopecas-rio-grande-serra-rio-grande-da-serra-99b60f', 
    'auto-pecas', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (
    '1d991e77-b44d-4e65-b185-2548df9c42d6', 
    'Benevides Peças e Serviços', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Jardim Santa Tereza', 
    'Avenida São João, 95', 
    '1148211280', 
    '1148211280', 
    'benevides-pecas-e-servicos-1d991e@gmail.com', 
    'manual_google', 
    true, 
    'benevides-pecas-e-servicos-rio-grande-da-serra-1d991e', 
    'auto-pecas', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;