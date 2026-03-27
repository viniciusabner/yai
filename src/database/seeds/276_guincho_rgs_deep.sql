-- Seed para Guincho 24h reais em Rio Grande da Serra, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = 'ea516919-22d1-4508-8641-8eb9be709dd8';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '408dfc29-8879-45df-b3b2-0dc831a49215', 
    'Dbalas Guinchos', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11947254055', 
    '11947254055', 
    'dbalas-guinchos-408dfc@gmail.com', 
    'manual_google', 
    true, 
    'dbalas-guinchos-rio-grande-da-serra-408dfc', 
    'guincho', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (
    'fb215005-4fdc-4775-b918-df730f1890c3', 
    'Veio do Guincho / Flash Rápido', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11971940739', 
    '11971940739', 
    'veio-do-guincho-flash-rapido-fb2150@gmail.com', 
    'manual_google', 
    true, 
    'veio-do-guincho-flash-rapido-rio-grande-da-serra-fb2150', 
    'guincho', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  ),
  (
    'db27f57f-65dc-432e-b89f-f00bd7a80d9b', 
    'Guincho São Paulo', 
    'ea516919-22d1-4508-8641-8eb9be709dd8', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11943398025', 
    '11943398025', 
    'guincho-sao-paulo-db27f5@gmail.com', 
    'manual_google', 
    true, 
    'guincho-sao-paulo-rio-grande-da-serra-db27f5', 
    'guincho', 
    NULL, 
    'rio-grande-da-serra', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;