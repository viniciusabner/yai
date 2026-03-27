-- 18. Insert Construction and Repairs Providers (Santo André)

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
  -- Pedreiros / Reformas
  (gen_random_uuid(), 'A Hora da Reforma', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11957919510', '11957919510', 'contato@horadareforma.com.br', 'manual_google', true, 'a-hora-da-reforma-santo-andre', 'pedreiro', 'https://www.horadareforma.com.br', null),
  (gen_random_uuid(), 'RPMendes Empreiteira', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Centro Santo André', '11914793603', '11914793603', 'orcamento@rpmendesempreiteira.com.br', 'manual_google', true, 'rpmendes-empreiteira-santo-andre', 'pedreiro', 'https://www.rpmendesempreiteira.com.br', null),
  (gen_random_uuid(), 'ETC Reformas ABC', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Eldizia', 'R. Aníbal Freire, 25', '11997728438', '11997728438', null, 'manual_google', true, 'etc-reformas-abc-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'EASY TEC', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Aclimação', 'Rua Henrique Dias', null, null, null, 'manual_google', true, 'easy-tec-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'Luz Castelli Construtora', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11989293082', '11989293082', null, 'manual_google', true, 'luz-castelli-construtora-santo-andre', 'pedreiro', 'https://www.luzcastelliconstrutora.com.br', null),
  (gen_random_uuid(), 'Nápoles Empreiteira', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Pires', 'Vila Pires, Santo André - SP', '11976505941', '1149731832', null, 'manual_google', true, 'napoles-empreiteira-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'JB Serviços Empreiteiros', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11989377221', '11981621379', null, 'manual_google', true, 'jb-servicos-empreiteiros-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'Antônio Empreiteiro', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Palmares', 'R. Pedro Setti, 141', '11985340882', '1144215751', null, 'manual_google', true, 'antonio-empreiteiro-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'Draga Construção', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', null, '1134393444', null, 'manual_google', true, 'draga-construcao-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'JR Reformas e Construções', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', null, '1149903359', null, 'manual_google', true, 'jr-reformas-e-construcoes-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'Dr Construção e Reformas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Linda', 'Rua Maria Cândida, 120', '11999974097', '11999974097', null, 'manual_google', true, 'dr-construcao-e-reformas-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'Arc Engenharia Construções', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Rua Venezuela, 66', null, '1149906555', null, 'manual_google', true, 'arc-engenharia-construcoes-santo-andre', 'pedreiro', null, null),
  (gen_random_uuid(), 'AL Construtora', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', null, '1144321305', null, 'manual_google', true, 'al-construtora-santo-andre', 'pedreiro', 'https://www.alconstrutora.com.br', null),

  -- Marido de Aluguel
  (gen_random_uuid(), 'Guima Service', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11916780108', '11916780108', null, 'manual_google', true, 'guima-service-santo-andre', 'marido_aluguel', 'https://www.dfgmaridodealuguel.com.br', null),
  (gen_random_uuid(), 'Central de Atendimento Reparos', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santo André', 'Santo André/SP', '11948931000', '1141144004', null, 'manual_google', true, 'central-de-atendimento-reparos-santo-andre', 'marido_aluguel', 'https://www.maridodealuguel.adm.br', null)
ON CONFLICT (slug) DO NOTHING;
