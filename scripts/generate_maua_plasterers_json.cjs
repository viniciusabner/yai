const fs = require('fs')
const crypto = require('crypto')

const cityId = '39c9f0ef-38eb-4fb6-9799-d4190c1f6b89' // Placeholder for Maurá City ID

const rawData = [
  // From Web Searches
  { name: 'O Gesseiro Mauá', phone: '11983630155', whatsapp: '11983630155', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Gesso São Jorge', phone: '1143090886', whatsapp: '11977228729', address: 'Av. José Ricardo Nalle, 765', neighborhood: 'Jardim São Jorge do Guapituba' },
  { name: 'Gesso Líder', phone: '1145137577', whatsapp: '11998433483', address: 'Rua Pres. Vital Humberto Batista Soares, 36', neighborhood: 'Parque São Vicente' },
  { name: 'Gesso Novo Padrão', phone: '1145474659', whatsapp: '1145474659', address: 'R. João Bento, 148', neighborhood: 'Jardim Zaira' },
  { name: 'Alto Estilo Gesso', phone: '1145412199', whatsapp: '1127861613', address: 'Av. Presidente Castelo Branco, 538', neighborhood: 'Jardim Zaira' },
  { name: 'Gesso Divisa', phone: '1145139021', whatsapp: '11978683225', address: 'Av. Capitão João, 1173-B', neighborhood: 'Vila Vitória' },
  { name: 'Alto Padrão Gesso', phone: '1145474659', whatsapp: '1145474659', address: 'Avenida Saturnino João da Silva, 609', neighborhood: 'Jardim Zaira' },
  { name: 'Art Gesso Progresso', phone: '1145412851', whatsapp: '1145412851', address: 'Rua Gerber Wolfgang, 529', neighborhood: 'Jardim Oratório' },
  { name: 'Construwall Gesso e Construção', phone: '11966999734', whatsapp: '11966999734', address: 'Rua Leonel Lima e Silva, 753 casa1', neighborhood: 'IV Centenário' },
  { name: 'Artedivi Drywall divisórias e forros', phone: '11970187482', whatsapp: '11970187482', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Dap Steel', phone: '1134597275', whatsapp: '1134597275', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Gesso e Venda de Materiais', phone: '11934705479', whatsapp: '11934705479', address: 'R. Caetano Aletto, 344', neighborhood: 'Jardim Itapark Velho' },
  { name: 'Jomag', phone: '11996171090', whatsapp: '11996171090', address: 'Mauá, SP', neighborhood: 'Centro' },
  { name: 'Gesso Laura', phone: '1145482515', whatsapp: '11973505123', address: 'Av. Br. de Mauá, 2506', neighborhood: 'Jardim Maringá' },
  
  // From 65_maua_plasterer.sql (verified only)
  { name: 'JCG Divisórias e Forros', phone: '11954628630', whatsapp: '11954628630', address: 'R. dos Jasmin, 297', neighborhood: 'Jardim Primavera' },
  { name: 'Divisórias.Com', phone: '1127861063', whatsapp: '1127861063', address: 'Av. João Ramalho, 1821', neighborhood: 'Vila Noemia' },
]

const validData = rawData.filter(d => {
    const rawNumber = d.phone || d.whatsapp;
    if (!rawNumber) return false;
    if (rawNumber.includes('9999') || rawNumber.includes('8888') || rawNumber.includes('7777') || rawNumber.includes('6666')) return false;
    return true;
});

// Deduplicate by phone
const uniqueData = []
const seen = new Set()
validData.forEach(item => {
  const key1 = item.phone ? item.phone.replace(/\D/g, '') : null;
  const key2 = item.whatsapp ? item.whatsapp.replace(/\D/g, '') : null;
  
  // Custom fix for Gesso Novo Padrão and Alto Padrão Gesso sharing same number
  if(key1 === '1145474659' && item.name === 'Alto Padrão Gesso') return;
  
  if ((key1 && seen.has(key1)) || (key2 && seen.has(key2))) {
      return; 
  }

  if (key1) seen.add(key1);
  if (key2) seen.add(key2);
  
  uniqueData.push(item)
})

const jsonOutput = uniqueData.map(p => ({
  id: crypto.randomUUID(),
  name: p.name,
  type: 'company',
  city_id: cityId,
  category_id: null,
  neighborhood: p.neighborhood,
  address: p.address,
  whatsapp: p.whatsapp ? p.whatsapp.replace(/\D/g, '') : null,
  phone: p.phone ? p.phone.replace(/\D/g, '') : null,
  email: null,
  source: 'manual_google',
  active: true,
  created_at: new Date('2026-02-13T12:00:00').toISOString(),
  slug: p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-') + '-maua',
  category: 'gesseiro',
  website: null,
  city_slug: 'maua',
  state: 'SP',
  creci: null
}))

fs.writeFileSync('plasterers_maua.json', JSON.stringify(jsonOutput, null, 2))
console.log(`Generated ${jsonOutput.length} plasterers in plasterers_maua.json`)
