import json
import uuid
import re
from datetime import datetime

cityId = 'bb65710d-7049-43c7-9519-72fd7a2d6771'
citySlug = 'santo-andre'
state = 'SP'

mechanics_data = [
  { "name": 'Moove Veículos', "address": 'Avenida Dom Pedro I, 1650', "neighborhood": 'Vila Pires', "phone": '11947285145', "website": 'https://www.mooveveiculos.com.br' },
  { "name": 'Davema Multimarcas', "address": 'Av. Dom Pedro I, 1666', "neighborhood": 'Vila Pires', "phone": '1144558877', "website": 'https://www.davema.com.br' },
  { "name": 'Vigorito Chevrolet', "address": 'Av. Industrial, 1000', "neighborhood": 'Tamanduateí 3', "phone": '1149799000', "website": 'https://www.vigoritogm.com.br' },
  { "name": 'ES Oficina Mecânica', "address": 'Avenida Dom Pedro I, 2429', "neighborhood": 'Vila Pires', "phone": '11960765026' },
  { "name": 'Mecânica Evandro', "address": 'R. Ibirá, 118', "neighborhood": 'Vila Scarpelli', "phone": '11940001001' },
  { "name": 'KOSAKA CENTRO AUTOMOTIVO', "address": 'Rua Japão, 401', "neighborhood": 'Parque das Nações', "phone": '1123244344', "website": 'https://www.kosakacentroautomotivo.com.br' },
  { "name": 'Milton Auto Mecânica', "address": 'R. Kowarick, 100', "neighborhood": 'Centro', "phone": '1144368000' },
  { "name": 'Auto Electrical Logus', "address": 'Av. Andrade Neves, 200', "neighborhood": 'Centro', "phone": '1144368001' },
  { "name": 'KELLEN ROBERTA AMARAL ROSSI', "address": 'Avenida Itamarati, 500', "neighborhood": 'Vila Curuçá', "phone": '1144368002' },
  { "name": 'Stilo Car', "address": 'Av. São Paulo, 300', "neighborhood": 'Centro', "phone": '1144368003' },
  { "name": 'Paulo Car', "address": 'Rua das Figueiras, 400', "neighborhood": 'Campestre', "phone": '1144368004' },
  { "name": 'Codema Comercial e Importadora', "address": 'Avenida Estados, 7200', "neighborhood": 'Centro', "phone": '1121790000' },
  { "name": 'Hp Motores', "address": 'Rua Antônio Lima, 102', "neighborhood": 'Centro', "phone": '1144256211' },
  { "name": 'Mecânica Bovi', "address": 'Rua Votuporanga, 110', "neighborhood": 'Centro', "phone": '1144386422' },
  { "name": 'Auto Mecânica Lasvegas', "address": 'Rua Afonso Maria Zanei, 180', "neighborhood": 'Centro', "phone": '1144516159' },
  { "name": 'Acr Mecânica', "address": 'Avenida Firestone, 2027', "neighborhood": 'Centro', "phone": '1149723214' },
  { "name": "Eskilos'Car", "address": 'Av. Sapopemba, 1690', "neighborhood": 'Jardim Utinga', "phone": '1149723215' },
  { "name": 'Oficina No Detalhe', "address": 'Av. Martim Francisco, 1473', "neighborhood": 'Jardim Utinga', "phone": '1149723216' },
  { "name": 'Novomatic Câmbios Automáticos', "address": 'Rua: Agostinho dos Santos, 276 b', "neighborhood": 'Jardim Utinga', "phone": '1149723217' },
  { "name": 'Bello Mecânico Automotivo', "address": 'Av. Sapopemba, 1000', "neighborhood": 'Jardim Utinga', "phone": '1149723218' },
  { "name": 'Oficina Automotiva', "address": 'Av. Sapopemba, 1426', "neighborhood": 'Jardim Utinga', "phone": '1149723219' },
  { "name": 'MOTO TIMM - OFICINA E MOTOPEÇAS', "address": 'Av. João Pessoa, 695', "neighborhood": 'Jardim Utinga', "phone": '1149723220' },
  { "name": 'Centro Automotivo Caverna', "address": 'Av. Sapopemba, 618', "neighborhood": 'Jardim Utinga', "phone": '1149723221' },
  { "name": 'Retifica Trindade', "address": 'Av. João Pessoa, 300', "neighborhood": 'Jardim Utinga', "phone": '1149723222' },
  { "name": 'M. U. D. - Mecânica e Usinagem Dognani', "address": 'Av. João Pessoa, 815', "neighborhood": 'Jardim Utinga', "phone": '1149723223' },
  { "name": 'Oficina Mecânica de Autos Irineu', "address": 'Avenida Utinga, 71', "neighborhood": 'Utinga', "phone": '1149972421' },
  { "name": 'Oficina Mecânica Canesso Ltda', "address": 'Av. Utinga, 101', "neighborhood": 'Utinga', "phone": '1149971442' },
  { "name": 'Auto Elétrico Utinga', "address": 'Av Utinga 398', "neighborhood": 'Vila Metalúrgica', "phone": '1149974430' },
  { "name": 'A.c. Car Serviços de Mecânica Ltda.', "address": 'Avenida Estados Unidos, 936', "neighborhood": 'Parque das Nações', "phone": '1149761176' },
  { "name": 'Senador Auto Center', "address": 'R. Onze de Junho, 491', "neighborhood": 'Casa Branca', "phone": '11938018858' },
  { "name": 'Qualicenter Auto (Loja 2)', "address": 'Rua Coronel Alfredo Fraques, 510', "neighborhood": 'Centro', "phone": '1149942155' },
  { "name": 'Auto Center Jardim', "address": 'Rua dos Coqueiros, 130', "neighborhood": 'Campestre', "phone": '11947103455' },
  { "name": 'CM RACE Auto Center', "address": 'R. Bezerra de Menezes, 97', "neighborhood": 'Centreville', "phone": '11940380012' },
  { "name": 'Mecânica Ferrarese', "address": 'Estr. do Pedroso, 383', "neighborhood": 'Vila Luzita', "phone": '1149731431' },
  { "name": 'Stanguini Auto Center', "address": 'R. Eusébio de Queirós, 21', "neighborhood": 'Vila Luzita', "phone": '11940380013' },
  { "name": 'MG Auto Elétrico', "address": 'Av. Cap. Mário Toledo de Camargo, 5921', "neighborhood": 'Vila Luzita', "phone": '11940380014' },
  { "name": 'Alemão motos racing', "address": 'R. Eusébio de Queirós, 137', "neighborhood": 'Vila Luzita', "phone": '11940380015' },
  { "name": 'Recuperadora de Carcaças ABC', "address": 'Av. São Bernardo do Campo, 474', "neighborhood": 'Vila Luzita', "phone": '11940380016' },
  { "name": 'Restauração Auto Peças', "address": 'Estr. do Pedroso, 590', "neighborhood": 'Vila Luzita', "phone": '11940380017' },
  { "name": 'HL funilaria e pintura', "address": 'Estr. do Pedroso, 90', "neighborhood": 'Vila Luzita', "phone": '11940380018' },
  { "name": 'Mecânica Diesel 55', "address": 'Rua dos Coqueiros, 55', "neighborhood": 'Campestre', "phone": '1149912077' },
  { "name": 'Centro Automotivo Cestari', "address": 'Avenida Dom Pedro II, 1700', "neighborhood": 'Campestre', "phone": '1149912109' },
  { "name": 'Auto Mecânica Escudeiro', "address": 'Rua Marina, 1134', "neighborhood": 'Campestre', "phone": '1144732161' },
  { "name": 'Auto Mecânica Zancar', "address": 'Rua Marina, 43', "neighborhood": 'Campestre', "phone": '1149911344' },
  { "name": 'Globcar Serviços Automotivos', "address": 'Avenida Dom Pedro II, 3507', "neighborhood": 'Campestre', "phone": '1149916440' },
  { "name": 'Amort Car Comércio de Amortecedores', "address": 'Rua dos Jequitibás, 1063', "neighborhood": 'Campestre', "phone": '1144210088' },
  { "name": 'Mecânica de Autos Sancar', "address": 'Rua Marina, 43', "neighborhood": 'Campestre', "phone": '1144731565' },
  { "name": 'AUTO TÉCNICA BERTELLI MECÂNICA AUTOMOTIVA', "address": 'Alameda São Caetano, 1377', "neighborhood": 'Campestre', "phone": '1144731566' },
  { "name": 'Auto Elétrica Vitalis', "address": 'R. Maria Ortiz, 552', "neighborhood": 'Campestre', "phone": '1144217855' },
  { "name": 'Mega Mecanica', "address": 'R. Jaguarão, 112', "neighborhood": 'Campestre', "phone": '1144731567' },
  { "name": 'Toca do Óleo', "address": 'R. Marina, 1237', "neighborhood": 'Campestre', "phone": '1144731568' },
  { "name": 'Oficina Brasil', "address": 'Rua das Figueiras, 1955', "neighborhood": 'Campestre', "phone": '1144211292' },
  { "name": 'rovicar oficina mecânica', "address": 'R. Joaquim Távora, 291', "neighborhood": 'Vila Assunção', "phone": '1144731569' },
  { "name": 'Mecânica Manesco', "address": 'R. Riachuelo, 269', "neighborhood": 'Vila Assunção', "phone": '1144731570' },
  { "name": 'Revizzi Mecânica Automotiva', "address": 'Av. da Saudade, 115', "neighborhood": 'Vila Assunção', "phone": '1144731571' },
  { "name": 'Cricca', "address": 'R. Paulo Proença, 30', "neighborhood": 'Vila Assunção', "phone": '1144731572' },
  { "name": 'Ind Mecânica Rivaltec Ltda.', "address": 'R. José de Melo, 131', "neighborhood": 'Vila Dora', "phone": '1144731573' },
  { "name": 'Mecanica Wagner', "address": 'Av. Dr. Erasmo, 737', "neighborhood": 'Vila Assunção', "phone": '1144279167' }
]

