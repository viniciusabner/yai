# Prompt — Busca de Prestadores de Serviço em Rio Grande da Serra (SP)

---

## Contexto do Projeto

Você está ajudando a popular o banco de dados do app **Yai** — um diretório de prestadores de serviços locais do Grande ABC (SP). Os dados são inseridos via SQL no Supabase usando o padrão descrito abaixo.

### Regras críticas (não negociáveis):
- **NUNCA inventar dados.** Apenas prestadores **reais e verificáveis** (Google Maps, sites, telefones que existem).
- **Sem telefones duplicados** entre prestadores diferentes.
- **Sem plataformas nacionais** (ex: GetNinjas, Cronoshare, StarOfService, Doutor Resolve) — apenas negócios locais ou profissionais autônomos reais.
- `whatsapp` e `phone` apenas com dígitos, com DDD: `11999999999` (sem +, traços ou espaços). Se não souber, use `null`.
- `slug` deve ser único, no formato `nome-empresa-rio-grande-da-serra`.
- `category` deve ser **exatamente** o slug listado para cada categoria abaixo.
- `city_id` sempre como subquery: `(SELECT id FROM public.cities WHERE slug='rio-grande-da-serra')`
- `city_slug` = `'rio-grande-da-serra'`
- `state` = `'SP'`
- `source` = `'manual_google'`
- `active` = `true`

---

## Cidade Alvo

**Rio Grande da Serra — SP** (cidade menor da região, ~50k habitantes, próxima a Ribeirão Pires e Mauá)

> Muitos prestadores da região atendem de cidades vizinhas. Se o prestador é de Ribeirão Pires ou Mauá mas atende Rio Grande da Serra, pode incluir, mas marque isso na observação.

---

## Categorias Necessárias

Gere os dados para **cada uma das categorias abaixo**, produzindo:
1. Um arquivo **JSON** com os dados estruturados
2. Um arquivo **SQL** pronto para rodar no Supabase

---

### 1. `imobiliaria` — Imobiliárias
**Arquivo:** `290_real_imobiliaria_rgs.sql`
**Meta:** 5–10 prestadores
**Já existem (não duplicar slugs):**
- `eduardo-imoveis-rio-grande-da-serra`
- `genivaldo-batista-rio-grande-da-serra`
- `skr-negocios-rio-grande-da-serra`
- `imoveis-monteiro-rio-grande-da-serra`

---

### 2. `pedreiro` — Pedreiros / Reformas
**Arquivo:** `291_real_pedreiro_rgs.sql`
**Meta:** 5–8 prestadores
**Observação:** Não há dados anteriores válidos. Buscar autônomos e pequenas construtoras que atendam RGS.

---

### 3. `marido_aluguel` — Marido de Aluguel
**Arquivo:** `292_real_marido_aluguel_rgs.sql`
**Meta:** 5–8 prestadores
**Já existem (não duplicar slugs):**
- `marido-de-aluguel-sp-rio-grande-da-serra`
- `sos-solucoes-rio-grande-da-serra`

**Descartar** (eram plataformas genéricas, não locais):
- Cronoshare, StarOfService, Doutor Resolve, Master House, Assistência Litt

---

### 4. `eletricista` — Eletricistas
**Arquivo:** `293_real_eletricista_rgs.sql`
**Meta:** 5–8 prestadores
**Observação:** Os dados anteriores tinham telefones duplicados e emails fictícios. Buscar do zero. Priorizar prestadores com telefone real.

---

### 5. `encanador` — Encanadores
**Arquivo:** `294_real_encanador_rgs.sql`
**Meta:** 5–8 prestadores
**Já existe 1 válido (não duplicar slug):**
- `sos-prestadora-de-servicos-rio-grande-da-serra`

**Descartar:** entradas com o telefone `11948931000` (aparecia em múltiplas categorias — fictício).

---

### 6. `jardineiro` — Jardineiros
**Arquivo:** `295_real_jardineiro_rgs.sql`
**Meta:** 4–8 prestadores
**Já existem (não duplicar slugs):**
- `native-garden-rio-grande-da-serra`
- `equipe-garden-paisagismo-rio-grande-da-serra`
- `grupo-brasanitas-rio-grande-da-serra`
- `global-pedras-paisagismo-rio-grande-da-serra`

**Observação:** Se confirmar que os 4 acima são reais, podem ser mantidos. Buscar mais se possível.

---

### 7. `lavanderia` — Lavanderias
**Arquivo:** `296_real_lavanderia_rgs.sql`
**Meta:** 3–6 prestadores
**Já existe 1 válido (não duplicar slug):**
- `lavanderia-lavo-rio-grande-da-serra`

**Observação:** Cidade pequena — se não houver mais locais, indicar qual prestador de Ribeirão Pires ou Mauá atende a região.

---

### 8. `limpeza_pos_obra` — Faxina & Limpeza Profissional
**Arquivo:** `297_real_limpeza_rgs.sql`
**Meta:** 4–8 prestadores
**Observação:** Não há dados anteriores. Buscar equipes de limpeza que atendam RGS (pode ser de cidade vizinha se atender a região).

---

### 9. `personal_organizer` — Personal Organizer
**Arquivo:** `298_real_personal_organizer_rgs.sql`
**Meta:** 2–5 prestadores
**Observação:** Profissão autônoma — buscar na região do Alto Tietê/Grande ABC que atendam RGS. Não há dados anteriores.

---

## Padrão SQL Obrigatório

```sql
-- [NN]_real_[categoria]_rgs.sql
-- [NOME DA CATEGORIA] — Rio Grande da Serra
-- Fonte: Pesquisa manual Google/Maps
-- Total: X registros

INSERT INTO public.providers (
  id, name, type, city_id, category_id, neighborhood, address,
  whatsapp, phone, email, source, active, created_at, slug,
  category, website, city_slug, state, creci
) VALUES
(
  gen_random_uuid(),
  'Nome Real do Prestador',
  null,
  (SELECT id FROM public.cities WHERE slug='rio-grande-da-serra'),
  null,
  'Bairro',
  'Rua Real, 123',
  '11999999999',
  '11999999999',
  null,
  'manual_google',
  true,
  now(),
  'slug-unico-prestador-rio-grande-da-serra',
  'categoria_slug',
  null,
  'rio-grande-da-serra',
  'SP',
  null
)
ON CONFLICT (slug) DO UPDATE SET
  category = EXCLUDED.category,
  city_id = EXCLUDED.city_id,
  active = EXCLUDED.active;
```

---

## Padrão JSON Correspondente

```json
[
  {
    "id": "gen_random_uuid()",
    "name": "Nome Real do Prestador",
    "type": null,
    "city_id": "Rio Grande da Serra",
    "category_id": null,
    "neighborhood": "Bairro",
    "address": "Rua Real, 123",
    "whatsapp": "11999999999",
    "phone": "11999999999",
    "email": null,
    "source": "manual_google",
    "active": true,
    "created_at": "2026-03-30T12:00:00",
    "slug": "slug-unico-prestador-rio-grande-da-serra",
    "category": "categoria_slug",
    "website": null,
    "city_slug": "rio-grande-da-serra",
    "state": "SP",
    "creci": null
  }
]
```

---

## Entrega Esperada

Para cada categoria (9 no total), entregar:
- `NNN_real_[categoria]_rgs.json` — array com os dados
- `NNN_real_[categoria]_rgs.sql` — INSERT pronto para rodar no Supabase

Salvar em: `src/database/seeds/`

> Se não encontrar dados reais para alguma categoria, **informe explicitamente** ao invés de inventar dados.
