-- Seed para Autopeças reais em Rio Grande da Serra, SP
DELETE FROM public.providers WHERE category = 'autopecas' AND city_id = 'ea516919-22d1-4508-8641-8eb9be709dd8';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
        'ec795477-ca91-454f-b320-13855fd50dda', 
        'Auto Peças Esperança da Serra', 
        'ea516919-22d1-4508-8641-8eb9be709dd8', 
        'Centro', 
        'Rua José Maria Figueiredo, 8', 
        '1148215068', 
        '1148215068', 
        'auto-pecas-esperanca-da-serra-ec7954@gmail.com', 
        'manual_google', 
        true, 
        'auto-pecas-esperanca-da-serra-rio-grande-da-serra-ec7954', 
        'autopecas', 
        NULL, 
        'rio-grande-da-serra', 
        'SP'
      ),
  (
        '1f383c2e-8b47-49ae-a8de-8a4c739f9b8d', 
        'Autopeças Rio Grande Serra', 
        'ea516919-22d1-4508-8641-8eb9be709dd8', 
        'Vila Lavínia', 
        'Rua Ana L Figueiredo, 25', 
        '1148211451', 
        '1148211451', 
        'autopecas-rio-grande-serra-1f383c@gmail.com', 
        'manual_google', 
        true, 
        'autopecas-rio-grande-serra-rio-grande-da-serra-1f383c', 
        'autopecas', 
        NULL, 
        'rio-grande-da-serra', 
        'SP'
      ),
  (
        'e31d7f43-2bcc-4c69-ba25-12610e94f545', 
        'Benevides Peças e Serviços', 
        'ea516919-22d1-4508-8641-8eb9be709dd8', 
        'Jardim Santa Tereza', 
        'Avenida São João, 95', 
        '1148211280', 
        '1148211280', 
        'benevides-pecas-e-servicos-e31d7f@gmail.com', 
        'manual_google', 
        true, 
        'benevides-pecas-e-servicos-rio-grande-da-serra-e31d7f', 
        'autopecas', 
        NULL, 
        'rio-grande-da-serra', 
        'SP'
      )
ON CONFLICT (id) DO NOTHING;