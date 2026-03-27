# Plano de Testes QA - Yai Platform

Este documento contém os cenários de teste exaustivos para a validação de todas as funcionalidades principais e casos extremos da plataforma Yai. 

**Status:** Rascunho / Para Execução Manual Múltipla.

---

## Módulo 1: Busca e Listagem de Prestadores (O Core do Problema Resolvido)

### Cenário 1.1: Busca Simples (Caminho Feliz)
- **Pré-condição:** Estar na Home e não estar logado.
- **Ação:** 
  1. Selecione a cidade "Santo André" no menu superior. 
  2. Clique na categoria "Imobiliárias".
- **Resultado Esperado:** Transição suave para `/results`. A barra superior deve exibir "X resultados em Santo André". A lista deve carregar apenas prestadores com `category === 'imobiliaria'` em Santo André. Nenhuma listagem deve aparecer vazia se existirem mocks.

### Cenário 1.2: Busca Interrompida por Falta de Cidade
- **Pré-condição:** Estar na página Home e desmarcar todas as cidades.
- **Ação:** Clicar direto em uma categoria (ex: "Mecânica").
- **Resultado Esperado:** O Modal de Cidades deve pular na tela forçando a seleção de uma cidade. O redirecionamento só deve ocorrer *após* a confirmação de pelo menos uma localidade.

### Cenário 1.3: Busca Multicidades
- **Pré-condição:** Home carregada.
- **Ação:** Abrir o seletor de Cidades e escolher simultaneamente "Santo André" e "Diadema". Em seguida, buscar por "Eletricista".
- **Resultado Esperado:** O título deve exibir "Resultados em 2 cidades" ou "Múltiplas cidades". Os cartões retornados devem misturar contatos de Santo André e Diadema dinamicamente.

### Cenário 1.4: Retorno Zero Assíncrono (Tratamento Visual)
- **Pré-condição:** Cidades e parâmetros definidos perfeitamente.
- **Ação:** Selecionar uma cidade/região sem nenhum mock associado à categoria "Automação Residencial" (que tipicamente não tem inserções).
- **Resultado Esperado:** O ícone e a mensagem Empty State ("Nenhuma empresa encontrada") devem renderizar perfeitamente no centro, orientando o usuário a trocar a região. NUNCA a tela deve ficar branca ou travar.

### Cenário 1.5: Refresh na Tela de Resultados
- **Pré-condição:** Estar na URL `/results` (já com busca carregada no Context/Store).
- **Ação:** Dar um "Hard Refresh" (F5) no navegador.
- **Resultado Esperado:** Pelo fato das escolhas não estarem persistidas em URL params mas sim em estado de memória (Zustand não persistido), o estado das cidades pode voltar vazio e o sistema deve forçar um redirecionamento inteligente e fluído de volta para a `/` (Home), sem piscar erro 404/500 de API.

---

## Módulo 2: Interações e Contato Simultâneo

### Cenário 2.1: Envio com Mensagem Vazia (Prevenção)
- **Pré-condição:** Estar na página `/results` com prestadores na tela.
- **Ação:** Deixar o campo de mensagem em branco e tentar clicar em "WhatsApp" ou "Chat".
- **Resultado Esperado:** Ambos os botões de ação e o botão principal do footer devem estar visualmente *desabilitados* ou acionar uma cor vermelha (state de erro) no campo de texto exigindo o preenchimento.

### Cenário 2.2: Envio Individual via Modal de Perfil (Vazamento)
- **Pré-condição:** Estar em `/results`, abrir o modal de Perfil (Clicando no Cartão) de uma empresa sem WhatsApp (se houver).
- **Ação:** Tentar clicar em WhatsApp.
- **Resultado Esperado:** O botão deve estar inativo/cinza, com a mensagem "Sem WhatsApp" avisando sobre a ausência de info do prestador.

### Cenário 2.3: Chat Interno (Fluxo Logado vs Deslogado)
- **Pré-condição:** Estar na página `/results` e redigir uma mensagem de teste.
- **Ação A (Deslogado):** Clique em "Chat" com empresas selecionadas.
  - **Resultado Esperado:** Um Modal Interceptador (Upsell) deve abrir exibindo "Crie sua conta ou faça login para conversar".
- **Ação B (Logado):** Realizar Login com sucesso e clicar em "Chat".
  - **Resultado Esperado:** A conversa deve ser criada no banco (`contact_events` e nova tabela de mensagens), encaminhando para a página `/inbox` com o histórico populado.

---

## Módulo 3: Responsividade Cross-Device (Mobile)

### Cenário 3.1: Estouro do Axis-X (O Bug do Overflow)
- **Pré-condição:** Simular em Device iPhone SE (320px width) ou via DevTools.
- **Ação:** Acessar a Home Page e fazer scrolling vertical para cima e para baixo. Tentativa de fazer pan (arrastar) horizontal numa área vazia do fundo (body).
- **Resultado Esperado:** O layout NÃO pode "escorregar" nem mostrar faixa branca ao lado direito. O corpo do app é blindado e cimentado.

### Cenário 3.2: Swipe Limitado nos Carrosséis
- **Pré-condição:** Ainda na view Mobile 320px.
- **Ação:** Tentar arrastar o dedo lateralmente em cima dos "Filtros de Macrocategorias (Saúde, Pet, etc)" e dos "Banners".
- **Resultado Esperado:** Os elementos devem deslizar com inércia (`snapshot`/nativo), sem barras de rolagem nativas poluidoras (`hide-scrollbar`), e somente o seu conteúdo invisível entra nas margens da tela de forma independente, provando o sucesso do `overflow-x-auto w-full`.

---

## Módulo 4: Onboarding (Prestadores de Serviço)

### Cenário 4.1: Cadastro pela Rota Landing Page (`/para-profissionais`)
- **Pré-condição:** Usuário deslogado clica no CTA Roxo da Home.
- **Ação:** O botão "Criar Perfil Grátis" deve enviar o usuário à tela de criação de anúncio. O modal de criar perfil deve apresentar dados limpos (inclusive, utilizando a categorização em blocos: Saúde, Casa, etc.).
- **Resultado Esperado:** O formulário deve validar dados mandatórios (telefone, título) antes de deixar continuar. Após a conclusão, a tela de redirecionamento "Gamificado" entra em cena mostrando com emojis o sucesso.

### Cenário 4.2: Conflito de UUID vs Slug no Insert do Perfil
- **Ação de Risco (Exaustiva):** O usuário preenche todos os dados. Na seleção de cidade, ao escolher "Santos" (slug: santos, sem uuid atrelado ainda ou uuid em branco).
- **Resultado Esperado:** Se a cidade ainda não estiver sincronizada inteiramente na tabela do banco, o código do Front resgata o slug e mapeia gentilmente apenas para `city_slug`, inserindo perfeitamente no Supabase e ativando-se para futuras queries globais sem corromper (dando o error type uuid 400).

---

## Ações Sugeridas para Próxima Fase Prática
- Definir *scripts* automatizados (Cypress ou Playwright) para rodar o Cenário 1.1 e 1.2 continuamente a fim de atestar que a API da Supabase tem sempre tempo de ida e volta e não barra nada por Row Level Security em ambiente logado.
