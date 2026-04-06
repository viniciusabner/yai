-- Seed para Lava Rapido reais em Ribeirão Pires, SP (Deep Search)
DELETE FROM public.providers WHERE category IN ('lava-rapido', 'lava_rapido') AND city_id = '1f84b6c7-69e8-49c6-a691-30da5246e0ea';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    gen_random_uuid(), 
    'Jamantão Lava Rápido', 
    '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
    'Pastoril', 
    'Avenida Kaethe Richers, 682', 
    '1148286800', 
    '1148286800', 
    'jamantao-lava-rapido-2b4699@gmail.com', 
    'manual_google', 
    true, 
    'jamantao-lava-rapido-ribeirao-pires-2b4699', 
    'lava_rapido', 
    NULL, 
    'ribeirao-pires', 
    'SP'
  ),
  (
    gen_random_uuid(), 
    'Kaue Detailer Estética Automotiva', 
    '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 
    'Centro', 
    'R. Leopoldina, 194', 
    '11997710956', 
    '11997710956', 
    'kaue-detailer-lava_rapido-fad8c7@gmail.com', 
    'manual_google', 
    true, 
    'kaue-detailer-estetica-automotiva-ribeirao-pires-fad8c7', 
    'lava_rapido', 
    NULL, 
    'ribeirao-pires', 
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;