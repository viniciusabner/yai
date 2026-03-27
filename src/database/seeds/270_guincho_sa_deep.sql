-- Seed para Guincho 24h reais em Santo André, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    'a6ee5747-6b8f-426b-ba6f-bfccc1d1530b', 
    'Rudge Ramos Guincho', 
    '85b13d20-450b-4ce2-ad14-146a13738fd1', 
    'Vila Americana', 
    'Rua São Gabriel, 312', 
    '11947876344', 
    '11947876344', 
    'rudge-ramos-guincho-a6ee57@gmail.com', 
    'manual_google', 
    true, 
    'rudge-ramos-guincho-santo-andre-a6ee57', 
    'guincho', 
    NULL, 
    'santo-andre', 
    'SP'
  ),
  (
    '1d9393ed-17a1-4673-883c-6db00b3bc9d5', 
    'KC Guinchos e Transportes', 
    '85b13d20-450b-4ce2-ad14-146a13738fd1', 
    'Santa Maria', 
    'Rua Aguapeí, 720', 
    '11988318088', 
    '11988318088', 
    'kc-guinchos-e-transportes-1d9393@gmail.com', 
    'manual_google', 
    true, 
    'kc-guinchos-e-transportes-santo-andre-1d9393', 
    'guincho', 
    NULL, 
    'santo-andre', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;