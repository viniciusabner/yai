-- Seed para Autopeças reais em Santo André, SP
DELETE FROM public.providers WHERE category = 'autopecas' AND city_id = '85b13d20-450b-4ce2-ad14-146a13738fd1';

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES 
  (
        '92e114d0-010c-46ac-9165-94c4318e4be8', 
        'Fator Distribuidora de Auto Peças', 
        '85b13d20-450b-4ce2-ad14-146a13738fd1', 
        'Campestre', 
        'Rua dos Coqueiros, 1795', 
        '1154614442', 
        '1154614442', 
        'fator-distribuidora-de-auto-pecas-92e114@gmail.com', 
        'manual_google', 
        true, 
        'fator-distribuidora-de-auto-pecas-santo-andre-92e114', 
        'autopecas', 
        NULL, 
        'santo-andre', 
        'SP'
      ),
  (
        '96650ea9-3184-4468-8719-baff827bd13a', 
        'Utipeças Peças e Acessórios', 
        '85b13d20-450b-4ce2-ad14-146a13738fd1', 
        'Utinga', 
        'Avenida Utinga, 220', 
        '1149971074', 
        '1149971074', 
        'utipecas-pecas-e-acessorios-96650e@gmail.com', 
        'manual_google', 
        true, 
        'utipecas-pecas-e-acessorios-santo-andre-96650e', 
        'autopecas', 
        NULL, 
        'santo-andre', 
        'SP'
      ),
  (
        '15cd676e-f58f-4046-bf8c-27428da0cb95', 
        'MercadoCar Santo André', 
        '85b13d20-450b-4ce2-ad14-146a13738fd1', 
        'Centro', 
        'Av. Ramiro Colleoni, 595', 
        '1149969900', 
        '1149969900', 
        'mercadocar-santo-andre-15cd67@gmail.com', 
        'manual_google', 
        true, 
        'mercadocar-santo-andre-santo-andre-15cd67', 
        'autopecas', 
        NULL, 
        'santo-andre', 
        'SP'
      ),
  (
        '485c0cbb-1864-4032-985e-ac76fa9f3340', 
        'AP Auto Peças', 
        '85b13d20-450b-4ce2-ad14-146a13738fd1', 
        'Centro', 
        'Santo André', 
        '11988466055', 
        '11988466055', 
        'ap-auto-pecas-485c0c@gmail.com', 
        'manual_google', 
        true, 
        'ap-auto-pecas-santo-andre-485c0c', 
        'autopecas', 
        NULL, 
        'santo-andre', 
        'SP'
      )
ON CONFLICT (id) DO NOTHING;