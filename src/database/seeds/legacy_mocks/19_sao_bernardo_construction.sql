-- 19. Insert Construction and Repairs Providers (São Bernardo do Campo)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Pedreiros / Reformas
  (gen_random_uuid(), 'RPMendes Empreiteira', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'São Bernardo do Campo/SP', '11914793603', '11914793603', null, 'manual_google', true, 'rpmendes-empreiteira-sbc', 'pedreiro', 'https://www.rpmendesempreiteira.com.br', null),
  (gen_random_uuid(), 'Reformas Inove', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', '11950019517', '11950019517', null, 'manual_google', true, 'reformas-inove-sbc', 'pedreiro', 'https://www.reformasinove.com.br', null),
  (gen_random_uuid(), 'GOC Construtora', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, '1141125560', null, 'manual_google', true, 'goc-construtora-sbc', 'pedreiro', 'https://www.gocconstrutora.com.br', null),
  (gen_random_uuid(), 'Vital Serviços', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, '1143480601', null, 'manual_google', true, 'vital-servicos-sbc', 'pintor', 'https://www.vitalservicos.com', null),
  (gen_random_uuid(), 'AGPOX Reformas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, null, null, 'manual_google', true, 'agpox-reformas-sbc', 'pedreiro', 'https://www.reformasresidenciais.com.br', null),
  (gen_random_uuid(), 'AKM Construtora', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, null, null, 'manual_google', true, 'akm-construtora-sbc', 'pedreiro', null, null),
  (gen_random_uuid(), 'TMR Engenharia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, null, null, 'manual_google', true, 'tmr-engenharia-sbc', 'pedreiro', 'https://www.tmrengenhariaeconstrucao.com.br', null),

  -- Marido de Aluguel
  (gen_random_uuid(), 'Guima Service', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', '11916780108', '11916780108', null, 'manual_google', true, 'guima-service-sbc', 'marido_aluguel', 'https://www.dfgmaridodealuguel.com.br', null),
  (gen_random_uuid(), 'Marido de Aluguel ABC', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', '11947446375', '1142353811', null, 'manual_google', true, 'marido-de-aluguel-abc-sbc', 'marido_aluguel', 'https://www.maridoaluguelabc.com.br', null),
  (gen_random_uuid(), 'Marido de Aluguel Hidrotex', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, '1141144004', null, 'manual_google', true, 'marido-de-aluguel-hidrotex-sbc', 'marido_aluguel', 'https://www.maridodealuguel.adm.br', null),
  (gen_random_uuid(), 'Doutor Resolve', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, null, null, 'manual_google', true, 'doutor-resolve-sbc', 'marido_aluguel', 'https://www.doutorresolve.com.br', null),
  (gen_random_uuid(), 'Master House Soluções', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, null, null, 'manual_google', true, 'master-house-sbc', 'marido_aluguel', 'https://www.masterhousesolucoes.com.br', null),
  (gen_random_uuid(), 'Homefix', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, null, null, 'manual_google', true, 'homefix-sbc', 'marido_aluguel', 'https://www.homefix.srv.br', null)
ON CONFLICT (slug) DO NOTHING;
