-- ========================================
-- Hotel para Pets — ABC Paulista (Deep Search)
-- Gerado em: 2026-03-31
-- Método: Pesquisa profunda em Google Maps, sites oficiais e diretórios
-- Categoria: hotel_pet
-- ========================================

-- ===== SANTO ANDRÉ (4 estabelecimentos) =====

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES
  (
    gen_random_uuid(),
    'Resort dos Cães',
    (SELECT id FROM public.cities WHERE slug = 'santo-andre'),
    'Jardim',
    'Rua das Esmeraldas, 281',
    '1128664444',
    '1128664444',
    null,
    'manual_google',
    true,
    'resort-dos-caes-santo-andre',
    'hotel_pet',
    'https://resortdoscaes.com.br',
    'santo-andre',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Mallaha Pet Resort',
    (SELECT id FROM public.cities WHERE slug = 'santo-andre'),
    'Vila Bastos',
    'Rua Adolfo Bastos, 1184',
    '11953052202',
    '1123243612',
    null,
    'manual_google',
    true,
    'mallaha-pet-resort-santo-andre',
    'hotel_pet',
    'https://mallahapetresort.com.br',
    'santo-andre',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Dog Smile Resort',
    (SELECT id FROM public.cities WHERE slug = 'santo-andre'),
    'Vila Valparaíso',
    'Av. Atlântica, 723',
    '11971981576',
    '1144262956',
    null,
    'manual_google',
    true,
    'dog-smile-resort-santo-andre',
    'hotel_pet',
    'https://dogsmile.com.br',
    'santo-andre',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Pet Family ABC',
    (SELECT id FROM public.cities WHERE slug = 'santo-andre'),
    'Centro',
    'Atendimento Regional',
    '11995196375',
    '11995196375',
    null,
    'manual_google',
    true,
    'pet-family-abc-santo-andre',
    'hotel_pet',
    'https://petfamilyabc.com.br',
    'santo-andre',
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  city_id = EXCLUDED.city_id,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;

-- ===== SÃO BERNARDO DO CAMPO (3 estabelecimentos) =====

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES
  (
    gen_random_uuid(),
    'Pet Paradise Resort',
    (SELECT id FROM public.cities WHERE slug = 'sao-bernardo-do-campo'),
    'Nova Petrópolis',
    'Rua do Imperador, 30',
    '11992195508',
    '11992195508',
    null,
    'manual_google',
    true,
    'pet-paradise-resort-sbc',
    'hotel_pet',
    'https://petparadiseresort.com.br',
    'sao-bernardo-do-campo',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Resort dos Aumigos',
    (SELECT id FROM public.cities WHERE slug = 'sao-bernardo-do-campo'),
    'Paulicéia',
    'Rua Lapa, 378',
    '11959008344',
    '11959008344',
    'resortdosaumigos@gmail.com',
    'manual_google',
    true,
    'resort-dos-aumigos-sbc',
    'hotel_pet',
    'https://resortdosaumigos.com.br',
    'sao-bernardo-do-campo',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Dogs Up Demarchi',
    (SELECT id FROM public.cities WHERE slug = 'sao-bernardo-do-campo'),
    'Demarchi',
    'Av. Maria Servidei Demarchi, 1535',
    '11945566365',
    '11945566365',
    null,
    'manual_google',
    true,
    'dogs-up-demarchi-sbc',
    'hotel_pet',
    'https://dogsup.com.br',
    'sao-bernardo-do-campo',
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  city_id = EXCLUDED.city_id,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;

-- ===== SÃO CAETANO DO SUL (5 estabelecimentos) =====

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES
  (
    gen_random_uuid(),
    'Eco Club Pet Resort',
    (SELECT id FROM public.cities WHERE slug = 'sao-caetano-do-sul'),
    'Cerâmica',
    'Av. Senador Roberto Simonsen, 1278',
    '11964927398',
    '1142242551',
    null,
    'manual_google',
    true,
    'eco-club-pet-resort-scs',
    'hotel_pet',
    'https://ecoclubpet.com.br',
    'sao-caetano-do-sul',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Pet Family ABC - São Caetano',
    (SELECT id FROM public.cities WHERE slug = 'sao-caetano-do-sul'),
    'Santa Maria',
    'Rua Marina, 1490',
    '11995196375',
    '11995196375',
    null,
    'manual_google',
    true,
    'pet-family-abc-scs',
    'hotel_pet',
    'https://petfamilyabc.com.br',
    'sao-caetano-do-sul',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Entre Patas Day Care',
    (SELECT id FROM public.cities WHERE slug = 'sao-caetano-do-sul'),
    'Santa Paula',
    'Av. Presidente Kennedy, 1435',
    '11993799852',
    '1143183233',
    null,
    'manual_google',
    true,
    'entre-patas-day-care-scs',
    'hotel_pet',
    'https://entrepatasdaycare.com.br',
    'sao-caetano-do-sul',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Pepetos',
    (SELECT id FROM public.cities WHERE slug = 'sao-caetano-do-sul'),
    'Jardim São Caetano',
    'Estrada das Lágrimas, 1170',
    '11955783240',
    '11955783240',
    null,
    'manual_google',
    true,
    'pepetos-scs',
    'hotel_pet',
    'https://pepetos.com.br',
    'sao-caetano-do-sul',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Meu Peludo Favorito',
    (SELECT id FROM public.cities WHERE slug = 'sao-caetano-do-sul'),
    'Centro',
    'Atendimento Regional',
    null,
    null,
    null,
    'manual_google',
    true,
    'meu-peludo-favorito-scs',
    'hotel_pet',
    'https://meupeludofavoritoscs.com.br',
    'sao-caetano-do-sul',
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  city_id = EXCLUDED.city_id,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;

-- ===== DIADEMA (3 estabelecimentos) =====

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES
  (
    gen_random_uuid(),
    'King Cão Pet Hotel',
    (SELECT id FROM public.cities WHERE slug = 'diadema'),
    'Eldorado',
    'Av. Alda, 102',
    '1156742108',
    '1156742108',
    null,
    'manual_google',
    true,
    'king-cao-pet-hotel-diadema',
    'hotel_pet',
    'https://kingcao.com.br',
    'diadema',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Wee Pet Hotel',
    (SELECT id FROM public.cities WHERE slug = 'diadema'),
    'Centro',
    'Rua Professor Camillo Ashcar, 830',
    '11966068289',
    '11966068289',
    'hotelweepet@gmail.com',
    'manual_google',
    true,
    'wee-pet-hotel-diadema',
    'hotel_pet',
    null,
    'diadema',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Confortt Pets',
    (SELECT id FROM public.cities WHERE slug = 'diadema'),
    'Eldorado',
    'Estrada Nova Ipê, s/n',
    null,
    null,
    null,
    'manual_google',
    true,
    'confortt-pets-diadema',
    'hotel_pet',
    null,
    'diadema',
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  city_id = EXCLUDED.city_id,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;

-- ===== MAUÁ (3 estabelecimentos) =====

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES
  (
    gen_random_uuid(),
    'KAHU - O Lar do Seu Pet',
    (SELECT id FROM public.cities WHERE slug = 'maua'),
    'Centro',
    'Atendimento Regional',
    null,
    null,
    null,
    'manual_google',
    true,
    'kahu-lar-do-seu-pet-maua',
    'hotel_pet',
    'https://kahularpet.com.br',
    'maua',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Dogs Ville Mauá',
    (SELECT id FROM public.cities WHERE slug = 'maua'),
    'Centro',
    'Atendimento Regional',
    '11946240028',
    '1150556622',
    'contato@dogsville.com.br',
    'manual_google',
    true,
    'dogs-ville-maua',
    'hotel_pet',
    'https://dogsville.com.br',
    'maua',
    'SP'
  ),
  (
    gen_random_uuid(),
    'Canil Ohana Gold',
    (SELECT id FROM public.cities WHERE slug = 'maua'),
    'Centro',
    'Atendimento Regional',
    null,
    null,
    null,
    'manual_google',
    true,
    'canil-ohana-gold-maua',
    'hotel_pet',
    'https://canilohanagold.com.br',
    'maua',
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  city_id = EXCLUDED.city_id,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;

-- ===== RIBEIRÃO PIRES (1 estabelecimento) =====

INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)
VALUES
  (
    gen_random_uuid(),
    'Oh My Dog Pet Care',
    (SELECT id FROM public.cities WHERE slug = 'ribeirao-pires'),
    'Centro',
    'Atendimento Regional',
    null,
    null,
    null,
    'manual_google',
    true,
    'oh-my-dog-pet-care-ribeirao-pires',
    'hotel_pet',
    'https://ohmydogpetcare.com.br',
    'ribeirao-pires',
    'SP'
  )
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  city_id = EXCLUDED.city_id,
  neighborhood = EXCLUDED.neighborhood,
  address = EXCLUDED.address,
  whatsapp = EXCLUDED.whatsapp,
  phone = EXCLUDED.phone,
  category = EXCLUDED.category,
  website = EXCLUDED.website;

-- ===== RIO GRANDE DA SERRA =====
-- Nenhum hotel para pets verificável encontrado nesta cidade.
-- Cidade muito pequena (~50 mil hab.) para suportar este tipo de negócio.
