-- 25. Insert Handyman (Marido de Aluguel) Providers (ABC Region)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Santo André
  (gen_random_uuid(), 'Alexandre Velasco', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Parque Erasmo Assunção', 'R. Jorge Beretta, 963', null, null, null, 'manual_google', true, 'alexandre-velasco-santo-andre', 'marido_aluguel', 'https://www.obrasflex.com.br', null),
  
  -- São Bernardo do Campo
  (gen_random_uuid(), 'Marcelo - Marido de Aluguel', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', '11987812435', '11987812435', null, 'manual_google', true, 'marcelo-marido-de-aluguel-sbc', 'marido_aluguel', 'https://www.maridodealuguelsbcmarcelo.com', null),
  (gen_random_uuid(), 'Marido de Aluguel ABC (Reparos)', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', '11947446375', null, null, 'manual_google', true, 'marido-de-aluguel-abc-reparos-sbc', 'marido_aluguel', 'https://www.maridoaluguelabc.com.br', null),
  (gen_random_uuid(), 'C.F.S Reparos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'São Bernardo do Campo', 'São Bernardo do Campo/SP', null, null, null, 'manual_google', true, 'cfs-reparos-sbc', 'marido_aluguel', 'https://www.cfsreparosresidenciais.com.br', null),

  -- São Caetano do Sul
  (gen_random_uuid(), 'Marido de Aluguel Hidrotex', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', '11948931000', '1141144004', null, 'manual_google', true, 'marido-de-aluguel-hidrotex-scs', 'marido_aluguel', 'https://www.maridodealuguel.adm.br', null),
  (gen_random_uuid(), 'Jorge Ravelli', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'São Caetano do Sul', 'São Caetano do Sul/SP', '11995018109', '11995018109', 'jorgeravelli@terra.com.br', 'manual_google', true, 'jorge-ravelli-scs', 'marido_aluguel', null, null),

  -- Diadema
  (gen_random_uuid(), 'Marido de Aluguel ABC', (SELECT id FROM public.cities WHERE slug='diadema'), 'Diadema', 'Diadema/SP', '11947446375', '1142353811', null, 'manual_google', true, 'marido-de-aluguel-abc-diadema', 'marido_aluguel', 'https://www.maridoaluguelabc.com.br', null),

  -- Mauá
  (gen_random_uuid(), 'Marido de Aluguel BR Ribeiro', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', '11940087447', '11940087447', null, 'manual_google', true, 'marido-de-aluguel-br-ribeiro-maua', 'marido_aluguel', 'https://www.ueniweb.com', null),
  (gen_random_uuid(), 'Mix House ABC', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Mauá/SP', null, null, null, 'manual_google', true, 'mix-house-abc-maua', 'marido_aluguel', 'https://www.doctorhouseabc.com.br', null),

  -- Rio Grande da Serra
  (gen_random_uuid(), 'Marido de Aluguel SP', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Rio Grande da Serra', 'Rio Grande da Serra/SP', '11978869531', '11978869531', null, 'manual_google', true, 'marido-de-aluguel-sp-rio-grande-da-serra', 'marido_aluguel', 'https://www.socorramemaridodealuguel.com.br', null)
ON CONFLICT (slug) DO NOTHING;
