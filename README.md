# 🚀 Logística Interplanetária

Um aplicativo Flutter inovador para gerenciamento de envios logísticos entre planetas, permitindo o rastreamento em tempo real, análise de dados e controle completo de operações espaciais.

## 📋 Visão Geral

**Logística Interplanetária** é uma aplicação mobile desenvolvida em Flutter que simula um sistema avançado de logística para entregas no sistema solar. O aplicativo permite gerenciar envios, rastrear pacotes em tempo real, visualizar análises detalhadas e obter relatórios completos sobre operações logísticas.

### Características Principais
- ✅ **Dashboard intuitivo** com estatísticas gerais
- ✅ **Gerenciamento de envios** com filtros por status
- ✅ **Rastreamento em tempo real** de pacotes
- ✅ **Relatórios analíticos** detalhados
- ✅ **Interface moderna** com tema Material Design 3
- ✅ **Experiência de onboarding** completa com splash screen e intro

---

## 🎯 Fluxo da Aplicação

### Diagrama de Navegação

```
┌─────────────────────────────────────────────────────────────────┐
│                         INICIALIZAÇÃO                            │
└───────────────────────┬─────────────────────────────────────────┘
                        │
                        ▼
         ┌──────────────────────────────┐
         │   SPLASH SCREEN (3 segundos) │
         │  • Logo da aplicação         │
         │  • Animação de entrada       │
         └──────────┬───────────────────┘
                    │
                    ▼
         ┌──────────────────────────────┐
         │   INTRO SCREEN (4 telas)     │
         │  • Bem-vindo                 │
         │  • Rastreamento em Tempo Real│
         │  • Análises Detalhadas       │
         │  • Gerenciamento Completo    │
         └──────────┬───────────────────┘
                    │
                    ▼
         ┌──────────────────────────────────────────┐
         │   MAIN NAVIGATION SCREEN                 │
         │   (Bottom Navigation Bar com 4 abas)     │
         └───┬─────────────┬──────────┬──────────┬──┘
             │             │          │          │
             ▼             ▼          ▼          ▼
        ┌────────────┐ ┌────────┐ ┌────────┐ ┌─────────┐
        │ Dashboard  │ │ Envios │ │ Rastr. │ │Relatórios│
        └────────────┘ └───┬────┘ └────────┘ └─────────┘
                           │
                           ▼
                    ┌──────────────────┐
                    │ Detalhes do Envio│
                    └──────────────────┘
```

---

## 📱 Descrição das Telas

### 1. **Splash Screen** ⏱️
**Duração:** 3 segundos

A primeira tela exibida quando o usuário inicia a aplicação.

**Características:**
- Logo/título da aplicação
- Animação suave de fade-in
- Transição automática para a tela de introdução
- Tema roxo profissional

**Componentes:**
```
┌─────────────────────────────────┐
│                                 │
│     [Logo Animado]              │
│                                 │
│  LOGÍSTICA INTERPLANETÁRIA      │
│                                 │
└─────────────────────────────────┘
```

---

### 2. **Intro Screen** 📚
**Duração:** Até o usuário concluir

Guia onboarding com 4 telas introdutórias explicando as funcionalidades principais.

**Páginas de Intro:**

**Página 1 - Bem-vindo**
```
┌─────────────────────────────────┐
│  🚀                             │
│                                 │
│  Bem-vindo à Logística          │
│  Interplanetária                │
│                                 │
│  Gerencie seus envios entre     │
│  planetas com segurança e       │
│  eficiência.                    │
│                                 │
│  [Próximo]                      │
└─────────────────────────────────┘
```

**Página 2 - Rastreamento em Tempo Real**
```
┌─────────────────────────────────┐
│  📍                             │
│                                 │
│  Rastreamento em Tempo Real     │
│                                 │
│  Acompanhe suas encomendas em   │
│  todo o sistema solar com       │
│  precisão.                      │
│                                 │
│  [Próximo]                      │
└─────────────────────────────────┘
```

**Página 3 - Análises Detalhadas**
```
┌─────────────────────────────────┐
│  📊                             │
│                                 │
│  Análises Detalhadas            │
│                                 │
│  Visualize relatórios completos │
│  sobre seus envios e operações. │
│                                 │
│  [Próximo]                      │
└─────────────────────────────────┘
```

**Página 4 - Gerenciamento Completo**
```
┌─────────────────────────────────┐
│  ⚙️                              │
│                                 │
│  Gerenciamento Completo         │
│                                 │
│  Controle total sobre suas      │
│  operações logísticas           │
│  interplanetárias.              │
│                                 │
│  [Começar] [Pular]              │
└─────────────────────────────────┘
```

**Características:**
- 4 páginas com ícones temáticos
- Navegação por dots indicadores de página
- Botões "Próximo" e "Pular"
- Transição automática após conclusão

---

### 3. **Main Navigation Screen** 🗂️
**Tela Principal:**

Página com navegação por abas inferiores que integra todas as funcionalidades principais.

