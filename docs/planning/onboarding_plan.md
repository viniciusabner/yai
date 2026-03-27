# Plano Estratégico: Onboarding de Profissionais (Self-Sustaining Flow)

O objetivo principal é reduzir o atrito de entrada para novos prestadores de serviço e garantir que, desde o primeiro acesso ao site, fique claro que o Yai é uma plataforma para **divulgar serviços gratuitamente** e receber orçamentos pelo WhatsApp.

Abaixo está o plano dividido em épicos e tarefas acionáveis para futura implementação:

---

## Épico 1: Atração e Descoberta Visual (Home)
Focar na experiência de quem acabou de entrar no site e ainda não sabe que pode anunciar.

- [x] **1.1. Adicionar CTA (Call to Action) na Home:** Inserir um banner ou uma faixa visível (ex: entre as seções de categorias) chamando a atenção.
- [x] **1.2. Criar Página de Pouso (Landing Page) para Profissionais (`/para-profissionais`):** Criar uma rota dedicada que explica os três maiores benefícios visuais.
- [ ] **1.3. Otimizar o Header:** Alterar o botão "Cadastrar" no cabeçalho para separar ou dar opções claras ao clicar.

## Épico 2: Fluxo de Cadastro "Fricção Zero"
Garantir que o fornecimento de dados iniciais seja extremamente rápido.

- [ ] **2.1. Criar Rota de Cadastro de Prestador (`/cadastro-prestador`):** Isolar o fluxo do cliente padrão. 
- [x] **2.2. Implementar Formulário Step-by-Step (Passo a Passo):** Em vez de uma tela longa, criar passos encorajadores.

## Épico 3: Dicionário Unificado de Categorias (Disponibilidade Total)
Permitir que profissionais se cadastrem em categorias que ainda não possuem demanda ou concorrentes.

- [x] **3.1. Consolidar Categorias (Fonte Única de Verdade):** Criar um módulo/arquivo master (`constants/categories.ts`).
- [x] **3.2. Refatorar Seleção no Formulário:** Implementar componente de busca/autocomplete.
- [ ] **3.3. Tática de Escassez/Pioneirismo:** Mensagem gamificada nas categorias vazias.

## Épico 4: Pós-Cadastro e Engajamento
Não abandonar o prestador em um "painel de controle vazio" após ele se cadastrar.

- [x] **4.1. Redirecionamento Imediato para "Sua Vitrine":** Ao concluir, enviar para a página de `/results`.
- [ ] **4.2. Adicionar Tag "Novo Ano" (Opcional):** Dar uma tag automática.
- [ ] **4.3. Upsell para Completar Perfil (Gamificação):** Mostrar uma barra de progresso.
