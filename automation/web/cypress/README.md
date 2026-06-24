# Testes Automatizados com Cypress

Este projeto utiliza o Cypress para execução de testes automatizados end-to-end (E2E).

## Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- Node.js (versão 18 ou superior recomendada)
- npm (instalado junto com o Node.js)

Para verificar as versões:

```bash
node -v
npm -v
```

## Instalação do Projeto

1. Clone o repositório:

```bash
git clone <URL_DO_REPOSITORIO>
```

2. Acesse a pasta do projeto:

```bash
cd automation/cypress
```

3. Instale as dependências:

```bash
npm install
```

## Instalação do Cypress

Caso o Cypress ainda não esteja listado nas dependências do projeto:

```bash
npm install cypress --save-dev
```

## Abrir o Cypress (Modo Interativo)

Para abrir a interface gráfica do Cypress:

```bash
npx cypress open
```

Selecione:

- E2E Testing
- Navegador desejado (Chrome, Edge ou Electron)
- Teste que deseja executar

## Executar Todos os Testes em Modo Headless

```bash
npx cypress run
```

## Executar Testes em Navegador Específico

Chrome:

```bash
npx cypress run --browser chrome
```

Edge:

```bash
npx cypress run --browser edge
```

Firefox:

```bash
npx cypress run --browser firefox
```

## Executar Apenas um Arquivo de Teste

```bash
npx cypress run --spec "cypress/e2e/login.cy.js"
```

## Estrutura do Projeto

```text
cypress/
├── e2e/
│   ├── login.cy.js
│   ├── cadastro.cy.js
│   └── pedidos.cy.js
├── fixtures/
├── support/
└── downloads/

cypress.config.js
package.json
```

## Configuração de Ambiente

Caso o projeto utilize variáveis de ambiente, configure o arquivo `.env`:

```env
BASE_URL=https://homologacao.exemplo.com
USUARIO_TESTE=usuario
SENHA_TESTE=senha
```

## Executar Testes em Ambiente Específico

Homologação:

```bash
npx cypress run --env environment=hml
```

Produção:

```bash
npx cypress run --env environment=prd
```

## Gerar Relatórios (Caso Configurado)

Após a execução dos testes:

```bash
npm run report
```

Os relatórios estarão disponíveis em:

```text
cypress/reports/
```

## Scripts Disponíveis

```bash
npm run cy:open
```

Abre o Cypress em modo interativo.

```bash
npm run cy:run
```

Executa todos os testes em modo headless.

```bash
npm run test:e2e
```

Executa a suíte completa de testes E2E.

## Solução de Problemas

### Limpar Cache do Cypress

```bash
npx cypress cache clear
```

### Reinstalar Dependências

```bash
rm -rf node_modules package-lock.json
npm install
```

### Verificar Instalação do Cypress

```bash
npx cypress verify
```

## Documentação

Para mais informações sobre Cypress:

https://docs.cypress.io