-- Seed para Guincho 24h reais em Mauá, SP (Deep Search)
DELETE FROM public.providers WHERE category = 'guincho' AND city_id = '6f15b756-1913-4ca0-81ea-5a82f11740a3';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
    '4aa8a37e-e312-4f11-b17e-da71e44c5b1a', 
    'Célio Guinchos', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11948989887', 
    '11948989887', 
    'celio-guinchos-4aa8a3@gmail.com', 
    'manual_google', 
    true, 
    'celio-guinchos-maua-4aa8a3', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  ),
  (
    '11a5dc21-98da-4c0d-993c-466bc2cbcdf9', 
    'Durique Guincho 24 Horas', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11947976523', 
    '11947976523', 
    'durique-guincho-24-horas-11a5dc@gmail.com', 
    'manual_google', 
    true, 
    'durique-guincho-24-horas-maua-11a5dc', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  ),
  (
    '85ff4806-e572-4406-b26c-9b58851273eb', 
    'Gabriel Guinchos', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '1141104959', 
    '1141104959', 
    'gabriel-guinchos-85ff48@gmail.com', 
    'manual_google', 
    true, 
    'gabriel-guinchos-maua-85ff48', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  ),
  (
    'aa5c5b49-2ac0-4cdd-80d5-0268517884f5', 
    'Rick Guinchos', 
    '6f15b756-1913-4ca0-81ea-5a82f11740a3', 
    'Região Principal', 
    'Atendimento Móvel', 
    '11995001828', 
    '11995001828', 
    'rick-guinchos-aa5c5b@gmail.com', 
    'manual_google', 
    true, 
    'rick-guinchos-maua-aa5c5b', 
    'guincho', 
    NULL, 
    'maua', 
    'SP'
  )
ON CONFLICT (id) DO NOTHING;