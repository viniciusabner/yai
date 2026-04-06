-- Using the EXACT city_id from your cURL so they attach to the correct city directly
-- Changing ON CONFLICT to UPDATE so it overwrites existing incorrectly-mapped agencies

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, creci)
VALUES
    (gen_random_uuid(), 'Central Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Dr. Felício Laurito, 61', null, '1148251385', null, 'manual_google', true, 'central-imoveis-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Geraldini Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Miguel Prisco, 315', null, '1148244746', null, 'manual_google', true, 'geraldini-imoveis-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Voltei Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Fortuna, 160', null, '1148282611', null, 'manual_google', true, 'voltei-imoveis-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Interpredium', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. do Comércio, 66', null, '1148232022', null, 'manual_google', true, 'interpredium-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Mário Iderilha Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Boa Vista, 193', null, '1148281454', null, 'manual_google', true, 'mario-iderilha-imoveis-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Egle Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Fortuna, 81, loja 02', null, '1148274033', null, 'manual_google', true, 'egle-imoveis-ribeirao-pires-1', 'imobiliaria', 'https://egleimoveis.com.br', null),
    (gen_random_uuid(), 'Ace Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Amazonas, 29', null, '1148251000', null, 'manual_google', true, 'ace-imoveis-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Êxito Empreendimentos Imobiliários', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Cidade Santos, 17, sala 2', null, null, null, 'manual_google', true, 'exito-empreendimentos-imobiliarios-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Imobiliária Cecília Bani', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua do Comércio, 66', '11995845646', '1148283464', 'ceciliabanimob@gmail.com', 'manual_google', true, 'imobiliaria-cecilia-bani-ribeirao-pires-1', 'imobiliaria', 'http://imobiliariaceciliabani.com.br', '48010 F'),
    (gen_random_uuid(), 'Corretor Felipe Soares', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, null, '11974226482', '11974226482', 'felipe.soares@creci.org.br', 'manual_google', true, 'corretor-felipe-soares-ribeirao-pires-1', 'imobiliaria', 'http://fsoaresimoveis.com.br', '231323-F'),
    (gen_random_uuid(), 'Corretor Marco Antonio Peduzzi', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, null, null, null, null, 'manual_google', true, 'corretor-marco-antonio-peduzzi-ribeirao-pires-1', 'imobiliaria', 'http://marcoantoniopeduzzi.com.br', '205470'),
    (gen_random_uuid(), 'Franco - Consultor Imobiliário', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, null, '11935001661', '11935001661', null, 'manual_google', true, 'franco-consultor-imobiliario-ribeirao-pires-1', 'imobiliaria', null, '67166'),
    (gen_random_uuid(), 'Deise Mascarenhas Corretora', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, null, '11992432876', '11992432876', null, 'manual_google', true, 'deise-mascarenhas-corretora-ribeirao-pires-1', 'imobiliaria', null, '68501'),
    (gen_random_uuid(), 'Efraim Consultoria Imobiliária', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Miguel Prisco, 566', '11972441922', '11972441922', null, 'manual_google', true, 'efraim-consultoria-imobiliaria-ribeirao-pires-1', 'imobiliaria', 'https://efraimimoveis.com.br', null),
    (gen_random_uuid(), 'Nova Reluz Negócios Imobiliários', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ouro Fino Paulista', 'Rodovia Índio Tibiriçá, 2008', '11972772392', '1148222405', null, 'manual_google', true, 'nova-reluz-negocios-imobiliarios-ribeirao-pires-1', 'imobiliaria', 'https://novareluznegocios.com.br', null),
    (gen_random_uuid(), 'Pérola da Serra Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Avenida Francisco Monteiro, 185', '1148233333', '1148233333', null, 'manual_google', true, 'perola-da-serra-imoveis-ribeirao-pires-1', 'imobiliaria', null, null),
    (gen_random_uuid(), 'Fortuna Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Fortuna, 101', null, '1148255800', null, 'manual_google', true, 'fortuna-imoveis-ribeirao-pires-1', 'imobiliaria', 'https://fortunaimovel.com.br', null),
    (gen_random_uuid(), 'Idealiza Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, null, null, null, null, 'manual_google', true, 'idealiza-imoveis-ribeirao-pires-1', 'imobiliaria', 'https://idealizaimoveis.com.br', null),
    (gen_random_uuid(), 'Medieval Imóveis', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, null, null, null, null, 'manual_google', true, 'medieval-imoveis-ribeirao-pires-1', 'imobiliaria', 'https://medievalimoveis.com.br', null),
    (gen_random_uuid(), 'Imobiliária Kamoto', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, null, null, null, null, 'manual_google', true, 'imobiliaria-kamoto-ribeirao-pires-1', 'imobiliaria', null, null)
ON CONFLICT (slug) DO UPDATE SET 
    city_id = EXCLUDED.city_id,
    category = EXCLUDED.category;
