# Yai — Plataforma de Conexão com Prestadores de Serviços do ABC Paulista

## Sobre o Projeto

**Yai** conecta moradores do ABC Paulista a prestadores de serviços locais — de mecânicos e eletricistas a psicólogos, pet shops e paisagistas.

## Como Rodar

```bash
yarn install
npm run dev
```

Acesse em `http://localhost:5173`. Requer variáveis de ambiente em `.env`:
```
VITE_SUPABASE_URL=...
VITE_SUPABASE_ANON_KEY=...
```

## Estrutura do Projeto

```
yai/
├── .context/           # 📚 Documentação para I.A. e desenvolvedores
│   ├── CONTEXT.md      # Visão geral e ponto de entrada principal
│   ├── ARCHITECTURE.md # Serviços, componentes, hooks e fluxo de dados
│   ├── CATEGORIES.md   # Todas as categorias e slugs
│   ├── DATABASE_SCHEMA.md  # Schema do banco e RLS
│   ├── SEED_GUIDE.md   # Como criar novos seeds de dados
│   └── PROJECT_STATUS.md   # Status das tarefas
├── data/
│   └── raw_seeds/      # 📦 JSONs brutos de pesquisa (pré-seed)
├── src/
│   ├── app/            # Router
│   ├── components/     # Componentes React reutilizáveis
│   ├── database/       # Migrations, Seeds SQL e Queries
│   ├── hooks/          # Custom hooks
│   ├── pages/          # Páginas da aplicação
│   ├── services/       # Integração com Supabase
│   ├── store/          # Estado global (Zustand)
│   └── utils/          # Utilitários
└── README.md
```

## Documentação para I.A.

Toda a documentação detalhada do projeto está na pasta **`.context/`**. Ao iniciar um novo chat com um agente de I.A., instrua-o a ler `.context/CONTEXT.md` primeiro.

- **Tech Stack:** React 19 + TypeScript + Vite + Tailwind + Supabase + Zustand
- **Cidades alvo:** Santo André, São Bernardo do Campo, São Caetano do Sul, Diadema, Mauá, Ribeirão Pires, Rio Grande da Serra
