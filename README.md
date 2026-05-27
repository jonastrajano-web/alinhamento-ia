# Alinhamento IA — Seazone

Sistema web para padronizar e agilizar o processo de alinhamento de vagas entre o time de RH e os gestores da Seazone.

> **Projeto entregue em 27/05/2026** — desenvolvido pelo time de Pessoas da Seazone.

## O que o sistema faz

- Recrutador cria uma vaga e gera um **link único** para o gestor
- Gestor preenche o formulário online com todas as informações da vaga
- Recrutador complementa com critérios internos, prioridade e notas
- Sistema gera automaticamente os **prompts de IA** para briefing interno e texto de publicação

## Fluxo

```
Recrutador cria vaga → gera link → envia ao gestor
Gestor preenche o formulário online
Recrutador lê + complementa + gera prompts
Cole o prompt no Claude → receba briefing + texto de publicação
```

## Tecnologias

- HTML + CSS + JavaScript
- [Supabase](https://supabase.com) — banco de dados PostgreSQL
- [Vercel](https://vercel.com) — hospedagem

## Telas

| Tela | URL | Acesso |
|---|---|---|
| Login | `/login.html` | Recrutadores |
| Dashboard | `/index.html` | Recrutadores |
| Nova vaga | `/nova-vaga.html` | Recrutadores |
| Detalhe da vaga | `/vaga.html?id=UUID` | Recrutadores |
| Formulário | `/formulario.html?token=UUID` | Gestores (link enviado) |

## Funcionalidades

- ✅ Formulário de alinhamento com 4 blocos (Contexto, Função, Perfil, Processo)
- ✅ Link único por vaga para o gestor preencher sem login
- ✅ Dashboard com filtro por status
- ✅ Arquivamento de vagas
- ✅ Geração automática de prompts de IA (publicação + briefing interno)
- ✅ Registro de e-mail e data de preenchimento do gestor

## Projeto

Desenvolvido para o time de Pessoas da Seazone — **27/05/2026**.
