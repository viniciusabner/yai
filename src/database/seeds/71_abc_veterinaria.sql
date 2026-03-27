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
(gen_random_uuid(), 'Clínica Veterinária Ribeirão Pires', 'veterinario', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Av. Kaethe Richers, 33', '11947103267', '1148283906', 'manual_google', true, 'clinica-vet-ribeirao-pires'),
(gen_random_uuid(), 'Hospital Veterinário Nipon', 'veterinario', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'hospital-vet-nipon-ribeirao-pires'),
(gen_random_uuid(), 'Clinica Veterinária Meraki HealthCare', 'veterinario', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'R. Afonso Zampol, 48', '11999999999', '11999999999', 'manual_google', true, 'meraki-healthcare-ribeirao-pires'),
(gen_random_uuid(), 'Veterinária Central', 'veterinario', (SELECT id FROM public.cities WHERE slug='ribeirao-pires'), 'Centro', 'Rua Miguel Prisco, 510', '1148233082', '1148233082', 'manual_google', true, 'veterinaria-central-ribeirao-pires'),

-- Rio Grande da Serra
(gen_random_uuid(), 'Clínica Veterinária Rio Grande', 'veterinario', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'clinica-vet-rio-grande'),
(gen_random_uuid(), 'Veterinária Trevo RGS', 'veterinario', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'veterinaria-trevo-rgs'),
(gen_random_uuid(), 'Veterinária Suelen RGS', 'veterinario', (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'), 'Centro', 'Atendimento Regional', '11999999999', '11999999999', 'manual_google', true, 'veterinaria-suelen-rgs')


ON CONFLICT (slug) DO NOTHING;
