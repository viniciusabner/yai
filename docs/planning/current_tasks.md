# Histórico e Status de Tarefas (Yai MVP)

## 1. Messaging Flow & Chat Reliability
- [x] **Mass Messaging Flow**
    - [x] Make message input mandatory on Results page
    - [x] Split Action Bar: WhatsApp vs Chat buttons
    - [x] Implement `sendMessageToProviders` logic in `messaging.service.ts`
    - [x] Connect "Chat" button to service in `Results/index.tsx`
- [ ] **Chat Improvements**
    - [ ] Implement Message Polling (Backup) in `useMessagePoller.ts`
    - [ ] Implement Unread Counter in Header
    - [ ] Implement "Mark as Read" logic

## 2. Authentication & Security
- [x] Implement "Remember Me" (Persist Session)

## 3. Categories & Content
- [x] Fix Desktop Responsiveness
- [x] Add New UI Badges
- [ ] Create seed for "Paisagismo e Hortas" category

## 4. Verification
- [x] Verify messaging flow in the browser
- [x] Verify "Remember Me" persistence
- [x] Verify category visibility on Home and Results pages

## 5. Onboarding & Sustentabilidade
- [x] Criar Dicionários Globais de Categorias e Cidades (`src/constants/`)
- [x] Adicionar Banner CTA na Home Page focado no Chat Interno
- [x] Criar Rota `/para-profissionais` (Landing Page de Recrutamento)
- [x] Refatorar Formulário de Perfil (`CompleteProfileModal`) para usar listas universais
- [x] Criar Tela de Sucesso Pós-Cadastro / Notificação Gamificada
