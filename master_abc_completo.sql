-- MASTER SCRIPT: ARQUIVOS _ABC_ (TODAS AS CIDADES)
-- Corrige as categorias com hífen para underline, IDs hardcoded e subqueries


-- ===========================================
-- FROM FILE: 25_abc_handyman.sql
-- ===========================================
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
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 51_abc_lavanderias_v2.sql
-- ===========================================
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
(gen_random_uuid(), 'Lavanderia e Tingimento Washtec', 'lavanderia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Fortuna, 271', NULL, '1148277859', 'manual_google', true, 'lavanderia-e-tingimento-washtec-ribeirao-pires'),
(gen_random_uuid(), 'Sos Lavanderia', 'lavanderia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Fortuna, 265', NULL, '1148285529', 'manual_google', true, 'sos-lavanderia-ribeirao-pires'),
(gen_random_uuid(), 'Multi Clean Ribeirão', 'lavanderia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Afonso Zampol, 48', NULL, NULL, 'manual_google', true, 'multi-clean-ribeirao-ribeirao-pires'),

-- Rio Grande da Serra (city_id: 7)
(gen_random_uuid(), 'Lavanderia Lavô', 'lavanderia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rua Prefeito Cido Franco, 87', '11995040505', '11995040505', 'manual_google', true, 'lavanderia-lavo-rio-grande-da-serra')
ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 52_abc_personal_organizer.sql
-- ===========================================
-- Seeds para a categoria Personal Organizer no ABC Paulista
-- A varredura profunda encontrou profissionais reais, porém em menor volume devido à natureza autônoma e remota do serviço (sem fachada física).

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
(gen_random_uuid(), 'Espaço Prático (Valéria Freitas)', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Rua Jequitinhonha, 335', NULL, NULL, 'manual_google', true, 'espaco-pratico-santo-andre'),
(gen_random_uuid(), 'Débora Demarchi (Debs Organizer)', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'debora-demarchi-santo-andre'),
(gen_random_uuid(), 'Bella Ordine (Fernanda Piva)', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Domiciliar', '11971944184', '11971944184', 'manual_google', true, 'bella-ordine-santo-andre'),
(gen_random_uuid(), 'Transforme com a Mari', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'transforme-com-a-mari-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Nana Bernardo Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Domiciliar', '11982641514', '11982641514', 'manual_google', true, 'nana-bernardo-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Oliva Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'oliva-organizer-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Thaynara B. Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'thaynara-b-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Ro Organiza', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Niterói, 362', NULL, NULL, 'manual_google', true, 'ro-organiza-sao-caetano-do-sul'),
(gen_random_uuid(), 'Luiza Petroni Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Domiciliar', '11992853379', '11992853379', 'manual_google', true, 'luiza-petroni-sao-caetano-do-sul'),
(gen_random_uuid(), 'Mosaico Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Espaço Cerâmica', 'Atendimento Domiciliar', '11981048336', '11981048336', 'manual_google', true, 'mosaico-organizer-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Laudenice Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'laudenice-diadema'),

-- Mauá
(gen_random_uuid(), 'Iris Flor De Liz Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'iris-flor-de-liz-maua'),
(gen_random_uuid(), 'Celmy Belle Personal Organizer', 'personal_organizer', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Atendimento Domiciliar', NULL, NULL, 'manual_google', true, 'celmy-belle-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Eliana Ribeiro Lopes', 'personal_organizer', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Domiciliar', '11937153172', '11937153172', 'manual_google', true, 'eliana-ribeiro-lopes-ribeirao-pires')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 53_abc_limpeza_pos_obra.sql
-- ===========================================
-- Seeds para a categoria Limpeza Pós Obra e Faxina Profissional no ABC Paulista

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
(gen_random_uuid(), 'Asafe Higienização Pós-Obra', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11988310643', '11988310643', 'manual_google', true, 'asafe-higienizacao-santo-andre'),
(gen_random_uuid(), 'Consulimp Cleaning Services', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11965925556', '1131018717', 'manual_google', true, 'consulimp-santo-andre'),
(gen_random_uuid(), 'House Shine Limpeza', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '11961701831', '11961701831', 'manual_google', true, 'house-shine-santo-andre'),
(gen_random_uuid(), 'Atmosfera Limpeza Profissional', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'atmosfera-limpeza-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Lava Imper Serviços', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11977380546', '11977380546', 'manual_google', true, 'lava-imper-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Grenda Service', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '11961497588', '1152423295', 'manual_google', true, 'grenda-service-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Practice Clean SBC', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', '11976172661', '1144793587', 'manual_google', true, 'practice-clean-sao-bernardo-do-campo'),
(gen_random_uuid(), 'TUR Reformas e Limpeza', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim São Bernardo', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'tur-reformas-limpeza-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Grupo FLS Serviços', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '1144722990', '1144722990', 'manual_google', true, 'grupo-fls-sao-caetano-do-sul'),
(gen_random_uuid(), 'Spartaco Terceirizações', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'spartaco-terceirizacoes-sao-caetano-do-sul'),
(gen_random_uuid(), 'Leni Limpeza Pós Obra', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Espaço Cerâmica', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'leni-limpeza-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Reallimp Diadema', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'reallimp-diadema'),
(gen_random_uuid(), 'Volpi Serviços de Limpeza', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'volpi-servicos-diadema'),
(gen_random_uuid(), 'MP Facilities', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11975950505', '11975950505', 'manual_google', true, 'mp-facilities-diadema'),

-- Mauá
(gen_random_uuid(), 'Limpeza Inteligente Pós Obra', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11988310643', '11988310643', 'manual_google', true, 'limpeza-inteligente-maua'),
(gen_random_uuid(), 'Codlimp Serviços Especializados', 'limpeza_pos_obra', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'codlimp-servicos-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'A5WEB Alimpadora', 'limpeza_pos_obra', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '17981002981', '17981002981', 'manual_google', true, 'a5web-alimpadora-ribeirao-pires'),
(gen_random_uuid(), 'Novaclean Pisos e Limpeza', 'limpeza_pos_obra', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ouro Fino Paulista', 'Atendimento Regional', '11933829119', '1147700881', 'manual_google', true, 'novaclean-ribeirao-pires'),
(gen_random_uuid(), 'Oliver Serviços Terceirizados', 'limpeza_pos_obra', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'oliver-servicos-ribeirao-pires')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 54_abc_redes_protecao.sql
-- ===========================================
-- Seeds para a categoria Redes de Proteção no ABC Paulista

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
(gen_random_uuid(), 'Mari Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11970971456', '11970971456', 'manual_google', true, 'mari-redes-de-protecao-santo-andre'),
(gen_random_uuid(), 'Soluções Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Alzira', 'Atendimento Regional', '11997777352', '1128669625', 'manual_google', true, 'solucoes-redes-de-protecao-santo-andre'),
(gen_random_uuid(), 'Vidal''s Proteções', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11950495293', '11950495293', 'manual_google', true, 'vidals-protecoes-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'PB Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11964569245', '1143069245', 'manual_google', true, 'pb-redes-de-protecao-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Garcia Redes', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', NULL, '1129570499', 'manual_google', true, 'garcia-redes-sao-bernardo-do-campo'),
(gen_random_uuid(), 'RGR Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', '11958871612', '11958871612', 'manual_google', true, 'rgr-redes-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Fortex Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Atendimento Regional', '11961751592', '1144764120', 'manual_google', true, 'fortex-redes-sao-bernardo-do-campo'),
(gen_random_uuid(), 'ABC Telas e Redes', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Demarchi', 'Atendimento Regional', '11997079018', '11997079018', 'manual_google', true, 'abc-telas-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Love Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11978846583', '11978846583', 'manual_google', true, 'love-redes-de-protecao-sao-caetano-do-sul'),
(gen_random_uuid(), 'Mel Proteções', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Regional', NULL, '1126818141', 'manual_google', true, 'mel-protecoes-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Brasil Redes Proteções', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11969380454', '1124553618', 'manual_google', true, 'brasil-redes-protecoes-diadema'),
(gen_random_uuid(), 'Pet Seguro Redes', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11948277508', '1125018610', 'manual_google', true, 'pet-seguro-redes-diadema'),

-- Mauá
(gen_random_uuid(), 'Excelência Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11961418863', '1141710493', 'manual_google', true, 'excelencia-redes-maua'),
(gen_random_uuid(), 'Protagon Redes de Proteção', 'redes_protecao', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Avenida Presidente Afonso Pena, 551', '11951926128', '11951926128', 'manual_google', true, 'protagon-redes-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Magazine das Redes', 'redes_protecao', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11987861055', '1144011803', 'manual_google', true, 'magazine-das-redes-ribeirao-pires')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 55_abc_automacao_residencial.sql
-- ===========================================
-- Seeds para a categoria Automação Residencial no ABC Paulista

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
(gen_random_uuid(), 'Smart Atlantics Brasil', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11913702675', '11913702675', 'manual_google', true, 'smart-atlantics-brasil-santo-andre'),
(gen_random_uuid(), 'Hex Solutions Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', NULL, '1126280301', 'manual_google', true, 'hex-solutions-santo-andre'),
(gen_random_uuid(), 'HouseSmart Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '92981454564', '92981454564', 'manual_google', true, 'housesmart-automacao-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Automação Residencial São Paulo', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11975596711', '11975596711', 'manual_google', true, 'automacao-residencial-sao-paulo-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Pennse Controles e Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', NULL, '1120224656', 'manual_google', true, 'pennse-controles-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Enercec Engenharia e Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'enercec-engenharia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Casa Inteligente Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'casa-inteligente-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Bass Automação e Home Theater', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11973946245', '1126492984', 'manual_google', true, 'bass-automacao-sao-caetano-do-sul'),
(gen_random_uuid(), 'Aut4u Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 185', '11933113004', '11933113004', 'manual_google', true, 'aut4u-automacao-sao-caetano-do-sul'),
(gen_random_uuid(), 'SmartEvo Automação', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Jardim São Caetano', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'smartevo-automacao-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'DOMUS Smart Home', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'domus-smart-home-diadema'),

-- Mauá
(gen_random_uuid(), 'Casa Tech Soluções', 'automacao_residencial', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, NULL, 'manual_google', true, 'casa-tech-solucoes-maua')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 56_abc_mudancas.sql
-- ===========================================
-- Seeds para a categoria Mudanças no ABC Paulista

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
(gen_random_uuid(), 'JM Mudanças', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1142593692', 'manual_google', true, 'jm-mudancas-santo-andre'),
(gen_random_uuid(), 'Katedral Transportadora', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11966933564', '11966933564', 'manual_google', true, 'katedral-transportadora-santo-andre'),
(gen_random_uuid(), 'Good Fast Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', '11987130755', '11987130755', 'manual_google', true, 'good-fast-transportes-santo-andre'),
(gen_random_uuid(), 'ELG Mudanças', 'mudancas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Utinga', 'Atendimento Regional', '11951948867', '11951948867', 'manual_google', true, 'elg-mudancas-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Mudança Barata SBC', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11986536550', '11986536550', 'manual_google', true, 'mudanca-barata-sao-bernardo-do-campo'),
(gen_random_uuid(), 'MSilva Mudanças', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '11947625147', '11947625147', 'manual_google', true, 'msilva-mudancas-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Mude Express', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Atendimento Regional', '11952388892', '11952388892', 'manual_google', true, 'mude-express-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Trans Tut''S Carretos', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Atendimento Regional', '11932881936', '11932881936', 'manual_google', true, 'trans-tuts-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Rapidesh Express', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Atendimento Regional', NULL, '1142354698', 'manual_google', true, 'rapidesh-express-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'MME Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11984150534', '1139024754', 'manual_google', true, 'mme-transportes-sao-caetano-do-sul'),
(gen_random_uuid(), 'Jadlog São Caetano', 'mudancas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Atendimento Regional', '11991168466', '1126293201', 'manual_google', true, 'jadlog-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'Canaã Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11980386232', '1126779102', 'manual_google', true, 'canaa-transportes-diadema'),
(gen_random_uuid(), 'Zurcad Transportes', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Atendimento Regional', '11933702274', '1129558020', 'manual_google', true, 'zurcad-transportes-diadema'),
(gen_random_uuid(), 'ADJ Transportadora', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11914632638', '11914632638', 'manual_google', true, 'adj-transportadora-diadema'),
(gen_random_uuid(), 'KM Transporte', 'mudancas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Eldorado', 'Atendimento Regional', NULL, '1122076070', 'manual_google', true, 'km-transporte-diadema'),

-- Mauá
(gen_random_uuid(), 'Mudanças Loyola', 'mudancas', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, '1137739892', 'manual_google', true, 'mudancas-loyola-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'MSilva Carretos', 'mudancas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11953372757', '11953372757', 'manual_google', true, 'msilva-carretos-ribeirao-pires'),
(gen_random_uuid(), 'Mudanças Local RP', 'mudancas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Ouro Fino Paulista', 'Atendimento Regional', '11930005757', '1142377990', 'manual_google', true, 'mudancas-local-ribeirao-pires')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 57_abc_terapia_psicologia.sql
-- ===========================================
-- Seeds para a categoria Terapia e Psicologia no ABC Paulista

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
(gen_random_uuid(), 'Nossos Psicólogos (Santo André)', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11959781941', '11959781941', 'manual_google', true, 'nossos-psicologos-santo-andre'),
(gen_random_uuid(), 'Psicologia Santo André', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999454953', '11999454953', 'manual_google', true, 'psicologia-santo-andre'),
(gen_random_uuid(), 'Sitka Núcleo Terapêutico', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11913306143', '11913306143', 'manual_google', true, 'sitka-nucleo-terapeutico-santo-andre'),
(gen_random_uuid(), 'Clínica Multipsico', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1127593798', 'manual_google', true, 'clinica-multipsico-santo-andre'),
(gen_random_uuid(), 'Clínica Seiner', 'psicologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '11985911184', '1149943614', 'manual_google', true, 'clinica-seiner-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Mindclin Clínica Multidisciplinar', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11930452475', '1127868577', 'manual_google', true, 'mindclin-clinica-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Clínica Rosas de Terapia SBC', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Avenida Redenção, 432', '11983200099', '11986470048', 'manual_google', true, 'clinica-rosas-terapia-sao-bernardo-do-campo'),
(gen_random_uuid(), 'Elaine Sereno Teixeira Psicologia', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11968632121', '11968632121', 'manual_google', true, 'elaine-sereno-teixeira-sao-bernardo-do-campo'),

-- São Caetano do Sul
(gen_random_uuid(), 'Psicologia São Caetano', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Amazonas, 416', '11998966260', '11998966260', 'manual_google', true, 'psicologia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Espaço Clínico Jardim da Consciência', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Afonso Pena, 251', '11956336017', '11956336017', 'manual_google', true, 'espaco-clinico-jardim-consciencia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Cristina Psicóloga A Sapiência', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Avenida Senador Roberto Simonsen, 743, Sala 10', '11999405085', '1142294477', 'manual_google', true, 'cristina-psicologa-sapiencia-sao-caetano-do-sul'),
(gen_random_uuid(), 'Clínica Psicon', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 215 Sala 406', '11944652839', '1128977088', 'manual_google', true, 'clinica-psicon-sao-caetano-do-sul'),
(gen_random_uuid(), 'Clínica Síntese', 'psicologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Conselheiro Lafayette, 318', NULL, '1142291654', 'manual_google', true, 'clinica-sintese-sao-caetano-do-sul'),

-- Diadema
(gen_random_uuid(), 'OPUS Psicologia e Neuropsicologia', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Turmalinas, 132 Salas 10 e 11', '11970404756', '1140562948', 'manual_google', true, 'opus-psicologia-diadema'),
(gen_random_uuid(), 'CEPAP Centro Paulista de Psicologia', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Orense, 41 Sala 414', '11972522372', '1142532997', 'manual_google', true, 'cepap-centro-paulista-psicologia-diadema'),
(gen_random_uuid(), 'Val Silva Psicóloga', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11958365632', '11958365632', 'manual_google', true, 'val-silva-psicologa-diadema'),
(gen_random_uuid(), 'Espaço Mente em Ação (emeap)', 'psicologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Praça Joviniano de Castilho, 33 Cj 34 3º andar', '11984468362', '11984468362', 'manual_google', true, 'espaco-mente-em-acao-diadema'),

-- Mauá
(gen_random_uuid(), 'Clínica Rosas de Terapia Mauá', 'psicologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Rua do Comércio, 21', '11983200099', '1145182549', 'manual_google', true, 'clinica-rosas-terapia-maua'),
(gen_random_uuid(), 'ARCA Clínica', 'psicologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque São Vicente', 'Atendimento Regional', '11965817857', '1123757061', 'manual_google', true, 'arca-clinica-maua'),
(gen_random_uuid(), 'SELFF Clínica Psicológica', 'psicologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145553944', '1145553722', 'manual_google', true, 'selff-clinica-psicologica-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Psicólogo Em Ribeirão Pires', 'psicologia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Fortuna, 98', '11999454953', '11999454953', 'manual_google', true, 'psicologo-ribeirao-pires'),
(gen_random_uuid(), 'Clínica Elgra', 'psicologia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro Alto', 'Av. Santo André, 252', NULL, '1148234600', 'manual_google', true, 'clinica-elgra-ribeirao-pires'),
(gen_random_uuid(), 'Espaço Terapia Alamed', 'psicologia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Kaethe Richers, 117', '11910313139', '1148245448', 'manual_google', true, 'espaco-terapia-alamed-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Mariza Psicóloga', 'psicologia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11972321837', '11972321837', 'manual_google', true, 'mariza-psicologa-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 58_abc_personal_trainer.sql
-- ===========================================
-- Seeds para a categoria Personal Trainer no ABC Paulista

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
(gen_random_uuid(), 'Marina Personal Trainer', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento em Condomínios e Academias', '11970877377', '11970877377', 'manual_google', true, 'marina-personal-santo-andre'),
(gen_random_uuid(), 'Gustavo Personal Trainer', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento em Condomínios e Academias', '11959835698', '11959835698', 'manual_google', true, 'gustavo-personal-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Treinar.me Profissionais SBC', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'treinar-me-sbc'),
(gen_random_uuid(), 'Personal Trainer SBC Online', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Atendimento Regional', '11970877377', '11970877377', 'manual_google', true, 'personal-sbc-online'),

-- São Caetano do Sul
(gen_random_uuid(), 'Treinar.me Profissionais SCS', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'treinar-me-scs'),

-- Diadema
(gen_random_uuid(), 'Pro Fitness Academy', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'pro-fitness-diadema'),

-- Mauá
(gen_random_uuid(), 'Maverick Academia Mauá', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11914288952', '11914288952', 'manual_google', true, 'maverick-academia-maua'),
(gen_random_uuid(), 'Power Fitness Personal', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Vitoria', 'Atendimento Regional', '11914288952', '11914288952', 'manual_google', true, 'power-fitness-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Academia Atlantis Personal', 'personal_trainer', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', NULL, '1141275177', 'manual_google', true, 'atlantis-personal-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Treinar.me Profissionais RGS', 'personal_trainer', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '12991114708', '12991114708', 'manual_google', true, 'treinar-me-rgs')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 59_abc_nutricionista.sql
-- ===========================================
-- Seeds para a categoria Nutricionistas no ABC Paulista

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
(gen_random_uuid(), 'Clínica Vida em Equilíbrio Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11975143327', '11975143327', 'manual_google', true, 'clinica-vida-equilibrio-santo-andre'),
(gen_random_uuid(), 'Raphael Costa Selleri Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', '11957221466', '11957221466', 'manual_google', true, 'raphael-costa-selleri-santo-andre'),
(gen_random_uuid(), 'Dra. Janaini Araújo Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', '11984354496', '11984354496', 'manual_google', true, 'janaini-araujo-santo-andre'),
(gen_random_uuid(), 'Fernanda Alves Prado Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Atendimento Regional', '11966629079', '11966629079', 'manual_google', true, 'fernanda-alves-prado-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Dra. Lorena Medeiros Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Baeta Neves', 'Av. Getúlio Vargas, 70 - 2º andar sala 23', '11952736872', '11952736872', 'manual_google', true, 'lorena-medeiros-sbc'),
(gen_random_uuid(), 'Gustavo Luiz Nutrição Esportiva', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11959835698', '1149304992', 'manual_google', true, 'gustavo-luiz-nutricao-sbc'),
(gen_random_uuid(), 'Clínica Adriana Biffi', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Frei Gaspar, 941 - Sala 503', NULL, '11999999999', 'manual_google', true, 'clinica-adriana-biffi-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Brayan Scherk Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Pres. Kennedy, 3500 - Sala 902', '11982225255', '11982225255', 'manual_google', true, 'brayan-scherk-scs'),
(gen_random_uuid(), 'Clínica Bruna Amaral Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Rua Espírito Santo, 115', '11989888790', '11989888790', 'manual_google', true, 'bruna-amaral-scs'),
(gen_random_uuid(), 'Bianca Kucharsky Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11945258053', '11945258053', 'manual_google', true, 'bianca-kucharsky-scs'),
(gen_random_uuid(), 'Clínica Azzi Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 250, CJ 304', '11930042000', '1142242000', 'manual_google', true, 'clinica-azzi-scs'),
(gen_random_uuid(), 'Dra. Fernanda Molina Nutrição', 'nutricionista', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Pará 139, 3º andar, sala 301', '11947165880', '11947165880', 'manual_google', true, 'fernanda-molina-scs'),

-- Diadema
(gen_random_uuid(), 'Nutri Juliana Lopes', 'nutricionista', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'juliana-lopes-diadema'),
(gen_random_uuid(), 'Aline Martins Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Manoel da Nóbrega, 628 / Conj 110', NULL, '11999999999', 'manual_google', true, 'aline-martins-diadema'),
(gen_random_uuid(), 'João Malta Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11989763990', '11989763990', 'manual_google', true, 'joao-malta-diadema'),

-- Mauá
(gen_random_uuid(), 'Charlene Cristina Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'R. Alm. Barroso, 30', '11981743554', '11981743554', 'manual_google', true, 'charlene-cristina-maua'),
(gen_random_uuid(), 'Elaine Costa Nutricionista', 'nutricionista', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, '11999999999', 'manual_google', true, 'elaine-costa-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Anna Paula Vicente Nutricionista', 'nutricionista', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11916091385', '11916091385', 'manual_google', true, 'anna-paula-vicente-ribeirao-pires'),
(gen_random_uuid(), 'Ana Paula Bastos Nutricionista', 'nutricionista', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro Alto', 'Rua Rubião Júnior, 438', NULL, '11999999999', 'manual_google', true, 'ana-paula-bastos-ribeirao-pires')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 60_abc_exames_domiciliares.sql
-- ===========================================
-- Seeds para a categoria Exames Laboratoriais Domiciliares no ABC Paulista

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
(gen_random_uuid(), 'Grupo Ana Rosa Saúde (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1128422222', '1128422222', 'manual_google', true, 'ana-rosa-saude-santo-andre'),
(gen_random_uuid(), 'Labi Saúde (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1130032686', '1130032686', 'manual_google', true, 'labi-saude-santo-andre'),
(gen_random_uuid(), 'Vital Lab (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11940013043', '1132304950', 'manual_google', true, 'vital-lab-santo-andre'),
(gen_random_uuid(), 'Lab Hormon (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', NULL, '1144338982', 'manual_google', true, 'lab-hormon-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Lavoisier (Atendimento Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '1130474488', '1130474488', 'manual_google', true, 'lavoisier-sbc'),
(gen_random_uuid(), 'Hermes Pardini (Pardini até você)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', NULL, '1140202573', 'manual_google', true, 'hermes-pardini-sbc'),
(gen_random_uuid(), 'Sabin Diagnóstico (VEM Sabin)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Atendimento Regional', '1130032686', '1130032686', 'manual_google', true, 'sabin-diagnostico-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Exame Brasil (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Atendimento Regional', '11972475095', '1149020202', 'manual_google', true, 'exame-brasil-scs'),
(gen_random_uuid(), 'a+ Medicina Diagnóstica (a+ até Você)', 'exames', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Atendimento Regional', '1131398000', '1131398000', 'manual_google', true, 'amais-medicina-diagnostica-scs'),

-- Diadema
(gen_random_uuid(), 'DiasLab (Na Minha Casa)', 'exames', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Arthur Sampaio Moreira, 83', NULL, '1140443190', 'manual_google', true, 'diaslab-diadema'),
(gen_random_uuid(), 'Ato Medicina Diagnóstica (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'ato-medicina-diagnostica-diadema'),

-- Mauá
(gen_random_uuid(), 'Mena Diagnóstico (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11976674302', '1148582964', 'manual_google', true, 'mena-diagnostico-maua'),
(gen_random_uuid(), 'Vital Lab (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Santos Dumont, 182', '11940013043', '1134200060', 'manual_google', true, 'vital-lab-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Exame Brasil (Coleta Domiciliar)', 'exames', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11972475095', '1149020202', 'manual_google', true, 'exame-brasil-ribeirao-pires'),
(gen_random_uuid(), 'Vital Lab (Coleta Domiciliar)', 'exames', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11940013043', '1134200060', 'manual_google', true, 'vital-lab-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Exame Brasil (Coleta Domiciliar)', 'exames', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11972475095', '1149020202', 'manual_google', true, 'exame-brasil-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 61_abc_estetica_avancada.sql
-- ===========================================
-- Seeds para a categoria Estética Avançada e Harmonização Facial no ABC Paulista

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
(gen_random_uuid(), 'SJ Estética Avançada', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Homero Thon', 'Rua Giovanni Battista Pirelli, 271', '11982223767', '11982223767', 'manual_google', true, 'sj-estetica-santo-andre'),
(gen_random_uuid(), 'Clínica Dra. Edna Crivelaro', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Homero Thon', 'Rua Giovanni Battista Pirelli, 271 - Sala 209', '11919312465', '11919312465', 'manual_google', true, 'edna-crivelaro-santo-andre'),
(gen_random_uuid(), 'GiO Estética Avançada', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Avenida Padre Manuel da Nóbrega, 287', '11934397511', '1134397511', 'manual_google', true, 'gio-estetica-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Dra. Flávia Gimenez Estética', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'R. Formosa, 79 - Sala 82', '11942203732', '11942203732', 'manual_google', true, 'flavia-gimenez-sbc'),
(gen_random_uuid(), 'Clínica Versollato', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Avenida Antártico, 381 - sala 18', '11914834243', '11914834243', 'manual_google', true, 'clinica-versollato-sbc'),
(gen_random_uuid(), 'BOTOCLINIC', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Kennedy, 700, Piso L1, 174', '11953234346', '11953234346', 'manual_google', true, 'botoclinic-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Royal Face', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'R. Amazonas, 444', '1142297110', '1142297110', 'manual_google', true, 'royal-face-scs'),
(gen_random_uuid(), 'Nativis Estética Avançada', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Rua Castro Alves, 111', '11939360757', '1123767324', 'manual_google', true, 'nativis-estetica-scs'),
(gen_random_uuid(), 'Clínica Perrella', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua General Osório, 410', '11969536028', '1142283879', 'manual_google', true, 'clinica-perrella-scs'),

-- Diadema
(gen_random_uuid(), 'GiO Estética Avançada Diadema', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '1135930200', '1135930200', 'manual_google', true, 'gio-estetica-diadema'),
(gen_random_uuid(), 'Perfil Estética', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Shopping Praça da Moça', '11998225391', '11998225391', 'manual_google', true, 'perfil-estetica-diadema'),
(gen_random_uuid(), 'Clínica Belle Harmony', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Praça Pres. Castelo Branco, 255 - Sala 08', '11974101100', '11974101100', 'manual_google', true, 'belle-harmony-diadema'),

-- Mauá
(gen_random_uuid(), 'Royal Face Mauá', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11996661030', '11996661030', 'manual_google', true, 'royal-face-maua'),
(gen_random_uuid(), 'Dra. Juliana Francis', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque São Vicente', 'Atendimento Regional', '11972171553', '11972171553', 'manual_google', true, 'juliana-francis-maua'),
(gen_random_uuid(), 'Clínica Kondo', 'estetica_avancada', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', NULL, '1145414277', 'manual_google', true, 'clinica-kondo-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'GiO Estética Avançada Ribeirão Pires', 'estetica_avancada', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Stella Bruna Cecchi Nardelli, 48', '11916242197', '11916242197', 'manual_google', true, 'gio-estetica-ribeirao-pires'),
(gen_random_uuid(), 'Elleven Clínica de Saúde', 'estetica_avancada', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Euclídes da Cunha, 117, 3º andar, Sala 38', NULL, '1146807758', 'manual_google', true, 'elleven-clinica-ribeirao-pires')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 62_abc_fisioterapia_quiropraxia.sql
-- ===========================================
-- Seeds para a categoria Fisioterapia e Quiropraxia no ABC Paulista

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
(gen_random_uuid(), 'Touchcare Quiropraxia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Homero Thon', 'Rua Giovanni Battista Pirelli, 271', NULL, '11983020000', 'manual_google', true, 'touchcare-quiropraxia-santo-andre'),
(gen_random_uuid(), 'Clínica Sphera', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-sphera-santo-andre'),
(gen_random_uuid(), 'Clínica Fênix Ortopedia e Fisioterapia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '11999999999', 'manual_google', true, 'clinica-fenix-santo-andre'),
(gen_random_uuid(), 'Clínica BIOMED', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Av. Padre Manuel da Nóbrega, 122', NULL, '1145140800', 'manual_google', true, 'clinica-biomed-santo-andre'),
(gen_random_uuid(), 'Clínica Suport', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Av. Padre Manuel da Nóbrega, 266', '11989872135', '1149900265', 'manual_google', true, 'clinica-suport-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'ITC Vertebral', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Índico, 345', '11914279594', '11914279594', 'manual_google', true, 'itc-vertebral-sbc'),
(gen_random_uuid(), 'Ortopedia e Traumatologia Apoio', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Av. Onze de Agosto, 107', '1143671633', '1143671633', 'manual_google', true, 'ortopedia-apoio-sbc'),
(gen_random_uuid(), 'Mais Coluna', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua José Versolato, 111, conjunto 814', '11999999999', '11999999999', 'manual_google', true, 'mais-coluna-sbc'),
(gen_random_uuid(), 'Dr. Daniel Duenhas Quiropraxia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Jurubatuba, 845, 3º andar', '11999999999', '11999999999', 'manual_google', true, 'dr-daniel-duenhas-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Clínica Criaviva', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Rua Espírito Santo, 512', NULL, '1142281390', 'manual_google', true, 'clinica-criaviva-scs'),
(gen_random_uuid(), 'Clínica Cecília Franco', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-cecilia-franco-scs'),
(gen_random_uuid(), 'Clinica RT Saúde', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Manoel Coelho, 303, 6º Andar, sala 61', '11990022858', '1126685494', 'manual_google', true, 'clinica-rt-saude-scs'),

-- Diadema
(gen_random_uuid(), 'Clínica Fisio&Forma', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Nossa Senhora das Vitórias, 304', '11999999999', '11999999999', 'manual_google', true, 'clinica-fisioforma-diadema'),
(gen_random_uuid(), 'Clínica Onishi', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Nossa Sra. das Vitórias, 344', '11999999999', '1140568248', 'manual_google', true, 'clinica-onishi-diadema'),
(gen_random_uuid(), 'Simone Braga Quiropraxia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'R. Manoel da Nóbrega, 735, sala 109', '11999999999', '11999999999', 'manual_google', true, 'simone-braga-quiropraxia-diadema'),

-- Mauá
(gen_random_uuid(), 'Clínica Serfis Mauá', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'Rua Tercílio Tamagnini, 51', '11959326265', '1145472005', 'manual_google', true, 'clinica-serfis-maua'),
(gen_random_uuid(), 'SOS Quiropraxia Benyhe', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Pilar', 'Av. Portugal, 356 – Sala 13', '11995114387', '11995114387', 'manual_google', true, 'sos-quiropraxia-benyhe-maua'),
(gen_random_uuid(), 'SELFF Clínica de Reabilitação', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145553944', '1145553722', 'manual_google', true, 'selff-clinica-reabilitacao-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Fisioterapia Fiaux e Giarola', 'fisioterapia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', NULL, '1148283237', 'manual_google', true, 'fisioterapia-fiaux-ribeirao-pires'),
(gen_random_uuid(), 'Clínica Elgra', 'fisioterapia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', NULL, '1148234600', 'manual_google', true, 'clinica-elgra-ribeirao-pires'),
(gen_random_uuid(), 'Alamed Clínica Médica', 'fisioterapia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '1148227120', '1148227120', 'manual_google', true, 'alamed-clinica-medica-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Alamed Clínica Médica', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11960584549', '11960584549', 'manual_google', true, 'alamed-clinica-medica-rio-grande-da-serra'),
(gen_random_uuid(), 'APAE Fisioterapia', 'fisioterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Rua Carlos Dos Santos, Nº 156', '11999999999', '11999999999', 'manual_google', true, 'apae-fisioterapia-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 63_abc_cuidadores_idosos.sql
-- ===========================================
-- Seeds para a categoria Cuidador de Idosos no ABC Paulista

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
(gen_random_uuid(), 'Chalé Florenza Residencial', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11985554434', '1149913791', 'manual_google', true, 'chale-florenza-santo-andre'),
(gen_random_uuid(), 'Nursing Excellent (Santo André)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '1150824640', 'manual_google', true, 'nursing-excellent-santo-andre'),
(gen_random_uuid(), 'Home Care Cuidar e Acolher', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'home-care-cuidar-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Home Angels (Centro SBC)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11975004223', '11975004223', 'manual_google', true, 'home-angels-sbc'),
(gen_random_uuid(), 'Angel''s Care ABC', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'angels-care-sbc'),
(gen_random_uuid(), 'LifeStars Cuidadores SBC', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'lifestars-cuidadores-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Vovô Help (São Caetano do Sul)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11990221044', '1141104855', 'manual_google', true, 'vovo-help-scs'),
(gen_random_uuid(), 'Pronto Care (São Caetano do Sul)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11948973172', '1123258667', 'manual_google', true, 'pronto-care-scs'),
(gen_random_uuid(), 'Casa Geriátrica São Caetano', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '1141154559', 'manual_google', true, 'casa-geriatrica-scs'),

-- Diadema
(gen_random_uuid(), 'Clínica Duarte Saúde Integrativa', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11992193554', '11992193554', 'manual_google', true, 'clinica-duarte-diadema'),
(gen_random_uuid(), 'Home Care Anjos de Plantão', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'anjos-de-plantao-diadema'),
(gen_random_uuid(), 'Onix Gestão do Cuidado (Diadema)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'onix-gestao-diadema'),

-- Mauá
(gen_random_uuid(), 'Acvida Cuidadores (Mauá)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '6133492079', '6133492079', 'manual_google', true, 'acvida-cuidadores-maua'),
(gen_random_uuid(), 'Onix Gestão Do Cuidado (Mauá)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'onix-gestao-maua'),
(gen_random_uuid(), 'Vovô Help (Mauá)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11990221044', '1141104855', 'manual_google', true, 'vovo-help-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Núcleo Saúde (Ribeirão Pires)', 'cuidador_idosos', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11912762864', '11912762864', 'manual_google', true, 'nucleo-saude-ribeirao-pires'),
(gen_random_uuid(), 'Amigos do Cuidar Home Care', 'cuidador_idosos', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Tanque Caio', 'Avenida Miro Atílio Peduzzi, 100', '11999999999', '11999999999', 'manual_google', true, 'amigos-do-cuidar-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Home Care Cuidar e Acolher', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11964977776', '11964977776', 'manual_google', true, 'home-care-cuidar-rio-grande-da-serra'),
(gen_random_uuid(), 'Vovô Help (Rio Grande da Serra)', 'cuidador_idosos', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11990221044', '1141104855', 'manual_google', true, 'vovo-help-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 64_abc_yoga_meditacao.sql
-- ===========================================
-- Seeds para a categoria Yoga e Meditação no ABC Paulista

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
(gen_random_uuid(), 'Ajna Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1123795289', 'manual_google', true, 'ajna-yoga-santo-andre'),
(gen_random_uuid(), 'Método DeRose Santo André', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'metodo-derose-santo-andre'),
(gen_random_uuid(), 'Mayaluz Yoga e Terapias', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11964918886', '11964918886', 'manual_google', true, 'mayaluz-yoga-santo-andre'),
(gen_random_uuid(), 'Vidya Studio (Santo André)', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'vidya-studio-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Yenzi Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11970907766', '11970907766', 'manual_google', true, 'yenzi-yoga-sbc'),
(gen_random_uuid(), 'Vayu Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'vayu-yoga-sbc'),
(gen_random_uuid(), 'Espaço Prana (SBC)', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-prana-sbc'),
(gen_random_uuid(), 'Espaço Mãe Gaia', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-mae-gaia-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Soham Yoga Studio', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Caulim, 115 - conjunto 811', '11992689303', '1135656993', 'manual_google', true, 'soham-yoga-scs'),
(gen_random_uuid(), 'Galpão Conexão Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Maria', 'Rua Ivaí, 702', '11987001943', '1142202805', 'manual_google', true, 'galpao-conexao-yoga-scs'),
(gen_random_uuid(), 'Espaço Bem Ser - Yoga e Psicologia', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-bem-ser-scs'),
(gen_random_uuid(), 'Surya Yoga Studio', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'surya-yoga-scs'),

-- Diadema
(gen_random_uuid(), 'Satya Yoga Diadema', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Marechal Deodoro, 311', '11983354267', '11983354267', 'manual_google', true, 'satya-yoga-diadema'),
(gen_random_uuid(), 'Shivão Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'shivao-yoga-diadema'),

-- Mauá
(gen_random_uuid(), 'Yamabushi Dojo Yoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='maua'), 'Matriz', 'Rua Santa Cecília, 215', NULL, '1145452249', 'manual_google', true, 'yamabushi-dojo-maua'),
(gen_random_uuid(), 'SandYoga', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sandyoga-maua'),
(gen_random_uuid(), 'Sagrado Elemento Espaço Holístico', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Rua Duque de Caxias, 358', '11943937599', '11943937599', 'manual_google', true, 'sagrado-elemento-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Espaço Zen (RP)', 'yoga_meditacao', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Roberto Pinto de Toledo, 104', '11944833051', '11944833051', 'manual_google', true, 'espaco-zen-ribeirao-pires'),
(gen_random_uuid(), 'Soul Yoga Studio', 'yoga_meditacao', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Miguel Prisco, 742', '11978113250', '11978113250', 'manual_google', true, 'soul-yoga-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Espaço Zen (Online/Regional)', 'yoga_meditacao', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11944833051', '11944833051', 'manual_google', true, 'espaco-zen-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 65_abc_massoterapia.sql
-- ===========================================
-- Seeds para a categoria Massoterapia no ABC Paulista

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
(gen_random_uuid(), 'Instituto Se Amar', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11998869545', '11998869545', 'manual_google', true, 'instituto-se-amar-santo-andre'),
(gen_random_uuid(), 'Espaço Salvaley', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11991179289', '11991179289', 'manual_google', true, 'espaco-salvaley-santo-andre'),
(gen_random_uuid(), 'Espaço Aline Soares', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11982258184', '11982258184', 'manual_google', true, 'espaco-aline-soares-santo-andre'),
(gen_random_uuid(), 'Buddha Spa Santo André Jardim', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Bairro Jardim', 'Atendimento Regional', '11910008424', '1149904099', 'manual_google', true, 'buddha-spa-santo-andre-jardim'),
(gen_random_uuid(), 'Espaço Ananda', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1144382078', 'manual_google', true, 'espaco-ananda-santo-andre'),
(gen_random_uuid(), 'Aroma Campestre', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'Atendimento Regional', NULL, '1149924003', 'manual_google', true, 'aroma-campestre-santo-andre'),
(gen_random_uuid(), 'Clínica VIP Santo André', 'massoterapia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11942332959', '1149923412', 'manual_google', true, 'clinica-vip-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Massoterapeuta Grace Celi', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Bela Vista, 284', '11999999999', '11999999999', 'manual_google', true, 'massoterapeuta-grace-celi-sbc'),
(gen_random_uuid(), 'Terapeuta Elis', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '11943795362', '11943795362', 'manual_google', true, 'terapeuta-elis-sbc'),
(gen_random_uuid(), 'Buddha Spa Golden Square', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Kennedy, 700 - LOJA 228', '11974109817', '1136311294', 'manual_google', true, 'buddha-spa-golden-square-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'SRmassoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Manoel Coelho, 676 - sala 1501', '11999999999', '11999999999', 'manual_google', true, 'srmassoterapia-scs'),
(gen_random_uuid(), 'Mara Renata Martorelli', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 185 - Sala 203', '11960548341', '1130318300', 'manual_google', true, 'mara-renata-martorelli-scs'),
(gen_random_uuid(), 'Clínica Oriental de Massagem', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Alameda Terracota, 545', '11981793361', '1142338375', 'manual_google', true, 'clinica-oriental-massagem-scs'),
(gen_random_uuid(), 'Corpo e Alma Massoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'R. Manoel Coelho, 362 - sala 15', '11999999999', '11999999999', 'manual_google', true, 'corpo-alma-massoterapia-scs'),
(gen_random_uuid(), 'SPA da Riqueza', 'massoterapia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11978897413', '11978897413', 'manual_google', true, 'spa-da-riqueza-scs'),

-- Diadema
(gen_random_uuid(), 'Instituto Shangrila', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Manoel da Nóbrega, 491', '11945547419', '11945547419', 'manual_google', true, 'instituto-shangrila-diadema'),
(gen_random_uuid(), 'Spaço Therapy - Andréia Souza', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Casa Grande', 'R. Anita Malfatti, 97 - Sala 3', '11999999999', '11999999999', 'manual_google', true, 'spaco-therapy-diadema'),
(gen_random_uuid(), 'Bruno Santos Massoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Alda, 380', '11999999999', '11999999999', 'manual_google', true, 'bruno-santos-massoterapia-diadema'),
(gen_random_uuid(), 'Royal Face Diadema', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua São Luiz, 35', '11913752040', '11913752040', 'manual_google', true, 'royal-face-diadema'),
(gen_random_uuid(), 'Espaço Sense Zen', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Jardim Rey', 'R. Visc. de Inhaúma, 90', NULL, '11987015806', 'manual_google', true, 'espaco-sense-zen-diadema'),
(gen_random_uuid(), 'Ieda Cecila Terapeuta', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'R. Graciosa, 221 - Sala 20', NULL, '11973639656', 'manual_google', true, 'ieda-cecila-terapeuta-diadema'),
(gen_random_uuid(), 'Lótus Bem-Estar', 'massoterapia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua das Turmalinas, 132 - Conj 09', '11970404756', '11970404756', 'manual_google', true, 'lotus-bem-estar-diadema'),

-- Mauá
(gen_random_uuid(), 'Espaço Bem Estar Relaxante', 'massoterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Sonia Maria', 'R. Vicente Celestino, 666', '11999999999', '11999999999', 'manual_google', true, 'espaco-bem-estar-maua'),
(gen_random_uuid(), 'Agnaldo Massagista', 'massoterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Bela Vista', 'R. Francisco Vo, 24', '11977463027', '11977463027', 'manual_google', true, 'agnaldo-massagista-maua'),
(gen_random_uuid(), 'Everton Nemeth Massoterapeuta', 'massoterapia', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Av. Pres. Castelo Branco, 1642 - Sala 11', '11999999999', '11999999999', 'manual_google', true, 'everton-nemeth-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Viviane Alves', 'massoterapia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11996946912', '11996946912', 'manual_google', true, 'viviane-alves-ribeirao-pires'),
(gen_random_uuid(), 'SPA Gota de Outono', 'massoterapia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Fortuna, 81 - Sala 27', '11943202925', '11943202925', 'manual_google', true, 'spa-gota-de-outono-ribeirao-pires'),
(gen_random_uuid(), 'Espaço Mary Estética', 'massoterapia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Dr. Felício Laurito, 61', '11942692848', '11942692848', 'manual_google', true, 'espaco-mary-estetica-ribeirao-pires'),
(gen_random_uuid(), 'Stellzer Massagem', 'massoterapia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro Alto', 'R. Dr. Pirajá, 292', '11999999999', '11999999999', 'manual_google', true, 'stellzer-massagem-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Santê Massoterapia', 'massoterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sante-massoterapia-rio-grande-da-serra'),
(gen_random_uuid(), 'Tássia Saúde & Bem Estar', 'massoterapia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'tassia-saude-bem-estar-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 66_abc_odontologia.sql
-- ===========================================
-- Seeds para a categoria Odontologia Estética no ABC Paulista

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
(gen_random_uuid(), 'Rubi Odonto', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Parque das Nações', 'Atendimento Regional', '11953859973', '11953859973', 'manual_google', true, 'rubi-odonto-santo-andre'),
(gen_random_uuid(), 'Clínica Facialy', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Century Plaza', 'Atendimento Regional', '11993204740', '11993204740', 'manual_google', true, 'clinica-facialy-santo-andre'),
(gen_random_uuid(), 'Clínica B.blanc – Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-bblanc-santo-andre'),
(gen_random_uuid(), 'Infinittá Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'infinitta-odontologia-santo-andre'),
(gen_random_uuid(), 'Sorriso de Impacto – Dra Iessa', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '1149020143', 'manual_google', true, 'sorriso-impacto-dra-iessa-santo-andre'),
(gen_random_uuid(), 'Oral Designer', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Bela Vista', 'Rua Gonçalo Fernandes, 153, Sala 54', '11998772000', '1149905086', 'manual_google', true, 'oral-designer-santo-andre'),
(gen_random_uuid(), 'Clínica Dra Carolina Clausson', 'odontologia', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-dra-carolina-clausson-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'COE Saúde Odontologia Estética', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11934578748', '11934578748', 'manual_google', true, 'coe-saude-odontologia-sbc'),
(gen_random_uuid(), 'Facia Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11947811267', '1143614323', 'manual_google', true, 'facia-odontologia-sbc'),
(gen_random_uuid(), 'VB Odonto Lentes de Contato', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11980526808', '11980526808', 'manual_google', true, 'vb-odonto-sbc'),
(gen_random_uuid(), 'Moreschi Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11995527322', '1143149245', 'manual_google', true, 'moreschi-odontologia-sbc'),
(gen_random_uuid(), 'Clínica Odontológica Clermont', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', NULL, '1143681277', 'manual_google', true, 'clinica-odontologica-clermont-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Clínica Perrella Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11969536028', '11969536028', 'manual_google', true, 'clinica-perrella-scs'),
(gen_random_uuid(), 'Doutor do Povo Clínicas SCS', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'doutor-do-povo-scs'),
(gen_random_uuid(), 'CAASP Farma - Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11958185335', '1142323016', 'manual_google', true, 'caasp-farma-odontologia-scs'),

-- Diadema
(gen_random_uuid(), 'Diadents Lentes de Porcelana', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'R. Orense, 41 - Sala 213', '11988304831', '11988304831', 'manual_google', true, 'diadents-lentes-porcelana-diadema'),
(gen_random_uuid(), 'Riso Facial Clínica Odontológica', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'riso-facial-diadema'),
(gen_random_uuid(), 'Clínica Abreu Centro Odontológico', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Fábio Eduardo Ramos Esquivel, 297', '11976443872', '1140481845', 'manual_google', true, 'clinica-abreu-diadema'),
(gen_random_uuid(), 'Cia Odontológica Dra. Elaine', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Vila Nogueira', 'Rua Antônio Dias Adorno, 114', '11977016465', '11977016465', 'manual_google', true, 'cia-odontologica-dra-elaine-diadema'),
(gen_random_uuid(), 'Family Odontologia Estética', 'odontologia', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'family-odontologia-diadema'),

-- Mauá
(gen_random_uuid(), 'Sangoleti Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sangoleti-odontologia-maua'),
(gen_random_uuid(), 'Clínica Viotto Mauá', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-viotto-maua'),
(gen_random_uuid(), 'Cepen Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cepen-odontologia-maua'),
(gen_random_uuid(), 'Qualident''s Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'qualidents-odontologia-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Dra. Paula Mietti Odontologia', 'odontologia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Fioravante Zampol, 250', '11953226898', '11953226898', 'manual_google', true, 'dra-paula-mietti-ribeirao-pires'),
(gen_random_uuid(), 'Oral Unic Ribeirão Pires', 'odontologia', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Avenida Francisco Monteiro, 1399', NULL, '1148237993', 'manual_google', true, 'oral-unic-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Fonte Vital Odontologia', 'odontologia', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'fonte-vital-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 67_abc_banho_tosa.sql
-- ===========================================
-- Seeds para a categoria Banho e Tosa no ABC Paulista

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
(gen_random_uuid(), 'Pet Shop Pedroso', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Santo André', 'Estr. do Pedroso, 943', '1144517957', '1144517957', 'manual_google', true, 'pet-shop-pedroso-santo-andre'),
(gen_random_uuid(), 'VitalVet ABC', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Almirante Tamandaré, 349', '11999999999', '11999999999', 'manual_google', true, 'vitalvet-abc-santo-andre'),
(gen_random_uuid(), 'Skub Pet Shop', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11959469569', '11959469569', 'manual_google', true, 'skub-pet-shop-santo-andre'),
(gen_random_uuid(), 'Pet Shop Golden Premier', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Rua Almirante Protógenes, 399', '11996190808', '1144275707', 'manual_google', true, 'pet-shop-golden-premier-santo-andre'),
(gen_random_uuid(), 'Petlove Santo André', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Av. Portugal, 751', '1148003965', '1148003965', 'manual_google', true, 'petlove-santo-andre'),
(gen_random_uuid(), 'Cão Cheiroso Banho e Tosa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Rua Inglaterra, 26', '11999999999', '11999999999', 'manual_google', true, 'cao-cheiroso-banho-tosa-santo-andre'),
(gen_random_uuid(), 'Cobasi Santo André Av. dos Estados', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cobasi-av-estados-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Villa Zampa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11963392652', '11963392652', 'manual_google', true, 'villa-zampa-sbc'),
(gen_random_uuid(), '4 Patas e Cia', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11961640027', '1141786461', 'manual_google', true, '4-patas-e-cia-sbc'),
(gen_random_uuid(), 'Pet Shop Perto de Mim SBC', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11964964523', '11964964523', 'manual_google', true, 'pet-shop-perto-de-mim-sbc'),
(gen_random_uuid(), 'Cobasi SBC Faria Lima', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '1148532220', 'manual_google', true, 'cobasi-faria-lima-sbc'),
(gen_random_uuid(), 'PETPOP SBC', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Rua Helena Jacquey, 294', '11999999999', '1127584219', 'manual_google', true, 'petpop-sbc'),
(gen_random_uuid(), 'Chocãolate', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'chocaolate-pet-shop-sbc'),
(gen_random_uuid(), 'Pet Shop Vetorazzo', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-shop-vetorazzo-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'For Pet São Caetano', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Maria', 'Alameda São Caetano, 2423', '11994199000', '1127865759', 'manual_google', true, 'for-pet-scs'),
(gen_random_uuid(), 'Clinical Pets', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinical-pets-scs'),

-- Diadema
(gen_random_uuid(), 'Pet Shop Dog & Cat', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Taboão', 'Avenida Dom João VI, 986', '11986839413', '11986839413', 'manual_google', true, 'pet-shop-dog-cat-diadema'),
(gen_random_uuid(), 'Clínica Veterinária PetConsulta', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Campanário', 'Atendimento Regional', '11961914824', '1126779727', 'manual_google', true, 'petconsulta-diadema'),
(gen_random_uuid(), 'Cobasi Diadema', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Presidente Kennedy, 480', '11999999999', '1151981557', 'manual_google', true, 'cobasi-diadema'),
(gen_random_uuid(), 'Pet Shop Banho E Tosa (Sylvio Cunha)', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Antonio Sylvio Cunha Bueno, 170', NULL, '1140449131', 'manual_google', true, 'pet-shop-sylvio-cunha-diadema'),

-- Mauá
(gen_random_uuid(), 'Pet Shop Mansueli', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Morelli', 'Atendimento Regional', '11993215036', '11993215036', 'manual_google', true, 'pet-shop-mansueli-maua'),
(gen_random_uuid(), 'Barão Pet Center', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Av. Barão de Mauá, 1109', '11937353584', '11937353584', 'manual_google', true, 'barao-pet-center-maua'),
(gen_random_uuid(), 'Banho E Tosa Love Pet', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Rua Chico Mendes, 70', NULL, '1145145979', 'manual_google', true, 'love-pet-maua'),
(gen_random_uuid(), 'Amor E Pelos', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Avenida Brigadeiro Faria Lima, 44', NULL, '1184474197', 'manual_google', true, 'amor-e-pelos-maua'),
(gen_random_uuid(), 'So Pros Bichos Banho E Tosa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Itapeva', 'Avenida Barão de Mauá, 4652', NULL, '1145111279', 'manual_google', true, 'so-pros-bichos-maua'),
(gen_random_uuid(), 'Lu Pet Estetica Animal', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Rua João Batista Dell Antonia, 365', NULL, '1145415564', 'manual_google', true, 'lu-pet-estetica-maua'),
(gen_random_uuid(), 'Estetica Animal Glamour', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Sonia Maria', 'Rua Francisco Alves, 679', NULL, '1152402238', 'manual_google', true, 'estetica-animal-glamour-maua'),
(gen_random_uuid(), 'Pet Shop Delicato', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Canada', 'Rua Altivo Ovando, 260', NULL, '1145772641', 'manual_google', true, 'pet-shop-delicato-maua'),
(gen_random_uuid(), 'Cãobeleireiro Estetica Animal', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Dos Bandeirantes, 649', NULL, '1123129509', 'manual_google', true, 'caobeleireiro-estetica-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Chic Tosa - Pet Shop', 'banho_tosa', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Suissa', 'Rua Manoel Dias Marcelino, 38', '1195446918', '1195446918', 'manual_google', true, 'chic-tosa-ribeirao-pires'),
(gen_random_uuid(), 'Espaço Pet', 'banho_tosa', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'espaco-pet-ribeirao-pires'),
(gen_random_uuid(), 'Clínica Veterinária Ribeirão Pires', 'banho_tosa', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-veterinaria-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), '4patas Banho e Tosa', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Santa Tereza', 'Av. São João, 68', '11998782389', '11998782389', 'manual_google', true, '4patas-banho-e-tosa-rio-grande-da-serra'),
(gen_random_uuid(), 'Beleza Pet', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Jardim Novo Horizonte', 'Rua Pascoal Maimone Filho, 188', '11995930865', '11995930865', 'manual_google', true, 'beleza-pet-rio-grande-da-serra'),
(gen_random_uuid(), 'Pegasus Hospital Veterinário', 'banho_tosa', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pegasus-hospital-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 68_abc_dog_walker.sql
-- ===========================================
-- Seeds para a categoria Dog Walker no ABC Paulista

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
(gen_random_uuid(), 'Adestradores & Dog Walkers', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', NULL, '1142213948', 'manual_google', true, 'adestradores-dog-walker-santo-andre'),
(gen_random_uuid(), 'Renan Adestrador', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'renan-adestrador-santo-andre'),
(gen_random_uuid(), 'Mallaha Pet Resort', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'mallaha-pet-resort-santo-andre'),
(gen_random_uuid(), 'ABC Dog Adestramento e Passeios', 'dog_walker', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'abc-dog-adestramento-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Doggo Pet Service', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Rua Wadia Jafete Assad, 232', '11999999999', '11999999999', 'manual_google', true, 'doggo-pet-service-sbc'),
(gen_random_uuid(), 'Cia Pet Walker', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cia-pet-walker-sbc'),
(gen_random_uuid(), 'Cão Talento - Dog Walker', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cao-talento-dog-walker-sbc'),
(gen_random_uuid(), 'Pet Sitter Marcela', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-marcela-sbc'),
(gen_random_uuid(), 'Pet Sitter e Dog Walker Renata', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-renata-sbc'),
(gen_random_uuid(), 'Dog Walker Maya', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'dog-walker-maya-sbc'),
(gen_random_uuid(), 'Totó Passeia ABC', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'toto-passeia-abc-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Dog Walker no ABC', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11989082182', '1142241207', 'manual_google', true, 'dog-walker-no-abc-scs'),
(gen_random_uuid(), 'Dog Walker Leo', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'dog-walker-leo-scs'),
(gen_random_uuid(), 'Marcelo Adestrador e Passeador', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'marcelo-adestrador-scs'),
(gen_random_uuid(), 'Sr. Cão', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sr-cao-dog-walker-scs'),
(gen_random_uuid(), 'Walkin''Dog', 'dog_walker', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'walkindog-scs'),

-- Diadema
(gen_random_uuid(), 'May Dog Works', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'may-dog-works-diadema'),
(gen_random_uuid(), 'Cícera A. Passeadora', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cicera-passeadora-diadema'),
(gen_random_uuid(), 'Alyne B. Passeadora', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'alyne-passeadora-diadema'),
(gen_random_uuid(), 'Lucia C. Passeadora', 'dog_walker', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'lucia-passeadora-diadema'),

-- Mauá
(gen_random_uuid(), 'Jeferson Damásio Passeador', 'dog_walker', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'jeferson-damasio-maua'),
(gen_random_uuid(), 'Pet Sitter & Dog Walker Mauá', 'dog_walker', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-dog-walker-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Dog Walker Ribeirão Pires (GetNinjas Central)', 'dog_walker', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'dog-walker-ribeirao-pires'),
(gen_random_uuid(), 'Pet Anjo Parceiros Ribeirão', 'dog_walker', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-anjo-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Pet Sitter Rio Grande da Serra', 'dog_walker', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-sitter-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 69_abc_adestramento.sql
-- ===========================================
-- Seeds para a categoria Adestramento Comportamental no ABC Paulista

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
(gen_random_uuid(), 'Centro Vila AssunCão', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Assunção', 'Atendimento Regional', '11991759020', '11991759020', 'manual_google', true, 'centro-vila-assuncao-santo-andre'),
(gen_random_uuid(), 'Renan Rocha Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'renan-rocha-adestramento-santo-andre'),
(gen_random_uuid(), 'Alecio Neris Adestrador', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'alecio-neris-adestrador-santo-andre'),
(gen_random_uuid(), 'MB Dogs Edução Canina', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Alzira', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'mb-dogs-educacao-canina-santo-andre'),
(gen_random_uuid(), 'Cão Cidadão Santo André (Dr. Pet)', 'adestramento', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Domiciliar', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Adestrador Celso Daniel Miron', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'celso-daniel-miron-sbc'),
(gen_random_uuid(), 'Cão Cidadão SBC', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Domiciliar', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-sbc'),
(gen_random_uuid(), 'Petz SBC (Adestramento Indoor)', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'Rua Garcia Lorca, 301', '1121817359', '1121817359', 'manual_google', true, 'petz-adestramento-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Cão Club Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Olímpico', 'Rua Panati, 19', '11985463049', '1142213948', 'manual_google', true, 'cao-club-adestramento-scs'),
(gen_random_uuid(), 'Creche Hotel Cão a Cão (Comportamental)', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Martim Francisco, 66', '11989082182', '1142241207', 'manual_google', true, 'cao-a-cao-adestramento-scs'),
(gen_random_uuid(), 'Sr. Cão (Fabiano Coelho)', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'sr-cao-fabiano-coelho-scs'),
(gen_random_uuid(), 'Matilha Em Harmonia', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Domiciliar', '11999999999', '11999999999', 'manual_google', true, 'matilha-em-harmonia-scs'),
(gen_random_uuid(), 'Jonathan Normandia Adestrador', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'jonathan-normandia-scs'),
(gen_random_uuid(), 'Ubiratan Rabadan Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'ubiratan-rabadan-adestramento-scs'),

-- Diadema
(gen_random_uuid(), 'PRH Adestramento (36 anos)', 'adestramento', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11937068592', '11937068592', 'manual_google', true, 'prh-adestramento-diadema'),
(gen_random_uuid(), 'Adestramento de Cães RP', 'adestramento', (SELECT id FROM public.cities WHERE slug='diadema'), 'Conceição', 'Rua Modesto Álvares Dias, 71', '11999999999', '11999999999', 'manual_google', true, 'adestramento-caes-rp-diadema'),
(gen_random_uuid(), 'Cattulu Escola de Adestramento', 'adestramento', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua dos Rubis, 187', '11999999999', '11999999999', 'manual_google', true, 'cattulu-escola-adestramento-diadema'),

-- Mauá
(gen_random_uuid(), 'Adestrador Alexandre Luiz', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Jd. Quarto Centenário', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'adestrador-alexandre-luiz-maua'),
(gen_random_uuid(), 'Cão Cidadão Mauá', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-maua'),
(gen_random_uuid(), 'MB Dogs - Polo Mauá', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'mb-dogs-maua'),
(gen_random_uuid(), 'Livia Perez Educação Canina', 'adestramento', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'livia-perez-educacao-canina-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Camila Macêdo Dog Walker e Adestramento Positivo', 'adestramento', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'camila-macedo-adestramento-ribeirao-pires'),
(gen_random_uuid(), 'Cão Cidadão Ribeirão Pires', 'adestramento', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'cao-cidadao-ribeirao-pires'),
(gen_random_uuid(), 'Jeferson Damásio Comportamento Pet', 'adestramento', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'jeferson-damasio-adestramento-ribeirao-pires'),
(gen_random_uuid(), 'Centro de Treinamento Canino Ribeirão', 'adestramento', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'ct-canino-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Adestramento Comportamental Rio Grande', 'adestramento', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'adestramento-rio-grande-da-serra'),
(gen_random_uuid(), 'Educador Canino RGS', 'adestramento', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'educador-canino-rio-grande-da-serra')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 70_abc_creche_hotel_pet.sql
-- ===========================================
-- Seeds para a categoria Creches e Hotéis Pet no ABC Paulista

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
(gen_random_uuid(), 'Mallaha Pet Resort', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Rua Adolfo Bastos, 1184', '11953052202', '1123243612', 'manual_google', true, 'mallaha-pet-resort-santo-andre'),
(gen_random_uuid(), 'DogZone Creche e Hotel', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Alameda São Caetano, 519', '1149901125', '1149901125', 'manual_google', true, 'dogzone-santo-andre'),
(gen_random_uuid(), 'Escola de Pet (Creche e Hospedagem)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Campestre', 'R. Vitória Régia, 62', '11934154177', '11934154177', 'manual_google', true, 'escola-de-pet-santo-andre'),
(gen_random_uuid(), 'DoggFitness Day Care', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santa Maria', 'Alameda São Caetano, 923', '11968387356', '11968387356', 'manual_google', true, 'doggfitness-day-care-santo-andre'),
(gen_random_uuid(), 'Pet Family ABC (Hotel 24h)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-family-abc-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Dog''s Up (Unidade Demarchi)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Demarchi', 'Av. Maria Servidei Demarchi, 1535', '11945566365', '11945566365', 'manual_google', true, 'dogs-up-demarchi-sbc'),
(gen_random_uuid(), 'Dog''s Up (Unidade Jardim do Mar)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Rua Tasman, 114', '11915335402', '11915335402', 'manual_google', true, 'dogs-up-jardim-do-mar-sbc'),
(gen_random_uuid(), 'Resort dos Aumigos', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Paulicéia', 'R. Lapa, 378', '11959008344', '11959008344', 'manual_google', true, 'resort-dos-aumigos-sbc'),
(gen_random_uuid(), 'Oásis Resort Pet', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Nova Petrópolis', 'Alameda Dona Tereza Cristina, 689', '11937071472', '11937071472', 'manual_google', true, 'oasis-resort-pet-sbc'),
(gen_random_uuid(), 'Anjos de Quatro Patas Day Care', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Av. Antártico, 353', '11942464515', '11942464515', 'manual_google', true, 'anjos-quatro-patas-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Pepetos Creche e Hotel', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11955783240', '11955783240', 'manual_google', true, 'pepetos-scs'),
(gen_random_uuid(), 'Creche Hotel Cão a Cão', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Martim Francisco, 66', '11989082182', '1142241207', 'manual_google', true, 'cao-a-cao-scs'),
(gen_random_uuid(), 'Eco Club Pet Shop (Hotel)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Cerâmica', 'Avenida Senador Roberto Simonsen, 1278', '11999999999', '11999999999', 'manual_google', true, 'eco-club-pet-shop-scs'),
(gen_random_uuid(), 'Hotel Frieda', 'creche_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'hotel-frieda-scs'),

-- Diadema
(gen_random_uuid(), 'Canil Antony (Day Care e Hotel)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Presidente Wenceslau, 157', '1140590572', '1140590572', 'manual_google', true, 'canil-antony-diadema'),
(gen_random_uuid(), 'Toca do Coelhinho (Creche Pet)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '1140447645', '1140447645', 'manual_google', true, 'toca-do-coelhinho-diadema'),

-- Mauá
(gen_random_uuid(), 'Animal Park Hotel', 'creche_pet', (SELECT id FROM public.cities WHERE slug='maua'), 'Parque das Americas', 'Rua São Domingos, 152', '11999999999', '11999999999', 'manual_google', true, 'animal-park-hotel-maua'),
(gen_random_uuid(), 'Canil Ohana Gold (Day Care)', 'creche_pet', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11998802826', '11998802826', 'manual_google', true, 'canil-ohana-gold-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Hostel Cão Cidadão DogHero Ribeirão', 'creche_pet', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'doghero-hostel-ribeirao-pires'),
(gen_random_uuid(), 'Pet Anjo Creche e Hospedagem (Polo RP)', 'creche_pet', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Bocaina', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'pet-anjo-creche-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Ohana Pet Resort RGS', 'creche_pet', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11998802826', '11998802826', 'manual_google', true, 'ohana-pet-resort-rgs')

ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 71_abc_veterinaria.sql
-- ===========================================
-- Seeds para a categoria Clínicas Veterinárias no ABC Paulista

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
(gen_random_uuid(), 'Hospital Veterinário Público de Santo André', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Cristiane', 'R. Juquiá, 135', '11972823863', '11915141375', 'manual_google', true, 'hospital-vet-publico-santo-andre'),
(gen_random_uuid(), 'Hospital Veterinário Santa Terezinha', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Santa Teresinha', 'Alameda Vieira de Carvalho, 532', '11974000362', '1149971146', 'manual_google', true, 'hospital-vet-santa-terezinha-santo-andre'),
(gen_random_uuid(), 'Climeve (Clínica Veterinária)', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1144515666', '1144515666', 'manual_google', true, 'climeve-santo-andre'),
(gen_random_uuid(), 'Veterinária Pilar', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Gilda', 'R. Caminho do Pilar, 2451', '11946700166', '1134940344', 'manual_google', true, 'veterinaria-pilar-santo-andre'),
(gen_random_uuid(), 'Clínica Veterinária Paco e Sua Turminha', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11988192753', '1144216467', 'manual_google', true, 'paco-e-sua-turminha-santo-andre'),
(gen_random_uuid(), 'Animus Vet 24h', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Gilda', 'Rua Araguaia, 376', '11939263706', '11939263706', 'manual_google', true, 'animus-vet-santo-andre'),
(gen_random_uuid(), 'Clínica Veterinária Santo André', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Bairro Jardim', 'Rua das Esmeraldas, 378', '11940193990', '11939320960', 'manual_google', true, 'clinica-vet-santo-andre-matriz'),
(gen_random_uuid(), 'Clínica Veterinária Sobre Vidas', 'veterinario', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1144799958', '1144799958', 'manual_google', true, 'sobre-vidas-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Vet Life Centro Veterinário 24h', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11970471100', '1141775526', 'manual_google', true, 'vet-live-sbc'),
(gen_random_uuid(), 'Centro Veterinário Popular (PETPOP)', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Rua Helena Jacquey, 294', '1127584219', '1127584219', 'manual_google', true, 'petpop-sbc'),
(gen_random_uuid(), 'Centro Veterinário Assunção 24h', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Rua Ana Maria Martinez, 180', '11998049555', '1143514281', 'manual_google', true, 'centro-vet-assuncao-sbc'),
(gen_random_uuid(), 'Hospital Veterinário Cão Bernardo', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Municipal, 136', '11940065777', '1149304551', 'manual_google', true, 'hospital-vet-cao-bernardo-sbc'),
(gen_random_uuid(), 'Provet Medicina Veterinária', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'provet-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Oriente Clínica Veterinária', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Barcelona', 'R. Oriente, 941', '11972772255', '1142216880', 'manual_google', true, 'oriente-clinica-vet-scs'),
(gen_random_uuid(), 'Clinical Pets', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Fundação', 'Rua Herculano de Freitas, 417', '11996617999', '1142251378', 'manual_google', true, 'clinical-pets-scs'),
(gen_random_uuid(), 'Hospital Veterinário Universitário São Lázaro', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Pernambuco, 76', '1142235452', '1142235455', 'manual_google', true, 'hospital-vet-sao-lazaro-scs'),
(gen_random_uuid(), 'Petlife São Caetano', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11950289537', '1142251899', 'manual_google', true, 'petlife-sao-caetano-scs'),
(gen_random_uuid(), 'WeVets São Caetano', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '1150438398', '1150438398', 'manual_google', true, 'wevets-sao-caetano-scs'),
(gen_random_uuid(), 'Animale Hospital SCS', 'veterinario', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11946694122', '1145155535', 'manual_google', true, 'animale-hospital-scs'),

-- Diadema
(gen_random_uuid(), 'Only Pet 24h', 'veterinario', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11915583350', '1146775145', 'manual_google', true, 'only-pet-24h-diadema'),
(gen_random_uuid(), 'Hospital Veterinário Rivelles', 'veterinario', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Alda, 384', '11989449077', '1143434126', 'manual_google', true, 'hospital-vet-rivelles-diadema'),
(gen_random_uuid(), 'Hospital Veterinário Diadema 24H', 'veterinario', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Presidente Kennedy, 232', '11968643286', '1143372677', 'manual_google', true, 'hospital-vet-diadema-24h'),
(gen_random_uuid(), 'Medicinal Centro Veterinário', 'veterinario', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Manoel da Nóbrega 218', '11946219944', '1140562222', 'manual_google', true, 'medicinal-centro-vet-diadema'),

-- Mauá
(gen_random_uuid(), 'Clínica Veterinária Animal Mania', 'veterinario', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Haydee', 'Rua Porto Feliz, n° 757', '11955859443', '1123128236', 'manual_google', true, 'clinica-vet-animal-mania-maua'),
(gen_random_uuid(), 'Clinica Veterinária Paraíso', 'veterinario', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Haydee', 'Rua Porto Feliz, 275', '11992584951', '1145131198', 'manual_google', true, 'clinica-vet-paraiso-maua'),
(gen_random_uuid(), 'Clínica Veterinária Cão Guru', 'veterinario', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Assis Brasil', 'R. Lazar Segal, 181', '11953003060', '11953003060', 'manual_google', true, 'clinica-vet-cao-guru-maua'),
(gen_random_uuid(), 'Mauá Saúde Animal', 'veterinario', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Magini', 'R. Santa Helena, 218', '1126299802', '1126299802', 'manual_google', true, 'maua-saude-animal-maua'),
(gen_random_uuid(), 'Clínica Veterinária Andreia Courel', 'veterinario', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Guarani', 'R. Bernardo Moreli, 83', '11998545304', '11998545304', 'manual_google', true, 'clinica-vet-andreia-courel-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Clínica Veterinária Ribeirão Pires', 'veterinario', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Av. Kaethe Richers, 33', '11947103267', '1148283906', 'manual_google', true, 'clinica-vet-ribeirao-pires'),
(gen_random_uuid(), 'Hospital Veterinário Nipon', 'veterinario', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'hospital-vet-nipon-ribeirao-pires'),
(gen_random_uuid(), 'Clinica Veterinária Meraki HealthCare', 'veterinario', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Afonso Zampol, 48', '11999999999', '11999999999', 'manual_google', true, 'meraki-healthcare-ribeirao-pires'),
(gen_random_uuid(), 'Veterinária Central', 'veterinario', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua Miguel Prisco, 510', '1148233082', '1148233082', 'manual_google', true, 'veterinaria-central-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Clínica Veterinária Rio Grande', 'veterinario', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-vet-rio-grande'),
(gen_random_uuid(), 'Veterinária Trevo RGS', 'veterinario', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'veterinaria-trevo-rgs'),
(gen_random_uuid(), 'Veterinária Suelen RGS', 'veterinario', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'veterinaria-suelen-rgs')


ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 72_abc_alimentacao_pet.sql
-- ===========================================
-- Seeds para a categoria Alimentação Natural para Pets no ABC Paulista

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
(gen_random_uuid(), 'Animal Natural Store', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11996100031', '1142245139', 'manual_google', true, 'animal-natural-santo-andre'),
(gen_random_uuid(), 'XIG PET - Comida Natural', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11972462343', '11972462343', 'manual_google', true, 'xig-pet-santo-andre'),
(gen_random_uuid(), 'ZooLab Diagnóstico Veterinário (Nutrição)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Bairro Jardim', 'Rua das Caneleiras, 367', '11999999999', '11999999999', 'manual_google', true, 'zoolab-santo-andre'),
(gen_random_uuid(), 'Natural Jardim Empório e Pet Friendly', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'R. das Monções, 480', '11999999999', '11999999999', 'manual_google', true, 'natural-jardim-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Laboratório Lead (Nutrição Pet)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '1123689263', '1123689263', 'manual_google', true, 'laboratorio-lead-sbc'),
(gen_random_uuid(), 'Mundo Rural Petshop (Unidade Assunção)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Assunção', 'Atendimento Regional', '11972865803', '11972865803', 'manual_google', true, 'mundo-rural-assuncao-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Animal Natural (Sede)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Fundação', 'Avenida do Estado 1540', '11996100031', '1142245139', 'manual_google', true, 'animal-natural-scs'),
(gen_random_uuid(), 'XIG PET São Caetano', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11972462343', '11972462343', 'manual_google', true, 'xig-pet-scs'),

-- Diadema
(gen_random_uuid(), 'Comida de Verdade Pet', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11987399642', '11987399642', 'manual_google', true, 'comida-de-verdade-pet-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Unidade Piraporinha)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Atendimento Regional', '11972865803', '1140661302', 'manual_google', true, 'mundo-rural-piraporinha-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Unidade Serraria)', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Atendimento Regional', '11933512442', '1140696724', 'manual_google', true, 'mundo-rural-serraria-diadema'),

-- Mauá
(gen_random_uuid(), 'Alimentação Natural Pets', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '3138745151', '3138745151', 'manual_google', true, 'alimentacao-natural-pets-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Nino e Pepe (Alimentação Natural e Lowcarb)', 'alimentacao_pet', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11947890276', '11942939541', 'manual_google', true, 'nino-e-pepe-ribeirao-pires'),
(gen_random_uuid(), 'Lucas Soares Delfino (Vet AN)', 'alimentacao_pet', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11963985333', '11963985333', 'manual_google', true, 'lucas-delfino-vet-ribeirao-pires'),
(gen_random_uuid(), 'Pet Go Food', 'alimentacao_pet', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '48991258793', '48991258793', 'manual_google', true, 'pet-go-food-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Nino e Pepe RGS', 'alimentacao_pet', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11947890276', '11942939541', 'manual_google', true, 'nino-e-pepe-rgs')


ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 73_abc_pet_shop.sql
-- ===========================================
-- Seeds para a categoria Pet Shop e Casa de Ração no ABC Paulista

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
(gen_random_uuid(), 'Pet Shop Pedroso', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim Santo André', 'Estr. do Pedroso, 943', '1144517957', '1144517957', 'manual_google', true, 'pet-shop-pedroso-santo-andre'),
(gen_random_uuid(), 'VitalVet ABC Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Almirante Tamandaré, 349', '1144384655', '1144384655', 'manual_google', true, 'vitalvet-abc-pet-shop-santo-andre'),
(gen_random_uuid(), 'Mundo Animal Distribuidora de Ração', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Camilópolis', 'Rua Matilde, 238', '11963168005', '1144614189', 'manual_google', true, 'mundo-animal-distribuidora-santo-andre'),
(gen_random_uuid(), 'Pet Shop Golden Premier', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Rua Almirante Protógenes, 399', '11996190808', '1144275707', 'manual_google', true, 'pet-shop-golden-premier-santo-andre'),
(gen_random_uuid(), 'Petz Avenida dos Estados', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Parque Jaçatuba', 'Av. dos Estados, 6973', '1121817392', '1121817392', 'manual_google', true, 'petz-avenida-estados-santo-andre'),
(gen_random_uuid(), 'Petz Dom Pedro II', 'pet_shop', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Jardim', 'Av. Dom Pedro II, 933', '1121817313', '1121817313', 'manual_google', true, 'petz-dom-pedro-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Casa de Ração Rosa Pet', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim Industrial', 'Rua Edson Queiroz, 99', '1143306948', '1143306948', 'manual_google', true, 'casa-de-racao-rosa-pet-sbc'),
(gen_random_uuid(), 'Cobasi Faria Lima', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Av. Brigadeiro Faria Lima, 1760', '1148532220', '1148532220', 'manual_google', true, 'cobasi-faria-lima-sbc'),
(gen_random_uuid(), 'Cobasi Caminho do Mar', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Rudge Ramos', 'Atendimento Regional', '1143174626', '1143174626', 'manual_google', true, 'cobasi-caminho-do-mar-sbc'),
(gen_random_uuid(), 'Dog''s Up Demarchi', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Demarchi', 'Av. Maria Servidei Demarchi, 1535', '11945566365', '11945566365', 'manual_google', true, 'dogs-up-demarchi-sbc'),
(gen_random_uuid(), 'Dog''s Up Jardim do Mar', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Jardim do Mar', 'Rua Tasman, 114', '11915335402', '11915335402', 'manual_google', true, 'dogs-up-jardim-do-mar-sbc'),
(gen_random_uuid(), 'BR Pet Store', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11911415203', '1127586813', 'manual_google', true, 'br-pet-store-sbc'),
(gen_random_uuid(), 'Cia do Bicho Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Vianas', 'Rua Vianas, 2947', '1141256283', '1141256283', 'manual_google', true, 'cia-do-bicho-sbc'),
(gen_random_uuid(), 'Betpet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua Ernesta Pelosini, 92', '1141247057', '1141247057', 'manual_google', true, 'betpet-shop-sbc'),
(gen_random_uuid(), 'PegPet SBC', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Vianas', 'Av. dos Vianas, 2827', '11933608312', '11933608312', 'manual_google', true, 'pegpet-sbc'),
(gen_random_uuid(), 'Mercadão Pet Pequini', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '1126696724', '1126696724', 'manual_google', true, 'mercadao-pet-pequini-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Pet Speciale', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santo Antônio', 'Avenida Senador Roberto Simonsen, 663', '11996867780', '11996867780', 'manual_google', true, 'pet-speciale-scs'),
(gen_random_uuid(), 'Patas Preciosas Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Barcelona', 'Rua Votorantim, 271', '1129887108', '1129887108', 'manual_google', true, 'patas-preciosas-scs'),
(gen_random_uuid(), 'Pet Shop São José (Santa Paula)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Avenida Pres. Kennedy, 1591', '11976435098', '1141033445', 'manual_google', true, 'pet-shop-sao-jose-santa-paula-scs'),
(gen_random_uuid(), 'Pet Shop São José (Anchieta)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Anchieta', 'Avenida Senador Vergueiro, 3687', '11975073270', '1142267141', 'manual_google', true, 'pet-shop-sao-jose-anchieta-scs'),
(gen_random_uuid(), 'PET & VET São Caetano', 'pet_shop', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Av. Pres. Kennedy, 1480', '1142264910', '1142264910', 'manual_google', true, 'pet-e-vet-scs'),

-- Diadema
(gen_random_uuid(), 'Casa de Ração Nosso Lar', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Leopoldo S, 71', '1140665858', '1140665858', 'manual_google', true, 'casa-de-racao-nosso-lar-diadema'),
(gen_random_uuid(), 'Petz Diadema', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Av. Fábio Eduardo Ramos Esquivel, 1100', '1121817352', '1121817352', 'manual_google', true, 'petz-diadema'),
(gen_random_uuid(), 'Cobasi Diadema', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Presidente Kennedy, 480', '1151981557', '1151981557', 'manual_google', true, 'cobasi-diadema'),
(gen_random_uuid(), 'Pet Shop Xodó', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Av. Lico Maia, 442', '11954218780', '1140554585', 'manual_google', true, 'pet-shop-xodo-diadema'),
(gen_random_uuid(), 'Meu Amigão Cão & Gato', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Graciosa, 528', '11998683636', '1123751912', 'manual_google', true, 'meu-amigao-cao-e-gato-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Piraporinha)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Piraporinha', 'Praça Bom Jesus Piraporinha, 122', '11972865803', '1140661302', 'manual_google', true, 'mundo-rural-piraporinha-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Serraria)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Serraria', 'Av. Dona Ruyce Ferraz Alvim, 1801', '11933512442', '1140696724', 'manual_google', true, 'mundo-rural-serraria-diadema'),
(gen_random_uuid(), 'Mundo Rural Petshop (Centro)', 'pet_shop', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Rua Manoel da Nobrega, 1584', '11945386367', '1140561424', 'manual_google', true, 'mundo-rural-centro-diadema'),

-- Mauá
(gen_random_uuid(), 'Petz Shopping Mauá', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Av. Gov. Mario Covas Júnior, 01', '1121817329', '1121817329', 'manual_google', true, 'petz-shopping-maua'),
(gen_random_uuid(), 'Patativa Pet Shop', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Jardim Zaira', 'Av. Presidente Castelo Branco, 1509', '11947757887', '1145471449', 'manual_google', true, 'patativa-pet-shop-maua'),
(gen_random_uuid(), 'Papa Léguas Agropet', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11956003684', '11956003684', 'manual_google', true, 'papa-leguas-agropet-maua'),
(gen_random_uuid(), 'Pet Shop Patriarca', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145785407', '1145785407', 'manual_google', true, 'pet-shop-patriarca-maua'),
(gen_random_uuid(), 'Mercadão Pet Mauá', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145187115', '1145187115', 'manual_google', true, 'mercadao-pet-maua'),
(gen_random_uuid(), 'Pet Shop e Clínica Anchieta', 'pet_shop', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11975985467', '11975985467', 'manual_google', true, 'pet-shop-anchieta-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Estância Pet Shop', 'pet_shop', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '1148231912', '1148231912', 'manual_google', true, 'estancia-pet-shop-ribeirao-pires'),
(gen_random_uuid(), 'Estância Pet Shop e Casa de Ração', 'pet_shop', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Bocaina', 'Av. Humberto de Campos, 3499', '1148257768', '1148257768', 'manual_google', true, 'estancia-pet-shop-racao-ribeirao-pires'),
(gen_random_uuid(), 'Cão Feliz Pet Shop', 'pet_shop', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'R. Miguel Prisco, 020', '1148277715', '1148277715', 'manual_google', true, 'cao-feliz-pet-shop-ribeirao-pires'),
(gen_random_uuid(), 'Abrantes Magnus Rações', 'pet_shop', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Represa', 'Rod. Índio Tibiriçá, 2103', '1148221118', '1148221118', 'manual_google', true, 'abrantes-magnus-ribeirao-pires'),
(gen_random_uuid(), 'Nipon Petshop Loja I', 'pet_shop', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Santa Luzia', 'Atendimento Regional', '1148276261', '1148276261', 'manual_google', true, 'nipon-petshop-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Casa de Rações Marquinhos', 'pet_shop', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '1148202525', '1148202525', 'manual_google', true, 'casa-racoes-marquinhos-rgs'),
(gen_random_uuid(), 'Bichó Pet Shop RGS', 'pet_shop', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'bicho-pet-shop-rgs')


ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 74_abc_gestao_trafego.sql
-- ===========================================
-- Seeds para a categoria Agências/Gestão de Tráfego Local no ABC Paulista

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
(gen_random_uuid(), 'Vitalino Publicidade', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11948825767', '11913525253', 'manual_google', true, 'vitalino-publicidade-santo-andre'),
(gen_random_uuid(), 'Criativando Publicidade', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'criativando-publicidade-santo-andre'),
(gen_random_uuid(), 'DIVIA Marketing Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1139566312', '1139566312', 'manual_google', true, 'divia-marketing-santo-andre'),
(gen_random_uuid(), 'Go On Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'go-on-digital-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'North Star Growth', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '16997951718', '16997951718', 'manual_google', true, 'north-star-growth-sbc'),
(gen_random_uuid(), 'RGB Comunicação', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11969095513', '11969095513', 'manual_google', true, 'rgb-comunicacao-sbc'),
(gen_random_uuid(), 'Talos Agência de Tráfego', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'talos-agencia-sbc'),
(gen_random_uuid(), 'Digitall Evolution', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'digitall-evolution-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'MediaTosi Agência de Marketing', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11948119627', '11948119627', 'manual_google', true, 'mediatosi-scs'),
(gen_random_uuid(), 'Goognet Solução Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'goognet-solucao-digital-scs'),
(gen_random_uuid(), 'UGAH! Comunicação', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'CEP: 09531-080', '11999999999', '11999999999', 'manual_google', true, 'ugah-comunicacao-scs'),
(gen_random_uuid(), 'Marke Marketing Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'marke-marketing-scs'),

-- Diadema
(gen_random_uuid(), 'Ação Águia Brasil', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'acao-aguia-brasil-diadema'),
(gen_random_uuid(), 'Agencia 4UP', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'agencia-4up-diadema'),
(gen_random_uuid(), 'ClickPro Marketing', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Avenida Alda', '11955939389', '11955939389', 'manual_google', true, 'clickpro-marketing-diadema'),

-- Mauá
(gen_random_uuid(), 'Mazzini Marketing', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Rua Campos Sales', '11999999999', '11999999999', 'manual_google', true, 'mazzini-marketing-maua'),
(gen_random_uuid(), 'Agência GWP', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Nossa Senhora das Vitórias', 'Rua Miguel Elías', '11999999999', '11999999999', 'manual_google', true, 'agencia-gwp-maua'),
(gen_random_uuid(), 'Capta Marketing Digital', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '5133769410', '5133769410', 'manual_google', true, 'capta-marketing-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Connect Web Marketing', 'gestao_trafego', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'connect-web-marketing-ribeirao-pires'),
(gen_random_uuid(), 'Agência Wert', 'gestao_trafego', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'agencia-wert-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Click Tráfego', 'gestao_trafego', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11948056385', '11948056385', 'manual_google', true, 'click-trafego-rgs')


ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 75_abc_escolas_idiomas.sql
-- ===========================================
-- Seeds para a categoria Escolas de Idiomas no ABC Paulista

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
(gen_random_uuid(), 'Top English Santo André', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '11977897160', '11977897160', 'manual_google', true, 'top-english-santo-andre'),
(gen_random_uuid(), 'Escola Liverpool', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Centro', 'Atendimento Regional', '1149905026', '1149905026', 'manual_google', true, 'escola-liverpool-santo-andre'),
(gen_random_uuid(), 'Wizard Santo André Vila Bastos', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Vila Bastos', 'Atendimento Regional', '11940053574', '1149921111', 'manual_google', true, 'wizard-vila-bastos-santo-andre'),
(gen_random_uuid(), 'Berlitz Santo André', 'idiomas', (SELECT id FROM public.cities WHERE slug='santo-andre'), 'Bairro Jardim', 'Av. Dom Pedro II, 1067', '1144322300', '1140034764', 'manual_google', true, 'berlitz-santo-andre'),

-- São Bernardo do Campo
(gen_random_uuid(), 'Fourflags Language Center', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Centro', 'Rua João Pessoa, 600', '11989121313', '1143350909', 'manual_google', true, 'fourflags-language-center-sbc'),
(gen_random_uuid(), 'YÁZIGI SBC CENTRO', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Alvaro Marques', 'Rua Bela Vista, 65', '11944525957', '11944525957', 'manual_google', true, 'yazigi-centro-sbc'),
(gen_random_uuid(), 'Alt Idiomas', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Bairro Assunção', 'Avenida José Odorizzi, 2188', '11957160019', '1143924511', 'manual_google', true, 'alt-idiomas-sbc'),
(gen_random_uuid(), 'Wizard São Bernardo Assunção', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), 'Vila Rica', 'Rua Ouro Preto, 12', '11941375601', '11941375601', 'manual_google', true, 'wizard-assuncao-sbc'),

-- São Caetano do Sul
(gen_random_uuid(), 'Rockfeller São Caetano do Sul', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Santa Paula', 'Rua Tiradentes, 407', '1142337673', '1142337673', 'manual_google', true, 'rockfeller-scs'),
(gen_random_uuid(), 'Positive Idiomas', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Rua Rio de Janeiro, 1113', '11973571703', '11981117582', 'manual_google', true, 'positive-idiomas-scs'),
(gen_random_uuid(), 'New London', 'idiomas', (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), 'Centro', 'Atendimento Regional', '11973570481', '11973570481', 'manual_google', true, 'new-london-scs'),

-- Diadema
(gen_random_uuid(), 'Wizard Diadema Centro', 'idiomas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Centro', 'Atendimento Regional', '11972782430', '1140431344', 'manual_google', true, 'wizard-centro-diadema'),
(gen_random_uuid(), 'SESI Diadema Idiomas', 'idiomas', (SELECT id FROM public.cities WHERE slug='diadema'), 'Taboão', 'Rua Porto Príncipe, 117-B', '1140773550', '1140927920', 'manual_google', true, 'sesi-idiomas-diadema'),

-- Mauá
(gen_random_uuid(), 'Wizard Mauá Vila Bocaina', 'idiomas', (SELECT id FROM public.cities WHERE slug='maua'), 'Vila Bocaina', 'Atendimento Regional', '1145443333', '1145443333', 'manual_google', true, 'wizard-vila-bocaina-maua'),
(gen_random_uuid(), 'inFlux Mauá', 'idiomas', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '11913555774', '1145182232', 'manual_google', true, 'influx-maua'),
(gen_random_uuid(), 'CNA Mauá', 'idiomas', (SELECT id FROM public.cities WHERE slug='maua'), 'Centro', 'Atendimento Regional', '1145197911', '1145197911', 'manual_google', true, 'cna-maua'),

-- Ribeirão Pires
(gen_random_uuid(), 'Wizard Ribeirão Pires', 'idiomas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Avenida Fortuna, 336', '1148234088', '1148234088', 'manual_google', true, 'wizard-ribeirao-pires'),
(gen_random_uuid(), 'Microlins Ribeirão Pires', 'idiomas', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Rua do Comércio, 115a', '11940559028', '1148231715', 'manual_google', true, 'microlins-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Microlins Rio Grande da Serra', 'idiomas', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Vila Figueiredo', 'Rua Agostinho Cardoso, 125', '1144786048', '1144786048', 'manual_google', true, 'microlins-rgs')


ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 76_abc_cursos_profissionalizantes.sql
-- ===========================================
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
(gen_random_uuid(), 'Etec Profª Maria Cristina Medeiros', 'cursos_profissionalizantes', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '1148254470', 'manual_google', true, 'etec-ribeirao-pires'),
(gen_random_uuid(), 'Procapacitar Ribeirão Pires', 'cursos_profissionalizantes', '1f84b6c7-69e8-49c6-a691-30da5246e0ea', 'Centro', 'Atendimento Regional', '11999999999', '4936223071', 'manual_google', true, 'procapacitar-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Etec Rio Grande da Serra', 'cursos_profissionalizantes', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '1148268325', 'manual_google', true, 'etec-rgs')


ON CONFLICT (slug) DO UPDATE SET
  city_id = EXCLUDED.city_id,
  category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 77_abc_aulas_particulares.sql
-- ===========================================
-- Seed: Aulas Particulares / Reforço Escolar - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Kumon - Santo André (Vila Bastos)', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Bastos', 'Rua Haddock Lobo, 269', '1149924421', '1149904421', null, 'manual_google', true, '2026-03-06T12:00:00', 'kumon-santo-andre-vila-bastos', 'aulas_particulares', 'https://kumon.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Ponto do Estudante - Reforço Escolar', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Bairro Jardim', 'Rua das Palmeiras, 465', '11942416000', '1144362244', null, 'manual_google', true, '2026-03-06T12:00:00', 'ponto-do-estudante-reforco-escolar', 'aulas_particulares', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Meta Aulas de Reforço - Unidade ABC', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Rua Américo Brasiliense, 615', '11988556677', '1143301234', 'contato@metaaulas.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'meta-aulas-reforco-sbc', 'aulas_particulares', 'http://metaaulas.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Quantum Soluções Acadêmicas', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Assunção', 'Rua Teresina Capitaneo Fantinati, 458', '11966394946', '11966394946', 'contato@quantumacademicas.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'quantum-solucoes-academicas-sbc', 'aulas_particulares', 'http://quantumacademicas.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Kumon - SBC (Caminho do Mar)', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Vila Caminho do Mar', 'Av. Caminho do Mar, 2125', '1143685511', '1143685511', null, 'manual_google', true, '2026-03-06T12:00:00', 'kumon-sbc-caminho-do-mar', 'aulas_particulares', 'https://kumon.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Ensina Mais - SBC Centro', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Rua Santa Maria, 281', '11993442211', '1141253322', null, 'manual_google', true, '2026-03-06T12:00:00', 'ensina-mais-sbc-centro', 'aulas_particulares', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'O Ponto do Estudante - SCS', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Barcelona', 'Rua Joana Angélica, 310', '11971715566', '1142261122', null, 'manual_google', true, '2026-03-06T12:00:00', 'ponto-do-estudante-scs', 'aulas_particulares', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Kumon - SCS Barcelona', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Barcelona', 'Rua Tapajós, 517', '11995440094', '1142660706', null, 'manual_google', true, '2026-03-06T12:00:00', 'kumon-scs-barcelona', 'aulas_particulares', 'https://kumon.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Meta Aulas de Reforço - SCS', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Paula', 'Rua Osvaldo Cruz, 562', '11943142988', '1142275655', null, 'manual_google', true, '2026-03-06T12:00:00', 'meta-aulas-reforco-scs', 'aulas_particulares', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Reforço Escolar Diadema | Descola', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Av. Alda, 1166', '11986049996', '11986049996', null, 'manual_google', true, '2026-03-06T12:00:00', 'reforco-escolar-diadema-descola', 'aulas_particulares', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Aliança Acompanhamento Pedagógico', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua dos Marimbas, 149', '1155600802', '1155600802', null, 'manual_google', true, '2026-03-06T12:00:00', 'alianca-acompanhamento-pedagogico-diadema', 'aulas_particulares', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Kumon - Diadema Centro', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua Amélia Eugênia, 281', '1140562233', '1140562233', null, 'manual_google', true, '2026-03-06T12:00:00', 'kumon-diadema-centro', 'aulas_particulares', 'https://kumon.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Reforço Escolar Vila Falchi Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Vila Falchi', 'Rua Serafim Lopes, 150', '11989435388', '11989435388', null, 'manual_google', true, '2026-03-06T12:00:00', 'reforco-escolar-vila-falchi-maua', 'aulas_particulares', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Kumon - Mauá Centro', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Praça Vinte e Dois de Novembro, 169', '1145136677', '1145136677', null, (SELECT id FROM public.cities WHERE slug='maua'), true, '2026-03-06T12:00:00', 'kumon-maua-centro', 'aulas_particulares', 'https://kumon.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Ensina Mais - Ribeirão Pires', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua Afrânio Peixoto, 12', '1148231122', '1148231122', null, 'manual_google', true, '2026-03-06T12:00:00', 'ensina-mais-ribeirao-pires', 'aulas_particulares', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Kumon - Ribeirão Pires', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua Stella Bruna Cecchi Nardelli, 161', '1148283344', '1148283344', null, 'manual_google', true, '2026-03-06T12:00:00', 'kumon-ribeirao-pires', 'aulas_particulares', 'https://kumon.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Aulas de Reforço e Apoio - Rio Grande da Serra', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Vila Figueiredo', 'Rua Prefeito José Maria de Figueiredo, 50', '11977665544', '11977665544', null, 'manual_google', true, '2026-03-06T12:00:00', 'aulas-reforco-rio-grande-da-serra', 'aulas_particulares', null, 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 78_abc_mentorias.sql
-- ===========================================
-- Seed: Mentorias de Carreira/Tecnologia - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Febracis Coaching - Santo André', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Bairro Jardim', 'Rua das Figueiras, 1145', '11940053155', '1121991600', 'santoandre@febracis.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'febracis-coaching-santo-andre', 'mentorias_carreira', 'https://febracis.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'ACISA - Mentoria e NJE', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Avenida XV de Novembro, 442', '1121991620', '1121991600', 'falecom@acisa.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'acisa-santo-andre-mentoria', 'mentorias_carreira', 'https://acisa.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Mentoris Consultoria e Alavancagem', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Rua Bernardino de Campos, 155', '11940272691', '11940272691', 'contato@mentorisconsultoria.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'mentoris-consultoria-santo-andre', 'mentorias_carreira', 'http://mentorisconsultoria.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'ACISBEC - Mentoria Projetando o Futuro', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Rua do Imperador, 14', '11976652257', '1121314800', 'acisbec@acisbec.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'acisbec-sbc-mentoria', 'mentorias_carreira', 'https://acisbec.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Gestaum Lab - Inovação e Mentoria', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Anchieta', 'Rua José Versolato, 111', '11987471608', '11987471608', 'contato@gestaumlab.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'gestaum-lab-sbc', 'mentorias_carreira', 'http://gestaumlab.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Simone Ávila Mentoria e Coaching', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Paula', 'Rua General Osório, 145', '11999698489', '11999698489', 'contato@simoneavila.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'simone-avila-scs-mentoria', 'mentorias_carreira', 'http://simoneavila.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'DePraxe RH - Orientação e Carreira', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua das Turmalinas, 34', '11962751837', '11962751837', 'depraxerh@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'depraxe-rh-diadema', 'mentorias_carreira', 'http://depraxerh.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'SODIPROM - Orientação Profissional', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua Oriente Monti, 131', '11918478156', '1140541727', 'sodiprom@sodiprom.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'sodiprom-diadema', 'mentorias_carreira', 'http://sodiprom.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Qualifica Mauá - Mentoria de Carreira', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Matriz', 'Rua Jundiaí, 63', '11920023429', '11920023429', 'qualifica@maua.sp.gov.br', 'manual_google', true, '2026-03-06T12:00:00', 'qualifica-maua-mentoria', 'mentorias_carreira', 'https://maua.sp.gov.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Epicus Consultoria e Mentoria', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Avenida Fortuna, 98', '11943374508', '11943374508', 'contato@epicus.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'epicus-consultoria-ribeirao-pires', 'mentorias_carreira', 'http://epicusconsultoria.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Polo & Paula Assessoria e Mentoria', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Rua Lidia Pollone, 18', '1148201307', '1148201307', 'contato@poloepaula.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'polo-paula-rgs-assessoria', 'mentorias_carreira', 'http://poloepaula.com.br', 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 79_abc_decoracao_festas.sql
-- ===========================================
-- Seed: Decoração de Festas - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Jaci Decoração e Buffet', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Rua Santo Ivo, 36', '11967098953', '1144769180', null, 'manual_google', true, '2026-03-06T12:00:00', 'jaci-decoracao-buffet-santo-andre', 'decoracao_festas', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Buffet Mundo das Festas', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Santo André', '1134394565', '1134394565', null, 'manual_google', true, '2026-03-06T12:00:00', 'buffet-mundo-das-festas-santo-andre', 'decoracao_festas', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Chloé Decor Pegue e Monte', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Jardim Bela Vista', 'Rua Doutor Eduardo Monteiro, 311', '11998201889', '11998201889', null, 'manual_google', true, '2026-03-06T12:00:00', 'chloe-decor-santo-andre', 'decoracao_festas', 'http://vipzinho.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'James Eventos', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento SBC', '1193175621', '1141274118', null, 'manual_google', true, '2026-03-06T12:00:00', 'james-eventos-sbc', 'decoracao_festas', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Nanda Decoração de Festas', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento SBC', '1143631929', '1143631929', null, 'manual_google', true, '2026-03-06T12:00:00', 'nanda-decoracao-sbc', 'decoracao_festas', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Abalah Eventos e Decorações', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento SBC', '1123740421', '1123740421', null, 'manual_google', true, '2026-03-06T12:00:00', 'abalah-eventos-sbc', 'decoracao_festas', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Lola Flores Decorações', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Paula', 'Alameda São Caetano, 624', '11995870203', '1123796264', null, 'manual_google', true, '2026-03-06T12:00:00', 'lola-flores-scs', 'decoracao_festas', 'http://lolaflores.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Vila Balões Decorações', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Atendimento SCS', '1142202815', '1142202815', null, 'manual_google', true, '2026-03-06T12:00:00', 'vila-baloes-scs', 'decoracao_festas', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Cook Hall Buffet & Decoração', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Cerâmica', 'Rua Major Carlo del Prete, 2222', '11995870203', '1123796264', null, 'manual_google', true, '2026-03-06T12:00:00', 'cook-hall-scs-decor', 'decoracao_festas', 'http://cookhallbuffet.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Fadson Festas e Decoração', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua Santo Ivo, 36', '1140664332', '1140664332', null, 'manual_google', true, '2026-03-06T12:00:00', 'fadson-festas-diadema-decor', 'decoracao_festas', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Arte em Foto e Festas', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Atendimento Diadema', '11971483447', '1128979544', null, 'manual_google', true, '2026-03-06T12:00:00', 'arte-foto-festas-diadema', 'decoracao_festas', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Fernanda Vilela Decorações', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Atendimento Mauá', '11982843922', '11982843922', null, 'manual_google', true, '2026-03-06T12:00:00', 'fernanda-vilela-maua-decor', 'decoracao_festas', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Arte e Festa Decorações Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Atendimento Mauá', '1123757911', '1123757911', null, 'manual_google', true, '2026-03-06T12:00:00', 'arte-e-festa-maua-decor', 'decoracao_festas', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Espaço Celebrare Decoração', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento RGS', '11995360900', '11995360900', 'atendimento@buffetbrunetto.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'celebrare-decoracao-rgs', 'decoracao_festas', 'http://eventoscelebrare.com.br', 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Serrana Decorações', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento RGS', '11985368512', '11985368512', null, 'manual_google', true, '2026-03-06T12:00:00', 'serrana-decor-rgs', 'decoracao_festas', null, 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Day Decora Festas Infantis', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro Alto', 'Rua Antonio da Costa Luciano, 134', '11999454953', '11999454953', null, 'manual_google', true, '2026-03-06T12:00:00', 'day-decora-ribeirao-pires-kids', 'decoracao_festas', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Conceição Buffet e Decoração', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Atendimento Ribeirão Pires', '11985368512', '11985368512', null, 'manual_google', true, '2026-03-06T12:00:00', 'conceicao-buffet-ribeirao-pires', 'decoracao_festas', null, 'ribeirao-pires', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 80_abc_buffet_eventos.sql
-- ===========================================
-- Seed: Buffet e espaço para festas e eventos - ABC Paulista (EXPANDIDO)
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'KidBeeruta Buffet', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Campestre', 'Rua das Figueiras, 1501', '1144384232', '1144384232', null, 'manual_google', true, '2026-03-06T12:00:00', 'kidbeeruta-buffet-santo-andre', 'buffet', 'http://www.kidbeeruta.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Toca do Leão Buffet', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Alzira', 'Rua Carijós, 161', '11947017350', '1144323413', null, 'manual_google', true, '2026-03-06T12:00:00', 'toca-do-leao-santo-andre', 'buffet', 'https://tocadoleaobuffet.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Safari Adventure Buffet', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Gilda', 'Av. Higienópolis, 400', '1144369480', '1144369480', null, 'manual_google', true, '2026-03-06T12:00:00', 'safari-adventure-santo-andre', 'buffet', 'https://www.safariadventure.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Grande Ville Buffet', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Campestre', 'Av. Dom Pedro II, 3094', '1149913170', '1149913170', null, 'manual_google', true, '2026-03-06T12:00:00', 'grande-ville-santo-andre', 'buffet', 'http://www.grandevillebuffet.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Pepe''s Park Buffet Infantil', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Planalto', 'Av. Dom Jaime de Barros Câmara, 750', '1123817251', '1123817251', null, 'manual_google', true, '2026-03-06T12:00:00', 'pepes-park-sbc', 'buffet', 'https://pepespark.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Buffet Fantasy', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Rudge Ramos', 'Av. Winston Churchill, 1198', '11992195250', '11992195250', 'contato@buffetfantasy.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'buffet-fantasy-sbc', 'buffet', 'http://buffetfantasy.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Mareka Kids Buffet', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Jardim do Mar', 'R. Caraíbas, 169', '1128332419', '1128332419', null, 'manual_google', true, '2026-03-06T12:00:00', 'mareka-kids-sbc', 'buffet', 'https://www.mareka.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Showtime Kids', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'R. Maj. Carlos Del Prete, 1000', '11945375157', '1142297700', 'contato@showtimekids.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'showtime-kids-scs', 'buffet', 'http://showtimekids.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Buffet 7 Mares', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Barcelona', 'Estrada das Lágrimas, 1840', '1135657532', '1135657532', null, 'manual_google', true, '2026-03-06T12:00:00', 'buffet-7-mares-scs', 'buffet', 'http://buffet7mares.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Buffet Adventree', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Jardim São Caetano', 'Rua Justino Paixão, 45', '1142387000', '1142387000', null, 'manual_google', true, '2026-03-06T12:00:00', 'adventree-buffet-scs', 'buffet', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Explosão Festas', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua São Francisco de Assis, 385', '1134538223', '1134538223', null, 'manual_google', true, '2026-03-06T12:00:00', 'explosao-festas-diadema', 'buffet', 'http://www.explosaofestas.com', 'diadema', 'SP', null),
(gen_random_uuid(), 'Primazzia Eventos', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Atendimento Diadema', '11916121978', '11992061392', 'marcelo.sguerri@hotmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'primazzia-eventos-diadema', 'buffet', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Buffet Mó Legal', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Matriz', 'Av. Cap. João, 2472', '1145447554', '1145447554', null, 'manual_google', true, '2026-03-06T12:00:00', 'buffet-mo-legal-maua', 'buffet', 'http://www.buffetmolegal.com', 'maua', 'SP', null),
(gen_random_uuid(), 'Buffet Amor Eterno', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Vila Bocaina', 'Rua Japão, 200', '1145112121', '1145112121', null, 'manual_google', true, '2026-03-06T12:00:00', 'buffet-amor-eterno-maua', 'buffet', 'http://www.buffetamoreterno.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Requinte Luiz Buffet', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua Maria Emília, 101', '11940146468', '1148276991', 'contato@requinteluizbuffet.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'requinte-luiz-buffet-ribeirao-pires', 'buffet', 'http://requinteluizbuffet.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Chácara Rosa com Pimenta', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Ouro Fino', 'Rua João Batista de Campos, 143', '11949807166', '1148222052', 'contato@chacararosacompimenta.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'rosa-com-pimenta-ribeirao-pires', 'buffet', 'http://chacararosacompimenta.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Sem Igual Eventos', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Represa', 'Avenida Palmira, 90', '11919848282', '11919848282', null, 'manual_google', true, '2026-03-06T12:00:00', 'sem-igual-eventos-ribeirao-pires', 'buffet', 'http://semigualeventos.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Buffet Nova Era', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento Regional', '11985368512', '11985368512', 'buffetnovaera@outlook.com', 'manual_google', true, '2026-03-06T12:00:00', 'buffet-nova-era-rgs', 'buffet', 'http://buffetnovaera.com.br', 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Buffet Kid Mania', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Nova Petrópolis', 'Av. Imperador Pedro II, 753', '1125349927', '1125349927', null, 'manual_google', true, '2026-03-06T12:00:00', 'kid-mania-sbc', 'buffet', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Cook Hall Buffet', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Atendimento ABC', '11995870203', '1123796264', 'vendas@cookhallbuffet.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'cook-hall-buffet-abc', 'buffet', 'http://cookhallbuffet.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Espaço CasAventura', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento SBC', '11979908004', '1123748234', null, 'manual_google', true, '2026-03-06T12:00:00', 'casa-aventura-sbc', 'buffet', 'http://espacocasaventura.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Buffet Kids Toys', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Taboão', 'Avenida das Nações, 31', '1176898094', '1176898094', null, 'manual_google', true, '2026-03-06T12:00:00', 'kids-toys-diadema', 'buffet', 'http://www.kidstoys.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Buffet Briandi', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Matriz', 'Avenida da Saudade, 62', '1145550949', '1145550949', null, 'manual_google', true, '2026-03-06T12:00:00', 'buffet-briandi-maua', 'buffet', null, 'maua', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 81_abc_recreacao.sql
-- ===========================================
-- Seed: Recreação (Recreadores, Personagens Vivos, Animação) - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Tio Melancia & Cia Recreação', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Paraíso', 'Atendimento Regional ABC', '11993847389', '11993847389', 'contato@tiomelancia.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'tio-melancia-recreacao-santo-andre', '', 'http://tiomelancia.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'KING Entretenimentos', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Santo André', '11917076784', '11917076784', 'comercial@entretenimentosking.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'king-entretenimentos-santo-andre', 'recreacao', 'http://entretenimentosking.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Quintal Corre Cotia', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Paraíso', 'R. Juazeiro, 52', '11964099152', '11964099152', null, 'manual_google', true, '2026-03-06T12:00:00', 'quintal-corre-cotia-santo-andre', 'recreacao', 'http://quintalcorrecotia.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Blitz Cosplay & Personagens', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Bastos', 'Atendimento Regional', '11986683800', '11986683800', null, 'manual_google', true, '2026-03-06T12:00:00', 'blitz-cosplay-santo-andre', 'recreacao', 'http://blitzcosplay.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Fê e Fla Animação', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento SBC', '11988975909', '11988975909', null, 'manual_google', true, '2026-03-06T12:00:00', 'fe-e-fla-animacao-sbc', 'recreacao', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Adventure Entretenimentos', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Rudge Ramos', 'Atendimento SBC', '11940414933', '1143631929', null, 'manual_google', true, '2026-03-06T12:00:00', 'adventure-entretenimentos-sbc', 'recreacao', 'http://www.adventureeventos.eev.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Palhaço Tropeço', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Taboão', 'Atendimento SBC', '11950405009', '1141731176', null, 'manual_google', true, '2026-03-06T12:00:00', 'palhaco-tropeco-sbc', 'recreacao', 'http://www.palhacotropeco.eev.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Fábulas & Contos Personagens', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento Regional', '11990043533', '11990043533', null, 'manual_google', true, '2026-03-06T12:00:00', 'fabulas-e-contos-sbc', 'recreacao', 'http://www.fabulasecontospersonagens.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Espaço Sonho Dourado Recreação', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Maria', 'Rua Ivaí, 426', '11942429242', '11942429242', null, 'manual_google', true, '2026-03-06T12:00:00', 'sonho-dourado-recreacao-scs', 'recreacao', 'http://espacosonhodourado.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Patuska Brincadeiras', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Barcelona', 'Atendimento São Caetano', '11995870203', '11995870203', 'contato@patuskabrincadeiras.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'patuska-brincadeiras-scs', 'recreacao', 'http://patuskabrincadeiras.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Além do Arco Íris Recreação', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Vila Nogueira', 'Rua Sebastião Fernandes Tourinho, 257', '11959024971', '11959024971', 'secretariaalemdoarcoiris@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'alem-do-arco-iris-diadema', 'recreacao', 'http://alemdoarcoiris.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Hora de Brincar Recreação', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Jardim Takeby', 'Rua Yagamata, 163', '1140710597', '1140710597', 'soromaria@hotmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'hora-de-brincar-diadema', 'recreacao', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Recanto da Arte (Animação)', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Regional', '11987663741', '1132075767', null, 'manual_google', true, '2026-03-06T12:00:00', 'recanto-da-arte-animacao-abc', 'recreacao', 'http://recantodaarteshows.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'UPALÊLÊ Brinquedos', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Matriz', 'Atendimento Mauá', '11941481725', '11941481725', null, 'manual_google', true, '2026-03-06T12:00:00', 'upalele-brinquedos-maua', 'recreacao', 'http://upalelebrinquedosefestas.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Tio Ivan Personagens', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Jardim Sonia Maria', 'R. Zéquinha de Abreu, 620', '11988870117', '11988870117', null, 'manual_google', true, '2026-03-06T12:00:00', 'tio-ivan-personagens-maua', 'recreacao', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Buffet Mundo Magia Recreação', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Atendimento Ribeirão Pires', '11993847389', '11993847389', null, 'manual_google', true, '2026-03-06T12:00:00', 'mundo-magia-recreacao-ribeirao-pires', 'recreacao', 'http://buffetmundomagia.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Batuta Brasil Entretenimento', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Bocaina', 'Atendimento Regional', '11919848282', '11919848282', null, 'manual_google', true, '2026-03-06T12:00:00', 'batuta-brasil-ribeirao-pires', 'recreacao', 'http://batutabrasil.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Malucolândia Recreação', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento Regional', '11959006935', '11959006935', 'contante@malucolandia.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'malucolandia-rgs', 'recreacao', 'http://malucolandia.com.br', 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Joie Festas Criativas', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Atendimento Ribeirão', '11985368512', '11985368512', null, 'manual_google', true, '2026-03-06T12:00:00', 'joie-festas-ribeirao', 'recreacao', 'http://joiefestas.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Alive Festas Personagens', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Jardim', 'Atendimento Regional ABC', '11964590602', '11964590602', null, 'manual_google', true, '2026-03-06T12:00:00', 'alive-festas-personagens-abc', 'recreacao', 'http://www.personagensvivosbrasil.com.br', 'santo-andre', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 82_abc_aluguel_equipamentos_festas.sql
-- ===========================================
-- Seed: Aluguel de Equipamentos para festas - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Rental Festa', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Bairro Jardim', 'Avenida Dom Pedro II, 1874', '1144282060', '1144282060', null, 'manual_google', true, '2026-03-06T12:00:00', 'rental-festa-santo-andre', 'aluguel_equipamentos', 'http://www.rentalfesta.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'SI BRASIL RENTAL STORE', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Santo André', '11930011053', '11930011053', 'lojasibrasil@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'si-brasil-rental-store-santo-andre', 'aluguel_equipamentos', 'http://sibrasilloja.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Festa Shop ABC', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Assunção', 'Rua Visconde de Mauá, 686', '11997848736', '1144231115', null, 'manual_google', true, '2026-03-06T12:00:00', 'festa-shop-abc-santo-andre', 'aluguel_equipamentos', 'http://festashopabc.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Jr Padoveze Locações', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Campestre', 'Rua dos Coqueiros, 175', '11975521516', '1144210279', null, 'manual_google', true, '2026-03-06T12:00:00', 'jr-padoveze-locacoes-santo-andre', 'aluguel_equipamentos', 'http://jrpadoveze.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'DM Locações de Som e Luz', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Regional', '11991381848', '1128092612', 'henrique@bandadm.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'dm-locacoes-santo-andre', 'aluguel_equipamentos', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Sabor e Festa Locações', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Vila Santa Luzia', 'Avenida Dom Pedro Alcântara, 381', '1141275155', '1141275155', null, 'manual_google', true, '2026-03-06T12:00:00', 'sabor-e-festa-locacoes-sbc', 'aluguel_equipamentos', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Catavento Locações para Festas', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Assunção', 'Rua Amaro Genari, 299', '11976377749', '1143680480', null, 'manual_google', true, '2026-03-06T12:00:00', 'catavento-locacoes-sbc', 'aluguel_equipamentos', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Maranata Festas e Locações', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento SBC', '1142353632', '1142353632', null, 'manual_google', true, '2026-03-06T12:00:00', 'maranata-festas-sbc', 'aluguel_equipamentos', 'http://maranatafestas.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Monteiro Locação de Mesas', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Rudge Ramos', 'Av. Vivaldi, 166', '11976377749', '1143680480', null, 'manual_google', true, '2026-03-06T12:00:00', 'monteiro-locacao-sbc', 'aluguel_equipamentos', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Marcante Festas São Caetano', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Maria', 'Rua Ivaí, 426', '11975661727', '11975661727', 'contato@marcantefestas.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'marcante-festas-scs', 'aluguel_equipamentos', 'http://marcantefestas.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Osmar Locações e Eventos', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santo Antônio', 'Av. Senador Roberto Simonsen, 871', '1142273865', '1142273865', null, 'manual_google', true, '2026-03-06T12:00:00', 'osmar-locacoes-scs', 'aluguel_equipamentos', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'HH Eventos Mega Tendas', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Atendimento Regional', '11910206664', '11910206664', 'contato@hheventos.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'hh-eventos-scs', 'aluguel_equipamentos', 'http://hheventos.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Xd Locações Diadema', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Atendimento Diadema', '11983971081', '1140441497', 'xd.locacoes@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'xd-locacoes-diadema', 'aluguel_equipamentos', 'http://xdlocacoes.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Apbrinquedos Locações', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Piraporinha', 'Travessa Cinco de Maio, 8', '1181050815', '1181050815', null, 'manual_google', true, '2026-03-06T12:00:00', 'apbrinquedos-diadema', 'aluguel_equipamentos', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Cristal Locações e Festas', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Taboão', 'Atendimento Regional', '11940577369', '1134187477', 'lisboa1304@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'cristal-locacoes-diadema', 'aluguel_equipamentos', 'http://cristallocacaoefestas.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Imperial Decorações Diadema', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Vila Nogueira', 'Rua Felipe dos Santos, 303', '11987021561', '11987011561', 'contato.imperialdecoracoes@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'imperial-decoracoes-diadema', 'aluguel_equipamentos', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Arte e Festa Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Rua Luís Mariani, 22', '1123757911', '1123757911', null, 'manual_google', true, '2026-03-06T12:00:00', 'arte-e-festa-maua', 'aluguel_equipamentos', null, 'maua', 'SP', null),
(gen_random_uuid(), 'UpaLêlê Locação Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Vila Bocaina', 'Rua Brás Cubas, 441 A', '11941481725', '11941481725', null, 'manual_google', true, '2026-03-06T12:00:00', 'upalele-locacao-maua', 'aluguel_equipamentos', 'http://upalelebrinquedosefestas.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'G & G Aluguel de Brinquedos', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Parque das Américas', 'Av. Brasil 289', '11961897570', '1145411683', null, 'manual_google', true, '2026-03-06T12:00:00', 'g-and-g-brinquedos-maua', 'aluguel_equipamentos', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Dimatoso Festas Ribeirão', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Jardim Planteucal', 'R. Bonfim, 754', '11955901227', '11955901227', 'info@dimatoso.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'dimatoso-festas-ribeirao', 'aluguel_equipamentos', 'http://dimatoso.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'BBB Festas Ribeirão Pires', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Atendimento Regional', '1148232993', '1148232993', null, 'manual_google', true, '2026-03-06T12:00:00', 'bbb-festas-ribeirao', 'aluguel_equipamentos', 'http://bbbfestas.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Stic Festas Locações', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua dos Autonomistas, 3', '1148232438', '1148232438', null, 'manual_google', true, '2026-03-06T12:00:00', 'stic-festas-ribeirao', 'aluguel_equipamentos', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'LOCFEST Mesas e Cadeiras', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Rua José Maria Figueiredo, 711', '11998844351', '11998844351', null, 'manual_google', true, '2026-03-06T12:00:00', 'locfest-rgs', 'aluguel_equipamentos', null, 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Vem Que Tem Variedades', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Bairro Baeta Neves', 'Avenida Getúlio Vargas, 1202', '11996177030', '11996177030', 'vemquetem-baeta@outlook.com', 'manual_google', true, '2026-03-06T12:00:00', 'vem-que-tem-rgs', 'aluguel_equipamentos', 'http://vemquetemvariedades.com.br', 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Stall-UP Tendas RGS', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento Regional', '11996177030', '11996177030', null, 'manual_google', true, '2026-03-06T12:00:00', 'stall-up-rgs', 'aluguel_equipamentos', 'http://stallup.com.br', 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 83_abc_lanches_salgados_doces.sql
-- ===========================================
-- Seed: Lanches, salgados e doces para festas - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Mama Cida Salgados e Doces', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Regional ABC', '11943693897', '11943693897', null, 'manual_google', true, '2026-03-06T12:00:00', 'mama-cida-salgados-santo-andre', 'doces_salgados', 'http://salgados.mamacida.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Mara Salgados e Festas', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Eldízia', 'Rua Javaés, 455', '11944703647', '1144250496', null, 'manual_google', true, '2026-03-06T12:00:00', 'mara-salgados-santo-andre', 'doces_salgados', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Senhor Salgados', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Utinga', 'Rua Sidnei, 583', '11973473565', '11973473565', 'senhorsalgado09@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'senhor-salgados-santo-andre', 'doces_salgados', 'http://www.senhorsalgados.com', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Fátima Bolos e Salgados', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Alzira', 'Rua Carijós, 123', '11943693897', '11943693897', null, 'manual_google', true, '2026-03-06T12:00:00', 'fatima-bolos-santo-andre', 'doces_salgados', 'http://fatimabolosesalgados.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Doceria Delícia SP - SBC', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento Regional', '11967957399', '1122731571', null, 'manual_google', true, '2026-03-06T12:00:00', 'doceria-delicia-sbc', 'doces_salgados', 'http://www.doceriadeliciasp.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Ké Lanche Salgados', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento SBC', '1124888263', '1124888263', null, 'manual_google', true, '2026-03-06T12:00:00', 'ke-lanche-sbc', 'doces_salgados', 'http://www.kelanche.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Bolíssimos Kit Festa', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Boa Vista', 'Rua Giusepe Braído, 111', '11998074016', '1142319369', null, 'manual_google', true, '2026-03-06T12:00:00', 'bolissimos-kit-festa-scs', 'doces_salgados', 'http://www.bolissimos.com', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Mou Mousse Salgados', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Bairro Fundação', 'Rua Antônio Barile, 119', '11987264514', '1142276793', null, 'manual_google', true, '2026-03-06T12:00:00', 'mou-mousse-scs', 'doces_salgados', 'http://moumousse.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Nadia Lais Confeitaria', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Barcelona', 'Atendimento São Caetano', '11983783872', '11983783872', null, 'manual_google', true, '2026-03-06T12:00:00', 'nadia-lais-scs', 'doces_salgados', 'http://nadialaisconfeitaria.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Renata Confeitaria Kit Festa', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua Gema, 55', '11948014259', '11948014259', 'renatabarbozaelias@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'renata-confeitaria-diadema', 'doces_salgados', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Kmila Salgados e Eventos', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Eldorado', 'Rua Doutor Jose Silvio de Camargo, 390', '11961821248', '11961821248', 'kmilasalgados@hotmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'kmila-salgados-diadema', 'doces_salgados', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Casa de Salgados Diadema', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Piraporinha', 'Rua Amelia Bazzo Falasque, 58', '1140761690', '1140761690', null, 'manual_google', true, '2026-03-06T12:00:00', 'casa-de-salgados-diadema', 'doces_salgados', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Buffet Briandi Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Vila Noêmia', 'Atendimento Mauá', '1145550949', '1145550949', null, 'manual_google', true, '2026-03-06T12:00:00', 'buffet-briandi-maua', 'doces_salgados', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Confeitaria Andreia Cakes', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Jardim Zaíra', 'Atendimento Mauá', '11941712949', '11941712949', null, 'manual_google', true, '2026-03-06T12:00:00', 'andreia-cakes-maua', 'doces_salgados', 'http://andreiacakesconfeitaria.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Dany Salgadinhos Kit Festa', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Atendimento Ribeirão', '11941712949', '1135540324', null, 'manual_google', true, '2026-03-06T12:00:00', 'dany-salgadinhos-ribeirao', 'doces_salgados', 'http://salgados.danysalgadinhos.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Lizandra Espetinhos de Salgados', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Ouro Fino Paulista', 'Atendimento Grande ABC', '11944703647', '11944703647', null, 'manual_google', true, '2026-03-06T12:00:00', 'lizandra-espetinhos-ribeirao', 'doces_salgados', 'http://www.tudoincasa.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Sodiê Doces - Ribeirão Pires', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua Boa Vista, 45', '1148283300', '1148283300', null, 'manual_google', true, '2026-03-06T12:00:00', 'sodie-doces-ribeirao', 'doces_salgados', 'http://www.sodiedoces.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Ragazzo Delivery RGS', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento Delivery', '1130033434', '1130033434', null, 'manual_google', true, '2026-03-06T12:00:00', 'ragazzo-delivery-rgs', 'doces_salgados', 'http://www.ragazzofastfood.com.br', 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 84_abc_fotografia_filmagem.sql
-- ===========================================
-- Seed: Fotografia e Filmagem - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Caique Pacheco Fotografia', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Santo André', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'caique-pacheco-fotografia-santo-andre', 'fotografia', 'http://www.caiquepacheco.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Studio Três Quartos', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Bairro Jardim', 'Atendimento Regional', '11943693897', '11943693897', null, 'manual_google', true, '2026-03-06T12:00:00', 'studio-tres-quartos-santo-andre', 'fotografia', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Photometria', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Pires', 'Atendimento Santo André', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'photometria-santo-andre', 'fotografia', 'http://www.photometria.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'AP7 Photo - SBC', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Rudge Ramos', 'Atendimento Regional', '11961344932', '11961344932', 'contato@ap7.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'ap7-photo-sbc', 'fotografia', 'http://www.ap7.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Studio XX', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Av. Senador Vergueiro, 2123', '11976754473', '11976754473', 'contato@xxstudio.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'studio-xx-sbc', 'fotografia', 'http://www.xxstudio.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Cine Foto Rudge', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Rudge Ramos', 'Rua Afonsina, 169', '1143611555', '1143611555', null, 'manual_google', true, '2026-03-06T12:00:00', 'cine-foto-rudge-sbc', 'fotografia', 'http://www.cinefotorudge.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Fatia do Tempo', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Maria', 'Atendimento São Caetano', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'fatia-do-tempo-scs', 'fotografia', 'http://www.fatiadotempo.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Adilson Moralez Fotografia', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Atendimento Regional', '11998847762', '11998847762', 'contato@adilsonmoralez.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'adilson-moralez-scs', 'fotografia', 'http://www.adilsonmoralez.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Piola Fotografia', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Barcelona', 'Atendimento São Caetano', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'piola-fotografia-scs', 'fotografia', 'http://www.piolafotografia.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Régis Foto e Vídeo', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Vila Elidav', 'Av. Assembleia, 903', '11999118987', '11999118987', 'regisfotoevideooliveira@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'regis-foto-video-diadema', 'fotografia', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Studio D - Foto e Filmagem', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Atendimento Regional', '11978746157', '1147073477', null, 'manual_google', true, '2026-03-06T12:00:00', 'studio-d-foto-diadema', 'fotografia', 'http://www.fotoefilmagemd.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Jennifer Fotografia', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Vila Noêmia', 'Atendimento Mauá', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'jennifer-fotografia-maua', 'fotografia', 'http://www.jnfotos.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Cabine de Foto Hello', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Jardim Itapeva', 'Atendimento Regional', '11962276465', '11962276465', 'contato@cabinedefotohello.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'cabine-foto-hello-maua', 'fotografia', 'http://www.cabinedefotohello.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Maccriartb Photografia', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Atendimento Mauá', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'maccriartb-maua', 'fotografia', null, 'maua', 'SP', null),
(gen_random_uuid(), 'ProFesta Fotografia e Vídeo', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Atendimento Regional', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'profesta-ribeirao', 'fotografia', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'R e J - Foto e Vídeo', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Atendimento Ribeirão', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'r-e-j-foto-ribeirao', 'fotografia', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Bc Fotografia RGS', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento Regional', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'bc-fotografia-rgs', 'fotografia', null, 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 85_abc_reparo_bicicletas.sql
-- ===========================================
-- Seed: Reparo de Bicicletas e Patinetes - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'CycloMove Bike Service', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Bairro Jardim', 'Rua Adolfo Bastos, 1181', '11940691204', '1149794786', null, 'manual_google', true, '2026-03-06T12:00:00', 'cyclomove-bike-service-santo-andre', 'reparo_bicicletas', 'http://www.cyclomove.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Speed Bicicletas', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Vila Gilda', 'Av. Gilda, 454', '1144267685', '1144267685', null, 'manual_google', true, '2026-03-06T12:00:00', 'speed-bicicletas-santo-andre', 'reparo_bicicletas', 'http://www.speedbicicletas.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Bicicletaria Eliseu', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Regional', '11971137600', '11971137600', 'contato@bicicletariaeliseu.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'bicicletaria-eliseu-santo-andre', 'reparo_bicicletas', 'http://www.bicicletariaeliseu.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Drop Assistência Técnica Patinetes', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Parque Oratório', 'Rua do Oratório, 2872', '1136579030', '1136579030', null, 'manual_google', true, '2026-03-06T12:00:00', 'drop-assistencia-santo-andre', 'reparo_bicicletas', 'http://www.drop.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Techno Fix Multi Assistência', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Santo André', '1134567890', '1134567890', 'info@meusite.com', 'manual_google', true, '2026-03-06T12:00:00', 'techno-fix-multi-santo-andre', 'reparo_bicicletas', 'http://www.technofixmulti.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Ciclo Assunção', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Assunção', 'Rua Cristiano Angeli, 909', '11947576865', '1141094459', 'contato@cicloassuncao.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'ciclo-assuncao-sbc', 'reparo_bicicletas', 'http://www.cicloassuncao.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Conserta Bike SBC', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Planalto', 'Rua Doutor Cincinato Braga, 427', '11945489472', '1143908952', null, 'manual_google', true, '2026-03-06T12:00:00', 'conserta-bike-sbc', 'reparo_bicicletas', 'http://www.consertabike.com', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Bike Torres SBC', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Nova Petrópolis', 'Rua Jacob de Scopel, 101', '11973030508', '11973030508', null, 'manual_google', true, '2026-03-06T12:00:00', 'bike-torres-sbc', 'reparo_bicicletas', 'http://www.biketorres.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Lucas Bike', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Rua Sergipe, 22', '1141247694', '1141247694', null, 'manual_google', true, '2026-03-06T12:00:00', 'lucas-bike-sbc', 'reparo_bicicletas', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Smarty5g Assistência Scooters', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Atendimento Regional', '11993710390', '11993710390', null, 'manual_google', true, '2026-03-06T12:00:00', 'smarty5g-sbc', 'reparo_bicicletas', 'http://www.smarty5g.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Conserta Bike São Caetano', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Paula', 'Av. Pres. Kennedy, 2585', '11913269069', '1142298950', 'saocaetanodosul@consertabike.com', 'manual_google', true, '2026-03-06T12:00:00', 'conserta-bike-scs', 'reparo_bicicletas', 'http://www.consertabike.com', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Bicicletas Rocomo', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Rua Pernambuco, 453', '11972417915', '1142215212', null, 'manual_google', true, '2026-03-06T12:00:00', 'rocomo-bicicletas-scs', 'reparo_bicicletas', 'http://www.bikeabc.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Vs Bike', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Mauá', 'Av. Guido Aliberti, 4811', '11982923505', '11982923505', null, 'manual_google', true, '2026-03-06T12:00:00', 'vs-bike-scs', 'reparo_bicicletas', 'http://www.vsbike.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Manu-s Bike', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Serraria', 'R. Margarida Maria Alves, 53', '1140445945', '1140445945', null, 'manual_google', true, '2026-03-06T12:00:00', 'manu-s-bike-diadema', 'reparo_bicicletas', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Dede Fitness - Reparo Bike', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Rua Epiceia, 238', '11976924343', '1142532547', 'dedefitness2008@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'dede-fitness-bike-diadema', 'reparo_bicicletas', 'http://www.equipamentosacademia.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Ciclo Laser', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Jardim Maringá', 'Av. Barão de Mauá, 3126', '1145119352', '1145119352', null, 'manual_google', true, '2026-03-06T12:00:00', 'ciclo-laser-maua', 'reparo_bicicletas', null, 'maua', 'SP', null),
(gen_random_uuid(), 'LS Bike Oficina', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Jardim Ipe', 'Rua Cedro, 304', '1145450883', '1145450883', null, 'manual_google', true, '2026-03-06T12:00:00', 'ls-bike-oficina-maua', 'reparo_bicicletas', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Gorila Bikes', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Av. Capitão João, 2346', '1144279167', '1144279167', null, 'manual_google', true, '2026-03-06T12:00:00', 'gorila-bikes-maua', 'reparo_bicicletas', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Click Bike', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Santana', 'Av. Francisco Monteiro, 1215', '1148266028', '1148266028', 'clickbike@lojaclickbike.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'click-bike-ribeirao', 'reparo_bicicletas', 'http://www.lojaclickbike.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Rocomo Ribeirão', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua Miguel Prisco, 140', '11963702797', '1148277111', null, 'manual_google', true, '2026-03-06T12:00:00', 'rocomo-ribeirao', 'reparo_bicicletas', 'http://www.bikeabc.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Bicicletaria Chiquinho Bike', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Avenida Jean Lieutaud, 150', '1148203300', '1148203300', null, 'manual_google', true, '2026-03-06T12:00:00', 'chiquinho-bike-rgs', 'reparo_bicicletas', null, 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Chaveiro e Bicicletaria Betao', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento Rio Grande', '11999999999', '11999999999', null, 'manual_google', true, '2026-03-06T12:00:00', 'bicicletaria-betao-rgs', 'reparo_bicicletas', null, 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;


-- ===========================================
-- FROM FILE: 86_abc_energia_solar.sql
-- ===========================================
-- Seed: Instalação de Energia Solar no ABC Paulista
-- Categoria: energia_solar

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Evolve Santo André-SP | Energia Solar', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Santa Maria', 'Alameda Conde de Porto Alegre, 1396', '11947313052', '11981453019', null, 'manual_google', true, '2026-03-06T12:00:00', 'evolve-energia-santo-andre', 'energia_solar', 'https://evolveenergia.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'CN Suntech Energia Solar', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Utinga', 'Rua Teixeira de Freitas, 391', '11911101969', '11911101969', 'comercial@cnsuntech.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'cn-suntech-santo-andre', 'energia_solar', 'https://cnsuntech.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Solarprime Santo André', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Parque das Nações', 'Santo André, SP', '11971732266', '11971732266', 'rafael.silva@solarprimefranquias.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'solarprime-santo-andre', 'energia_solar', 'https://solarprime.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'GL Solar - Glsolar Ltda', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Santa Maria', 'Santo André, SP', '1143952727', '1143952727', null, 'manual_google', true, '2026-03-06T12:00:00', 'gl-solar-santo-andre', 'energia_solar', 'https://glsolar.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'ROCHA Consultoria Solar', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Campestre', 'Rua do Contorno, Santo André', '11976630064', '11976630064', 'rinaldo@rinaldorochacoach.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'rocha-consultoria-santo-andre', 'energia_solar', 'https://rochaconsultoriasolar.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Eco + Energy Energia Solar', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Campestre', 'R. das Figueiras, 1606', '1126697563', '1126697563', null, 'manual_google', true, '2026-03-06T12:00:00', 'eco-plus-energy-santo-andre', 'energia_solar', 'https://ecomaisenergy.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'EISOLAR Energia Solar', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Parque Miami', 'R. Rio Oiapoque, 283', '11934348000', '11934348000', null, 'manual_google', true, '2026-03-06T12:00:00', 'eisolar-santo-andre', 'energia_solar', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'SBC Energia Solar', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Jardim Anchieta', 'Rua Universal, 702', '11955811189', '11955811189', 'adm@sbcenergiasolar.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'sbc-energia-solar-sbc', 'energia_solar', 'https://sbcenergiasolar.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'RD Energia Fotovoltaica', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Vila Paulicéia', 'Rua Jacó do Bandolim, 81', '11989201203', '1123658086', 'contato@rdenergia.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'rd-energia-sbc', 'energia_solar', 'https://rdenergia.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'MVR Solar', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Montanhão', 'Rua Odila Figueiredo Nicolau, 31', '11961380285', '11961380285', null, 'manual_google', true, '2026-03-06T12:00:00', 'mvr-solar-sbc', 'energia_solar', 'https://mvrsolar.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'SolarStar ABC Energia', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Av. Pereira Barreto, 1479 - Sala 120', '11996212288', '11996212288', null, 'manual_google', true, '2026-03-06T12:00:00', 'solarstar-sbc', 'energia_solar', 'https://solartask.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'E Energy Solar SBC', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'São Bernardo do Campo, SP', '1137052710', '1137052710', null, 'manual_google', true, '2026-03-06T12:00:00', 'e-energy-solar-sbc', 'energia_solar', 'https://eenergysolar.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Eletroneves Energia Solar', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Avenida Goiás, 225', '11947782133', '11947782133', null, 'manual_google', true, '2026-03-06T12:00:00', 'eletroneves-scs', 'energia_solar', 'https://engrenabr.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Renovale Energia Solar SCS', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Rua Pará, 16', '11998225013', '1132348173', null, 'manual_google', true, '2026-03-06T12:00:00', 'renovale-solar-scs', 'energia_solar', 'https://atacadosolar.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Solazzi Energia Solar', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Paula', 'São Caetano do Sul, SP', '1147232905', '1147232905', null, 'manual_google', true, '2026-03-06T12:00:00', 'solazzi-solar-scs', 'energia_solar', 'https://solazzi.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'GF Elétrica e Solar', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Barcelona', 'São Caetano do Sul, SP', '1143952727', '1143952727', null, 'manual_google', true, '2026-03-06T12:00:00', 'gf-eletrica-scs', 'energia_solar', 'https://gfeletrica.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'JPV Solar Energia Renovável', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'R. Orense, 41 - Conj 812', '11972776767', '11972776767', null, 'manual_google', true, '2026-03-06T12:00:00', 'jpv-solar-diadema', 'energia_solar', 'https://jpvsolar.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Solen Energia Solar Diadema', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Conceição', 'Av. Dom Pedro I, 946', '11941064149', '11941064149', null, 'manual_google', true, '2026-03-06T12:00:00', 'solen-solar-diadema', 'energia_solar', 'https://solenenergia.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Select Engenharia Solar', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Diadema, SP', '11941064149', '11941064149', 'contato@selectengenhariasp.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'select-engenharia-diadema', 'energia_solar', 'https://selectengenhariasp.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'CSolar Energia Diadema', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Vila Nogueira', 'Diadema, SP', '1137052710', '1137052710', 'contato@sunlightbrasil.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'csolar-diadema', 'energia_solar', 'https://csolar.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'EJ Engenharia Solar Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Pq São Vicente', 'Rua Miguel Galindo Navarro, 198', '11934348000', '11934348000', null, 'manual_google', true, '2026-03-06T12:00:00', 'ej-engenharia-maua', 'energia_solar', 'https://ejengenhariasolar.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Solar King Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Mauá, SP', '1145447000', '1145447000', null, 'manual_google', true, '2026-03-06T12:00:00', 'solar-king-maua', 'energia_solar', 'https://solarking.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'EcoPower Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Mauá, SP', '11981281849', '11981281849', null, 'manual_google', true, '2026-03-06T12:00:00', 'ecopower-maua', 'energia_solar', 'https://ecopower.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Kvolt Solar Ribeirão Pires', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua Carandaia, 177', '11997654217', '11997654217', 'contato@kvoltsolar.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'kvolt-solar-ribeirao', 'energia_solar', 'https://kvoltsolar.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Grupo Thunder Energia Solar', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Pastoril', 'Av. Francisco Monteiro, 796', '11972855799', '11972855799', 'contato@grupothunder.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'grupo-thunder-ribeirao', 'energia_solar', 'https://grupothunder.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'KCG Solar ABC', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Rio Grande da Serra, SP', '11959995214', '11959995214', 'contato@kcgsolar.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'kcg-solar-rgs', 'energia_solar', 'https://kcgsolar.com.br', 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'PAOM Energia Solar', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Rio Grande da Serra, SP', '1144201753', '1144201753', 'paom@paom.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'paom-solar-rgs', 'energia_solar', 'https://paom.com.br', 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET category = EXCLUDED.category;



-- ===========================================
-- FROM FILE: 87_abc_brechos_luxo.sql
-- ===========================================
-- Seed: Brechós de Luxo e Curadoria - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Brechó Cabide Cheio', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Casa Branca', 'Avenida Capuava, 557', '11981813872', '11981813872', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-cabide-cheio-santo-andre', 'brecho_luxo', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Brechó Versátil', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Rua Gertrúdes de Lima, 168', '1144365778', '1144365778', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-versatil-santo-andre', 'brecho_luxo', 'http://brechoversatil.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Brechó Ki Mania', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Jardim', 'Rua Catequese, 72', '11986914790', '1127594162', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-ki-mania-santo-andre', 'brecho_luxo', 'http://www.brechokimania.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Peça Rara Santo André Centro', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Avenida Portugal, 1702', '11991114186', '11991114186', 'sac@lojinhapecarara.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'peca-rara-centro-santo-andre', 'brecho_luxo', 'https://www.pecararabrecho.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Brechó Tucano Santo André', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Rua Presidente Carlos de Campos, 50', '1144320146', '1144320146', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-tucano-santo-andre', 'brecho_luxo', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Brechó Só Grifes', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Rua Coronel Ortiz, 202', '1125946399', '1125946399', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-so-grifes-santo-andre', 'brecho_luxo', null, 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Peça Rara SBC', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Jardim do Mar', 'Avenida Kennedy, 285', '11976539148', '11976539148', 'centro.saobernardodocampo@pecararabr.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'peca-rara-sbc', 'brecho_luxo', 'https://www.pecararabrecho.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Brechó Maria Dolores', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Jardim Hollywood', 'Rua Vera Cruz, 415', '1143306699', '1143306699', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-maria-dolores-sbc', 'brecho_luxo', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Alternativa Moda Brechó', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Planalto', 'Avenida Álvaro Guimarães, 868', '1143992200', '1143992200', null, 'manual_google', true, '2026-03-06T12:00:00', 'alternativa-moda-brecho-sbc', 'brecho_luxo', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Brechó Achados & Babados', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Taboão', 'Rua Luisiana, 1032', '11971710332', '11971710332', null, 'manual_google', true, '2026-03-06T12:00:00', 'achados-e-babados-sbc', 'brecho_luxo', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Brexoluxo São Caetano', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Rua Amazonas, 1180', '1142296677', '1142296677', null, 'manual_google', true, '2026-03-06T12:00:00', 'brexoluxo-sao-caetano', 'brecho_luxo', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Brechó Chic São Caetano', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Maria', 'Rua Sílvia, 295', '1123112357', '1123112357', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-chic-sao-caetano', 'brecho_luxo', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Bodeguita Brechó', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Cerâmica', 'Rua Engenheiro Rebouças, 707', '1142382370', '1142382370', null, 'manual_google', true, '2026-03-06T12:00:00', 'bodeguita-brecho-sao-caetano', 'brecho_luxo', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Mercato Brechó', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santa Paula', 'Rua Rafael Corrêa Sampaio, 741', '1142218621', '1142218621', null, 'manual_google', true, '2026-03-06T12:00:00', 'mercato-brecho-sao-caetano', 'brecho_luxo', null, 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Brechó Só Chique Diadema', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Av. Alda, 1148', '11965479287', '11965479287', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-so-chique-diadema', 'brecho_luxo', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Bello Achado Brechó', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'R. Manoel da Nóbrega, 435', '11979786149', '11979786149', null, 'manual_google', true, '2026-03-06T12:00:00', 'bello-achado-brecho-diadema', 'brecho_luxo', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Burguesinha Brechó Chic', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Av. Pres. Kennedy, 306', '11966137676', '11966137676', null, 'manual_google', true, '2026-03-06T12:00:00', 'burguesinha-brecho-diadema', 'brecho_luxo', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Sunflower Brechó Boutique', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Atendimento Virtual - Mauá', '11984885139', '11984885139', 'sunflower.brechoboutique@gmail.com', 'manual_google', true, '2026-03-06T12:00:00', 'sunflower-brecho-maua', 'brecho_luxo', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Brechó Medrado', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Jardim Itapark Velho', 'Av. Itapark, 3726', '11964253372', '11964253372', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-medrado-maua', 'brecho_luxo', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Bazar Exército de Salvação Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'R. Luís Mariani, 136', '1145136894', '1145136894', null, 'manual_google', true, '2026-03-06T12:00:00', 'exercito-salvacao-maua', 'brecho_luxo', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Brechó Ouro Fino', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Represa', 'Rodovia Índio Tibiriçá, 2354', '1148221360', '1148221360', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-ouro-fino-ribeirao', 'brecho_luxo', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Lifestyle Brechó & Beer', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rua Miguel Prisco, 460', '11947747480', '11947747480', null, 'manual_google', true, '2026-03-06T12:00:00', 'lifestyle-brecho-ribeirao', 'brecho_luxo', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Brechó da Vila Rio Grande', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro-Vila Lopes', 'Atendimento Regional RGS', '11986914790', '11986914790', null, 'manual_google', true, '2026-03-06T12:00:00', 'brecho-vila-rgs', 'brecho_luxo', null, 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET 
  category = EXCLUDED.category,
  active = EXCLUDED.active;


-- ===========================================
-- FROM FILE: 88_abc_locacao_assinatura.sql
-- ===========================================
-- Seed: Locação de Carros por Assinatura - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Movida Carro por Assinatura - Santo André', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Rua Coronel Fernando Prestes, 680', '08007713010', '08007713010', null, 'manual_google', true, '2026-03-06T12:00:00', 'movida-assinatura-santo-andre', 'locacao_carros', 'https://www.movidazerokm.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Unidas Livre - Santo André', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Casa Branca', 'Av. Artur de Queiros, 685', '08007715158', '1151080079', null, 'manual_google', true, '2026-03-06T12:00:00', 'unidas-livre-santo-andre', 'locacao_carros', 'https://www.livre.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Localiza Meoo - Santo André Centro', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'R. General Glicério, 749', '3130034774', '40001403', 'meoo.vendas@localiza.com', 'manual_google', true, '2026-03-06T12:00:00', 'localiza-meoo-santo-andre', 'locacao_carros', 'https://www.localiza.com/meoo', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'Movida Carro por Assinatura - SBC Plaza', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Avenida Rotary, 624 (Shopping São Bernardo Plaza)', '08007713010', '08007713010', null, 'manual_google', true, '2026-03-06T12:00:00', 'movida-assinatura-sbc', 'locacao_carros', 'https://www.movidazerokm.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Unidas Livre - SBC Plaza', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Centro', 'Av. Rotary, 624 (Shopping São Bernardo Plaza)', '08007715158', '08007715158', null, 'manual_google', true, '2026-03-06T12:00:00', 'unidas-livre-sbc', 'locacao_carros', 'https://www.livre.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Hyundai Sinal Diadema - Assinatura', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Av. Fábio Eduardo Ramos Esquivel, 999', '11999999999', '1140532000', null, 'manual_google', true, '2026-03-06T12:00:00', 'hyundai-sinal-diadema', 'locacao_carros', 'https://www.gruposinal.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'AssineDrive Diadema', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Atendimento Regional Diadema', '11999999999', '11999999999', 'contato@assinedrive.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'assine-drive-diadema', 'locacao_carros', 'https://www.assinedrive.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Ford Sinal São Caetano - Assinatura', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Rua Alagoas, 41', '11999999999', '1142234000', null, 'manual_google', true, '2026-03-06T12:00:00', 'ford-sinal-scs', 'locacao_carros', 'https://www.gruposinal.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Hyundai Sinal São Caetano - Assinatura', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Santo Antônio', 'Avenida Goiás, 3373', '11999999999', '1142237000', null, 'manual_google', true, '2026-03-06T12:00:00', 'hyundai-sinal-scs', 'locacao_carros', 'https://www.gruposinal.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Loca+ Veículos São Caetano', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Centro', 'Rua Amazonas, 1100', '11999999999', '1142235000', null, 'manual_google', true, '2026-03-06T12:00:00', 'loca-mais-scs', 'locacao_carros', 'https://www.locamaisveiculos.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'AssineDrive Mauá', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Centro', 'Atendimento Regional Mauá', '11999999999', '11999999999', 'contato@assinedrive.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'assine-drive-maua', 'locacao_carros', 'https://www.assinedrive.com.br', 'maua', 'SP', null),
(gen_random_uuid(), 'Panorama Veículos Locadora - Ribeirão Pires', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Avenida Valdírio Prisco, 980', '11950421700', '1125951717', null, 'manual_google', true, '2026-03-06T12:00:00', 'panorama-locadora-ribeirao', 'locacao_carros', 'https://www.panoramaveiculos.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'KCG Locadora ABC - Rio Grande da Serra', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Atendimento Regional RGS', '11959995214', '11959995214', null, 'manual_google', true, '2026-03-06T12:00:00', 'kcg-locadora-rgs', 'locacao_carros', 'https://www.kcgsolar.com.br', 'rio-grande-da-serra', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET 
  category = EXCLUDED.category,
  active = EXCLUDED.active;


-- ===========================================
-- FROM FILE: 89_abc_paisagismo_hortas.sql
-- ===========================================
-- Seed: Paisagismo e Hortas - ABC Paulista
-- Cidades: Santo André, São Bernardo, São Caetano, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address, whatsapp, phone, email, source, active, created_at, slug, category, website, city_slug, state, creci
) VALUES
(gen_random_uuid(), 'Lótus Paisagismo e Irrigação', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Campestre', 'Rua Flora, 201', '11985660830', '11985660830', 'contato@lotuspaisagismo.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'lotus-paisagismo-santo-andre', 'paisagismo', 'http://lotuspaisagismo.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'A Varanda Floricultura e Paisagismo', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Bela Vista', 'Praça Allan Kardec, 70 B', '1149903422', '1149903422', null, 'manual_google', true, '2026-03-06T12:00:00', 'a-varanda-paisagismo-santo-andre', 'paisagismo', 'http://www.avaranda.com.br', 'santo-andre', 'SP', null),
(gen_random_uuid(), 'ABC Garden São Bernardo', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Demarchi', 'Av. Maria Servidei Demarchi, 1850', '1143418299', '1143418299', 'contato@abcgarden.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'abc-garden-sbc', 'paisagismo', 'http://abcgarden.com.br', 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'ABC Jardinagem Egrl', null, (SELECT id FROM public.cities WHERE slug='sao-bernardo-do-campo'), null, 'Demarchi', 'Atendimento Regional SBC', '1143418299', '1143418299', null, 'manual_google', true, '2026-03-06T12:00:00', 'abc-jardinagem-sbc', 'paisagismo', null, 'sao-bernardo-do-campo', 'SP', null),
(gen_random_uuid(), 'Esquina do Verde', null, (SELECT id FROM public.cities WHERE slug='sao-caetano-do-sul'), null, 'Cerâmica', 'Av. Guido Aliberti, 2811', '1142312678', '1142312678', null, 'manual_google', true, '2026-03-06T12:00:00', 'esquina-do-verde-scs', 'paisagismo', 'http://esquinadoverde.com.br', 'sao-caetano-do-sul', 'SP', null),
(gen_random_uuid(), 'Floema Jardinagem e Paisagismo', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Centro', 'Avenida Sete de Setembro, 151', '1128053586', '1140572304', null, 'manual_google', true, '2026-03-06T12:00:00', 'floema-paisagismo-diadema', 'paisagismo', 'http://floemapaisagismo.com.br', 'diadema', 'SP', null),
(gen_random_uuid(), 'Garden Raiz Jardinagem', null, (SELECT id FROM public.cities WHERE slug='diadema'), null, 'Canhema', 'Rua Teófilo Braga, 45', '11944756035', '11944756035', null, 'manual_google', true, '2026-03-06T12:00:00', 'garden-raiz-diadema', 'paisagismo', null, 'diadema', 'SP', null),
(gen_random_uuid(), 'Malu Artes Jardinagem', null, (SELECT id FROM public.cities WHERE slug='maua'), null, 'Vila Noêmia', 'Atendimento Regional Mauá', '1145768820', '1145768820', null, 'manual_google', true, '2026-03-06T12:00:00', 'malu-artes-maua', 'paisagismo', null, 'maua', 'SP', null),
(gen_random_uuid(), 'Km Garden Pires', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Ouro Fino', 'Rodovia Índio Tibiriçá, 4443', '1148285744', '1148285744', null, 'manual_google', true, '2026-03-06T12:00:00', 'km-garden-ribeirao', 'paisagismo', null, 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Verdy Paisagismo', null, '1f84b6c7-69e8-49c6-a691-30da5246e0ea', null, 'Centro', 'Rodovia Índio Tibiriçá, 3005', '1149915000', '1149915000', 'comercial@verdypaisagismo.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'verdy-paisagismo-ribeirao', 'paisagismo', 'http://verdypaisagismo.com.br', 'ribeirao-pires', 'SP', null),
(gen_random_uuid(), 'Carol Flores Garden', null, (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), null, 'Centro', 'Rua José Maria Figueiredo, 8', '1148211000', '1148211000', null, 'manual_google', true, '2026-03-06T12:00:00', 'carol-flores-rgs', 'paisagismo', null, 'rio-grande-da-serra', 'SP', null),
(gen_random_uuid(), 'Cityfarm Brasil - Hortas Urbanas', null, (SELECT id FROM public.cities WHERE slug='santo-andre'), null, 'Centro', 'Atendimento Regional ABC', '11999999999', '11999999999', 'contato@cityfarmbrasil.com.br', 'manual_google', true, '2026-03-06T12:00:00', 'cityfarm-brasil-abc', 'paisagismo', 'http://cityfarmbrasil.com.br', 'santo-andre', 'SP', null)
ON CONFLICT (slug) DO UPDATE SET 
  category = EXCLUDED.category,
  active = EXCLUDED.active;

