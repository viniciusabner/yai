-- Seeds para a categoria Cursos Profissionalizantes no ABC Paulista

INSERT INTO public.providers (
    id,
    name,
    category,
    city_id,
    neighborhood,
    address,
    whatsapp,
    phone,
    source,
    active,
    slug
) VALUES 
-- Santo André
(gen_random_uuid(), 'Salute Centro Educacional', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1144559750', '1144557005', 'manual_google', true, 'salute-centro-educacional-santo-andre'),
(gen_random_uuid(), 'Grau Técnico Santo André', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11950290057', '1144271170', 'manual_google', true, 'grau-tecnico-santo-andre'),
(gen_random_uuid(), 'Instituto Polígono Santo André', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '1141229900', 'manual_google', true, 'instituto-poligono-santo-andre'),
(gen_random_uuid(), 'Senac Santo André', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Avenida Ramiro Colleoni, 110', '1133220050', '1133220050', 'manual_google', true, 'senac-santo-andre'),
(gen_random_uuid(), 'SENAI A. Jacob Lafer', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Ipiranguinha', 'Av. Santos Dumont, 300', '1133220050', '1149727300', 'manual_google', true, 'senai-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Grau Técnico SBC', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Marechal Deodoro, 1928', '11997660057', '1125647579', 'manual_google', true, 'grau-tecnico-sbc'),
(gen_random_uuid(), 'Etec Lauro Gomes', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Baeta Neves', 'Av. Pereira Barreto, 400', '11999999999', '1141252288', 'manual_google', true, 'etec-lauro-gomes-sbc'),
(gen_random_uuid(), 'SENAI Almirante Tamandaré', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Av. Pereira Barreto, 456', '1133220050', '1143316050', 'manual_google', true, 'senai-almirante-tamandare-sbc'),
(gen_random_uuid(), 'Escola Técnica Sequencial', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11961664021', '1133712828', 'manual_google', true, 'escola-sequencial-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'ETEC Jorge Street', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Jardim São Caetano', 'Rua Bell Alliance, 149', '11999999999', '1142387955', 'manual_google', true, 'etec-jorge-street-scs'),
(gen_random_uuid(), 'SENAI São Caetano do Sul', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Niterói, 180', '1133220050', '1142252000', 'manual_google', true, 'senai-scs'),
(gen_random_uuid(), 'Instituto Mauá de Tecnologia', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '1108000193100', 'manual_google', true, 'instituto-maua-scs'),
(gen_random_uuid(), 'Escola Alcina (EPT)', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'escola-alcina-scs'),

-- Diadema
(gen_random_uuid(), 'Fundação Florestan Fernandes', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '1140532600', '1140532600', 'manual_google', true, 'florestan-fernandes-diadema'),
(gen_random_uuid(), 'SENAI Manuel Garcia Filho', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11918573823', '1140708950', 'manual_google', true, 'senai-diadema'),
(gen_random_uuid(), 'Grau Técnico Diadema', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'grau-tecnico-diadema'),
(gen_random_uuid(), 'Etec Juscelino Kubitschek', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '1140539400', 'manual_google', true, 'etec-jk-diadema'),
(gen_random_uuid(), 'SODIPROM Formação', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11918478156', '1140541727', 'manual_google', true, 'sodiprom-diadema'),

-- Mauá
(gen_random_uuid(), 'SENAI Mauá', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1133220050', '1133220050', 'manual_google', true, 'senai-maua'),
(gen_random_uuid(), 'Qualifica Mauá', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11920023429', '11920023429', 'manual_google', true, 'qualifica-maua'),
(gen_random_uuid(), 'Cebrac Mauá', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11995386953', '1143092021', 'manual_google', true, 'cebrac-maua'),
(gen_random_uuid(), 'Etec de Mauá', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '1145193901', 'manual_google', true, 'etec-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Etec Profª Maria Cristina Medeiros', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '1148254470', 'manual_google', true, 'etec-ribeirao-pires'),
(gen_random_uuid(), 'Procapacitar Ribeirão Pires', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '4936223071', 'manual_google', true, 'procapacitar-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Etec Rio Grande da Serra', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '1148268325', 'manual_google', true, 'etec-rgs')


ON CONFLICT (slug) DO NOTHING;
