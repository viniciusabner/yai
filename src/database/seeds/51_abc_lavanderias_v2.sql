-- Seeds para a categoria Lavanderias (Lavanderias) no ABC Paulista - V2 (Deep Search)
-- Algumas cidades possuem menos resultados pois priorizamos estabelecimentos reais e confirmados
-- Total: 57 registros

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
-- Santo André (city_id: 1)
(gen_random_uuid(), 'Limp Tutti Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Rua Santo André, 344', '11961697004', '1144275590', 'manual_google', true, 'limp-tutti-lavanderia-santo-andre'),
(gen_random_uuid(), 'ABCClean Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jd. Bela Vista', 'Av. Portugal, 1537', '11964010758', '1144384420', 'manual_google', true, 'abcclean-lavanderia-santo-andre'),
(gen_random_uuid(), 'Lavanderia Vitoria', 'lavanderia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Linda', 'Rua Muritinga, 517', NULL, '1127862905', 'manual_google', true, 'lavanderia-vitoria-santo-andre'),
(gen_random_uuid(), 'OMO Lavanderia Figueiras', 'lavanderia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Rua das Figueiras, 1319', NULL, '1144366505', 'manual_google', true, 'omo-lavanderia-figueiras-santo-andre'),
(gen_random_uuid(), 'Lavanderia Campestre', 'lavanderia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Rua das Figueiras, 1955', NULL, '1144211292', 'manual_google', true, 'lavanderia-campestre-santo-andre'),
(gen_random_uuid(), 'RODRITAP', 'lavanderia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Utinga', 'Rua Milão, 367', NULL, '1142271793', 'manual_google', true, 'rodritap-santo-andre'),
(gen_random_uuid(), 'BLUewash II Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Luzita', 'Rua do Pedroso, 1000', NULL, '1149947299', 'manual_google', true, 'bluewash-ii-lavanderia-santo-andre'),

