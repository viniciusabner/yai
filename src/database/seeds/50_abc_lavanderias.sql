-- Seeds para a categoria Lavanderias (Lavanderias) no ABC Paulista
-- Gerado via pesquisa Manual no Google
-- Total: 26 registros encontrados

INSERT INTO public.providers (
    id,
    name,
    category_id,
    city_id,
    neighborhood,
    address,
    whatsapp,
    phone,
    source,
    active
) VALUES 
-- Santo André (city_id: 1)
(gen_random_uuid(), 'Limp Tutti Lavanderia', 'lavanderias', 1, 'Vila Assunção', 'Rua Santo André, 344', '11961697004', '1144275590', 'manual_google', true),
(gen_random_uuid(), 'ABCClean Lavanderia', 'lavanderias', 1, 'Jd. Bela Vista', 'Av. Portugal 1537', '11964010758', '1144384420', 'manual_google', true),

-- São Bernardo do Campo (city_id: 2)
(gen_random_uuid(), 'Laundromat São Bernardo', 'lavanderias', 2, 'Centro', 'Avenida Francisco Prestes Maia, 501 - Loja, 4', '21992674064', '21992674064', 'manual_google', true),
(gen_random_uuid(), 'Lavanderia São Bernardo e Passanderia LP2', 'lavanderias', 2, 'Centro', 'Avenida Francisco Prestes Maia, 847', NULL, '1143375590', 'manual_google', true),
(gen_random_uuid(), 'Selava Express', 'lavanderias', 2, 'Centro', 'R. Américo Brasiliense, 532', '11939437708', '11939437708', 'manual_google', true),
(gen_random_uuid(), 'Lav Best Matriz', 'lavanderias', 2, 'Centro', 'Av. Barão de Mauá, 325', '11997490847', '1141254331', 'manual_google', true),
(gen_random_uuid(), 'Lavanderia Industrial Sao Bernardo (Lavisber)', 'lavanderias', 2, 'Baeta Neves', 'Rua Adamantina, 28', NULL, '1141239599', 'manual_google', true),
(gen_random_uuid(), 'A&J Lavanderia', 'lavanderias', 2, 'Alvarenga', 'Rua Santo André, 12', NULL, '1143583564', 'manual_google', true),
(gen_random_uuid(), 'Lavup', 'lavanderias', 2, 'Rudge Ramos', 'R. Cândido Portinari, 24', '11988478181', '11988478181', 'manual_google', true),

-- São Caetano do Sul (city_id: 3)
(gen_random_uuid(), 'Personale Lavanderia', 'lavanderias', 3, 'Centro', 'Rua Amazonas, 909', '11937774038', '1142241600', 'manual_google', true),
(gen_random_uuid(), 'LT Lavanderia de Tapetes', 'lavanderias', 3, 'Santa Paula', 'Rua Conselheiro Lafayette, 120', NULL, '1142243046', 'manual_google', true),
(gen_random_uuid(), 'RDR Lavanderia', 'lavanderias', 3, 'Santa Paula', 'R. Piauí, 907', NULL, '1142262134', 'manual_google', true),

-- Diadema (city_id: 4)
(gen_random_uuid(), 'Lavanderia e Tinturaria Nova Paraíso', 'lavanderias', 4, 'Centro', 'Rua Amélia Eugênia, 322', NULL, '1140565100', 'manual_google', true),
(gen_random_uuid(), 'Lavanderia e Tinturaria Vincus', 'lavanderias', 4, 'Centro', 'Avenida São José, 379', NULL, '1140513349', 'manual_google', true),
(gen_random_uuid(), 'Lavhotel Lavanderia', 'lavanderias', 4, 'Centro', 'Rua Álvares Cabral, 606', NULL, '1140449184', 'manual_google', true),
(gen_random_uuid(), 'MH Lavanderia', 'lavanderias', 4, 'Vila dos Campeões', 'Avenida Fukuichi Nakata, 659', '11962701163', '1140721745', 'manual_google', true),
(gen_random_uuid(), 'Innovar Lavanderia', 'lavanderias', 4, 'Centro', 'Avenida Alda, 1341', '11964541163', '1140923974', 'manual_google', true),
(gen_random_uuid(), 'Lava e Leva', 'lavanderias', 4, 'Vila Nogueira', 'Av Fagundes de Oliveira, 243', '11952170338', '11952170338', 'manual_google', true),

-- Mauá (city_id: 5)
(gen_random_uuid(), 'Central Lavanderia e Casa de Costura', 'lavanderias', 5, 'Matriz', 'Rua Agostinho Assis Fernandes, 58', NULL, '1145143594', 'manual_google', true),
(gen_random_uuid(), 'Lavanderia e Tinturaria G G', 'lavanderias', 5, 'Jardim Rosina', 'Rua Antônia Rosa Fioravante, 3380', NULL, '1145197522', 'manual_google', true),
(gen_random_uuid(), 'Lavanderia e Tinturaria Imperial', 'lavanderias', 5, 'Matriz', 'Avenida José Gaspar, 311', NULL, '1145550434', 'manual_google', true),
(gen_random_uuid(), 'Washtec Tingimento', 'lavanderias', 5, 'Vila Bocaina', 'Rua Osório, 94', NULL, '1145452580', 'manual_google', true),
(gen_random_uuid(), 'Multi Clean', 'lavanderias', 5, 'Vila Emilio', 'R. Dr. Fernando Costa, 550', '11942987288', '1145186157', 'manual_google', true),

-- Ribeirão Pires (city_id: 6)
(gen_random_uuid(), 'Lavanderia e Tingimento Washtec', 'lavanderias', 6, 'Centro', 'Rua Fortuna, 271', NULL, '1148277859', 'manual_google', true),
(gen_random_uuid(), 'Lavateria Fast', 'lavanderias', 6, 'Centro', 'Av. Francisco Monteiro, 702', '11930636426', '11930636426', 'manual_google', true),

-- Rio Grande da Serra (city_id: 7)
(gen_random_uuid(), 'Lavanderia Lavô', 'lavanderias', 7, 'Centro', 'Rua Prefeito Cido Franco, 87', '11995040505', '11995040505', 'manual_google', true);
