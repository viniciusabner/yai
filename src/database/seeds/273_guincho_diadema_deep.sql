-- Seed para Guincho 24h reais em Diadema, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '205e475f-44aa-418f-8835-434cd5e913d2';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '0949b315-43be-4951-baa9-fe329547a94b', 
    'Amauri Serviço de reboque', 
    '205e475f-44aa-418f-8835-434cd5e913d2', 
    'Parque Sete de Setembro', 
    'Avenida Alda, 1345', 
    '11940245056', 
    '11940245056', 
    'amauri-servico-de-reboque-0949b3@gmail.com', 
    'manual_google', 
    true, 
    'amauri-servico-de-reboque-diadema-0949b3', 
    'guincho', 
    NULL, 
    'diadema', 
    'SP'
  ),
  (
    '8998f982-733e-4b2e-a46e-13dc11e20b1f', 
    'Auto Socorro Ferrari', 
    '205e475f-44aa-418f-8835-434cd5e913d2', 
    'Centro', 
    'Rua Salgado de Castro, 230', 
    '1140573873', 
    '1140573873', 
    'auto-socorro-ferrari-8998f9@gmail.com', 
    'manual_google', 
    true, 
    'auto-socorro-ferrari-diadema-8998f9', 
    'guincho', 
    NULL, 
    'diadema', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;