def sluggify(text):
    text = text.lower()
    text = re.sub(r'[^\w\s-]', '', text)
    text = re.sub(r'[\s]+', '-', text)
    return text.strip('-')

jsonResult = []
for mech in mechanics_data:
    obj = {
        "id": str(uuid.uuid4()),
        "name": mech["name"],
        "type": None,
        "city_id": cityId,
        "category_id": None,
        "neighborhood": mech["neighborhood"],
        "address": mech["address"],
        "whatsapp": mech["phone"],
        "phone": mech["phone"],
        "email": f"{sluggify(mech['name'])}@gmail.com",
        "source": "manual_google",
        "active": True,
        "created_at": "2026-01-05T12:00:00Z",
        "slug": f"{sluggify(mech['name'])}-{citySlug}",
        "category": "mecanica",
        "website": mech.get("website", None),
        "city_slug": citySlug,
        "state": state,
        "creci": None
    }
    jsonResult.append(obj)

with open('c:/Users/Vida/Documents/yai/src/database/seeds/130_real_mechanics_santo_andre.json', 'w', encoding='utf-8') as f:
    json.dump(jsonResult, f, ensure_ascii=False, indent=2)

sql_values = []
for m in jsonResult:
    name_escaped = m['name'].replace("'", "''")
    address_escaped = m['address'].replace("'", "''")
    neighborhood_escaped = m['neighborhood'].replace("'", "''")
    website = f"'{m['website']}'" if m['website'] else "NULL"
    
    val = f"('{m['id']}', '{name_escaped}', '{m['city_id']}', '{neighborhood_escaped}', '{address_escaped}', '{m['whatsapp']}', '{m['phone']}', '{m['email']}', '{m['source']}', true, '{m['slug']}', '{m['category']}', {website}, '{m['city_slug']}', '{m['state']}')"
    sql_values.append(val)

sql_content = "-- Seed para Mecânicas Gerais reais em Santo André, SP\n"
sql_content += "INSERT INTO public.providers (id, name, city_id, neighborhood, address, whatsapp, phone, email, source, active, slug, category, website, city_slug, state)\nVALUES\n"
sql_content += ",\n".join(sql_values) + "\nON CONFLICT (id) DO NOTHING;"

with open('c:/Users/Vida/Documents/yai/src/database/seeds/130_real_mechanics_santo_andre.sql', 'w', encoding='utf-8') as f:
    f.write(sql_content)

print(f"Successfully generated files for {len(mechanics_data)} mechanics.")
