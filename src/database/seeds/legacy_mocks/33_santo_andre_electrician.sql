-- 33. Insert Electricians (Eletricista) Providers (Santo André)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  (gen_random_uuid(), 'Eletricista 24hs Santo André', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11948931000', '551141144004', 'contato@eletricista24hs.srv.br', 'manual_google', true, 'eletricista-24hs-santo-andre', 'eletricista', 'https://www.eletricista24hs.srv.br', null),
  (gen_random_uuid(), 'JM Elétrica', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11980646740', '11980646740', 'contato@jmeletrica.com.br', 'manual_google', true, 'jm-eletrica-santo-andre', 'eletricista', 'https://www.jmeletrica.com.br', null),
  (gen_random_uuid(), 'Conserta Express', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11948931000', '11948931000', 'contato@consertaexpress.com.br', 'manual_google', true, 'conserta-express-santo-andre', 'eletricista', 'https://www.consertaexpress.com.br', null),
  (gen_random_uuid(), 'Eletricista Bonelli', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11987700860', '11987700860', 'contato@eletricistabonelli.com.br', 'manual_google', true, 'eletricista-bonelli-santo-andre', 'eletricista', 'https://www.eletricistabonelli.com.br', null),
  (gen_random_uuid(), 'M-Tec Elétrica', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '08005900040', '08005900040', 'contato@eletricista24h.tec.br', 'manual_google', true, 'm-tec-eletrica-santo-andre', 'eletricista', 'https://www.eletricista24h.tec.br', null),
  (gen_random_uuid(), 'Fag Elétrica', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', null, null, 'contato@fageletrica.com.br', 'manual_google', true, 'fag-eletrica-santo-andre', 'eletricista', 'https://www.fageletrica.com.br', null),
  (gen_random_uuid(), 'Eletricista 24h JA', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11982232449', '11982232449', 'contato@eletricista24hsja.com.br', 'manual_google', true, 'eletricista-24h-ja-santo-andre', 'eletricista', 'https://www.eletricista24hsja.com.br', null)
ON CONFLICT (slug) DO NOTHING;