-- São Bernardo do Campo (city_id: 2)
(gen_random_uuid(), 'Laundromat São Bernardo', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Avenida Francisco Prestes Maia, 501', '21992674064', '21992674064', 'manual_google', true, 'laundromat-sao-bernardo-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavanderia São Bernardo e Passanderia LP2', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Avenida Francisco Prestes Maia, 847', NULL, '1143375590', 'manual_google', true, 'lavanderia-sao-bernardo-e-passanderia-lp2-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Selava Express', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'R. Américo Brasiliense, 532', '11939437708', '11939437708', 'manual_google', true, 'selava-express-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lav Best Matriz', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Av. Barão de Mauá, 325', '11997490847', '1141254331', 'manual_google', true, 'lav-best-matriz-sao-bernardo-do-campo'),
(gen_random_uuid(), 'LA VITTA LAVANDERIA', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Rua Arica, 12', '11938019191', '1143520202', 'manual_google', true, 'la-vitta-lavanderia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'A&J Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Alvarenga', 'Rua Santo André, 12', NULL, '1143583564', 'manual_google', true, 'a-e-j-lavanderia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavema Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'R. Votorantim, 07', '11959875371', '1143689815', 'manual_google', true, 'lavema-lavanderia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavateria Fast Rudge Ramos', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Av. Caminho do Mar, 2965', '11994207385', '11994207385', 'manual_google', true, 'lavateria-fast-rudge-ramos-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavup', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Av. Caminho do Mar, 2897', '11988478181', '11988478181', 'manual_google', true, 'lavup-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Tunagoon Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Rua Jacquey, 377', NULL, '1141774971', 'manual_google', true, 'tunagoon-lavanderia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavanderia Eco Clear', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Avenida Bispo César Dacorso Filho, 248', NULL, '1143675511', 'manual_google', true, 'lavanderia-eco-clear-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Relav São Bernardo do Campo', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Av. Getúlio Vargas, 1550', NULL, NULL, 'manual_google', true, 'relav-sao-bernardo-do-campo-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavanderia Industrial Sao Bernardo Lavisber', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'R. Adamantina, 28', NULL, '1141239599', 'manual_google', true, 'lavanderia-industrial-sao-bernardo-lavisber-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Washtec Lavanderia Baeta Neves', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Avenida Getúlio Vargas, 1345', NULL, '1141253509', 'manual_google', true, 'washtec-lavanderia-baeta-neves-sao-bernardo-do-campo'),
(gen_random_uuid(), 'LavExpress', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Av. Pereira Barreto, 1120', '11915508001', '11915508001', 'manual_google', true, 'lavexpress-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavanderia Vida Prática', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Rua Francisco Alves, 902', '11961689558', '1141787288', 'manual_google', true, 'lavanderia-vida-pratica-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Lavateria Fast Paulicéia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'R. General Bertoldo Klinger, 50', '11947190119', '11947190119', 'manual_google', true, 'lavateria-fast-pauliceia-sao-bernardo-do-campo'),

-- São Caetano do Sul (city_id: 3)
(gen_random_uuid(), 'Personale Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Amazonas, 909', '11937774038', '1142241600', 'manual_google', true, 'personale-lavanderia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Bubblebox Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'R. Senador Vergueiro, 428', NULL, NULL, 'manual_google', true, 'bubblebox-lavanderia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Lavanderia Sol', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Conselheiro Lafayette, 532', '1198646548', '1198646548', 'manual_google', true, 'lavanderia-sol-sao-caetano-do-sul'),
(gen_random_uuid(), 'Estilo Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Piauí, 907', '11973009436', '1142271384', 'manual_google', true, 'estilo-lavanderia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Facile Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Rafael Correa Sampaio, 263', NULL, '1142243153', 'manual_google', true, 'facile-lavanderia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Lav & Lev Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua São Paulo, 1520', NULL, '1142298317', 'manual_google', true, 'lav-lev-lavanderia-sao-caetano-do-sul'),
(gen_random_uuid(), 'DRYCLEAN USA', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'R. Dr. Augusto de Toledo, 724', NULL, '1142212031', 'manual_google', true, 'dryclean-usa-sao-caetano-do-sul'),
(gen_random_uuid(), 'LT Lavanderia de Tapetes', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Conselheiro Lafayette, 120', NULL, '1142243046', 'manual_google', true, 'lt-lavanderia-de-tapetes-sao-caetano-do-sul'),
(gen_random_uuid(), 'Abc Clean Service', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Piauí, 237', NULL, '1142262829', 'manual_google', true, 'abc-clean-service-sao-caetano-do-sul'),
(gen_random_uuid(), 'Dryclean Park Shopping', 'lavanderia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Espaço Cerâmica', 'Alameda Terracota, 545', NULL, '1142338367', 'manual_google', true, 'dryclean-park-shopping-sao-caetano-do-sul'),

-- Diadema (city_id: 4)
(gen_random_uuid(), 'Lavanderia e Tinturaria Nova Paraíso', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Amélia Eugênia, 322', NULL, '1140565100', 'manual_google', true, 'lavanderia-e-tinturaria-nova-paraiso-diadema'),
(gen_random_uuid(), 'Lavanderia e Tinturaria Vincus', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida São José, 379', NULL, '1140513349', 'manual_google', true, 'lavanderia-e-tinturaria-vincus-diadema'),
(gen_random_uuid(), 'Lavhotel Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Álvares Cabral, 606', NULL, '1140449184', 'manual_google', true, 'lavhotel-lavanderia-diadema'),
(gen_random_uuid(), 'Innovar Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Alda, 1341', '11964541163', '1140923974', 'manual_google', true, 'innovar-lavanderia-diadema'),
(gen_random_uuid(), 'KIN LAVANDERIA', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Arthur Sampaio Moreira, 100', NULL, NULL, 'manual_google', true, 'kin-lavanderia-diadema'),
(gen_random_uuid(), 'MH Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila dos Campeões', 'Avenida Fukuichi Nakata, 659', '11962701163', '1140721745', 'manual_google', true, 'mh-lavanderia-diadema'),
(gen_random_uuid(), 'Lava e Leva Diadema', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Nogueira', 'Av Fagundes de Oliveira, 243', '11952170338', '11952170338', 'manual_google', true, 'lava-e-leva-diadema-diadema'),
(gen_random_uuid(), 'CASA LIMPA', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Eldorado', 'Rua Guarapiranga, 94', NULL, NULL, 'manual_google', true, 'casa-limpa-diadema'),
(gen_random_uuid(), 'LAVANDERIA DOMESTICA ADORE', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Eldorado', 'Rua Carapicu, 09', NULL, NULL, 'manual_google', true, 'lavanderia-domestica-adore-diadema'),
(gen_random_uuid(), 'Lav Seg Lavanderia Industrial', 'lavanderia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Avenida Ns. das Graças, 871', NULL, '1140442331', 'manual_google', true, 'lav-seg-lavanderia-industrial-diadema'),

-- Mauá (city_id: 5)
(gen_random_uuid(), 'Lavanderia GG', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Av. Antônia Rosa Fioravanti, 1020', '11995682664', '1145197522', 'manual_google', true, 'lavanderia-gg-maua'),
(gen_random_uuid(), 'Central Lavanderia e Casa de Costura', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'Rua Agostinho Assis Fernandes, 58', NULL, '1145143594', 'manual_google', true, 'central-lavanderia-e-casa-de-costura-maua'),
(gen_random_uuid(), 'Lavanderia e Tinturaria Imperial', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'Avenida Dom José Gaspar, 311', NULL, '1145550434', 'manual_google', true, 'lavanderia-e-tinturaria-imperial-maua'),
(gen_random_uuid(), 'Washtec Tingimento', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Osório, 94', NULL, '1145452580', 'manual_google', true, 'washtec-tingimento-maua'),
(gen_random_uuid(), 'Multi Clean', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Emilio', 'R. Dr. Fernando Costa, 550', '11942987288', '1145186157', 'manual_google', true, 'multi-clean-maua'),
(gen_random_uuid(), 'Lava e Leva Lavanderia Mauá', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Sul', 'Rua Jundiaí, 460', NULL, '1127861200', 'manual_google', true, 'lava-e-leva-lavanderia-maua-maua'),
(gen_random_uuid(), 'Sérgio Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque São Vicente', 'Rua Presidente Arthur da Costa e Silva, 244', NULL, '1145138168', 'manual_google', true, 'sergio-lavanderia-maua'),
(gen_random_uuid(), 'Soft Clear Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Rua Ricardo Becheli, 136', NULL, '1145142233', 'manual_google', true, 'soft-clear-lavanderia-maua'),
(gen_random_uuid(), 'Bellylav', 'lavanderia', (SELECT id FROM public.cities WHERE slug='maua'), 'Mauá', 'Av. Barão de Mauá, 2855', NULL, '1128657550', 'manual_google', true, 'bellylav-maua'),

-- Ribeirão Pires (city_id: 6)
(gen_random_uuid(), 'Lavanderia e Tingimento Washtec', 'lavanderia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Fortuna, 271', NULL, '1148277859', 'manual_google', true, 'lavanderia-e-tingimento-washtec-ribeirao-pires'),
(gen_random_uuid(), 'Sos Lavanderia', 'lavanderia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Av. Fortuna, 265', NULL, '1148285529', 'manual_google', true, 'sos-lavanderia-ribeirao-pires'),
(gen_random_uuid(), 'Multi Clean Ribeirão', 'lavanderia', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Afonso Zampol, 48', NULL, NULL, 'manual_google', true, 'multi-clean-ribeirao-ribeirao-pires'),

-- Rio Grande da Serra (city_id: 7)
(gen_random_uuid(), 'Lavanderia Lavô', 'lavanderia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rua Prefeito Cido Franco, 87', '11995040505', '11995040505', 'manual_google', true, 'lavanderia-lavo-rio-grande-da-serra')
ON CONFLICT (slug) DO NOTHING;