```
┌─────────────────────────────────────────┐
│                                         │
│     [Conteúdo das Telas Principais]     │
│                                         │
│                                         │
├─────────────────────────────────────────┤
│ 📊    📦    📍    📈                     │
│ Dashboard Envios Rast. Relatórios      │
└─────────────────────────────────────────┘
```

**Bottom Navigation Bar:**
- **Dashboard** (Ícone: 📊)
- **Envios** (Ícone: 📦)
- **Rastreamento** (Ícone: 📍)
- **Relatórios** (Ícone: 📊)

---

#### 3.1 **Dashboard Screen** 📊
**Localização:** Aba 1 da navegação principal

Painel de controle com resumo de operações.

**Exibições:**
- Card de boas-vindas com tema roxo
- 4 cartões de estatísticas (Envios Ativos, Entregues, Peso Total, Taxa de Sucesso)
- Seção de atividades recentes

---

#### 3.2 **Shipments Screen** 📦
**Localização:** Aba 2 da navegação principal

Gerenciamento completo de envios com filtros.

**Recursos:**
- **Filtros por Status:** Todos, Pendente, Em Rota, Entregue
- **Cards de Envio** com informações:
  - ID do envio
  - Origem e destino
  - Status atual
  - Peso
  - Data de chegada estimada
- **Clique em um card** → Abre Detalhes do Envio

---

#### 3.3 **Shipment Details Screen** 🔍
**Localização:** Navega da tela de Envios

Visualização detalhada de um envio específico.

**Seções:**
- Card de status com destaque
- Informações básicas (ID, Peso)
- Rota (Origem → Destino)
- Datas importantes
- Timeline de rastreamento com etapas

---

#### 3.4 **Tracking Screen** 📍
**Localização:** Aba 3 da navegação principal

Rastreamento real-time de envios por ID.

**Recursos:**
- **Barra de Pesquisa** para inserir ID do envio
- **Estado Vazio** com instrução
- **Detalhes de Rastreamento:**
  - Status do envio
  - Localização atual
  - Velocidade
  - Tempo restante
  - Próximas paradas

**Dados de Exemplo:**
```
SHP001: Em rota para Marte - 45 dias restantes
SHP002: Entregue em Europa - 26/05/2026
SHP003: Aguardando despacho - Partida em 10/06/2026
SHP004: Em rota para Lua - 35 dias restantes
SHP005: Cancelado por pedido do cliente
SHP006: Em rota para Marte - 50 dias restantes
```

---

#### 3.5 **Reports Screen** 📊
**Localização:** Aba 4 da navegação principal

Análises e relatórios detalhados sobre operações.

**Abas de Relatórios:**

1. **Resumo** - Visão geral de operações
2. **Eficiência** - Métricas de performance
3. **Rotas** - Análise de rotas mais utilizadas
4. **Comparativo** - Comparação de períodos

---

## 🚀 Fluxo de Navegação Detalhado

### Primeira Execução (Novo Usuário)
```
Inicializar App
    ↓
SplashScreen (3s)
    ↓
IntroScreen (4 páginas)
    ↓
MainNavigationScreen
```

### Execução Subsequente (Usuário Retornando)
```
Inicializar App
    ↓
MainNavigationScreen (direto)
```

### Navegação Dentro da Aplicação
```
MainNavigationScreen
    ├── Dashboard (aba 0)
    ├── ShipmentsScreen (aba 1)
    │   └── [Clique em card]
    │       └── ShipmentDetailsScreen
    ├── TrackingScreen (aba 2)
    │   └── [Buscar por ID]
    │       └── Exibe detalhes
    └── ReportsScreen (aba 3)
        └── [Selecionar aba]
            └── Exibe relatório
```

---

## 💾 Dados Simulados

A aplicação utiliza dados mock (fictícios) para demonstração:

### Envios Disponíveis
| ID | Origem | Destino | Status | Peso | Partida | Chegada Est. |
|----|--------|---------|--------|------|---------|--------------|
| SHP001 | Terra | Marte | Em Rota | 150 kg | 01/05 | 15/07 |
| SHP002 | Terra | Europa | Entregue | 200 kg | 20/04 | 26/05 |
| SHP003 | Terra | Lua | Pendente | 75 kg | 10/06 | 15/06 |
| SHP004 | Terra | Lua | Em Rota | 120 kg | 25/04 | 05/06 |
| SHP005 | Terra | Marte | Cancelado | 180 kg | - | - |
| SHP006 | Marte | Terra | Em Rota | 250 kg | 01/04 | 20/06 |

---

## 📝 Notas de Desenvolvimento

- A aplicação usa dados simulados. Para integração com API real, implemente em `shipment_service.dart`
- O estado de splash/intro é gerenciado no `main.dart` com `bool flags`
- As telas usam `IndexedStack` para manter estado ao navegar
- Considere implementar persistência com SharedPreferences para guardar estado de onboarding

---