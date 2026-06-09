# Plano de Testes – QA E-commerce Project (ServeRest)

## 1. Objetivo

Garantir a qualidade, confiabilidade e funcionamento correto das funcionalidades da aplicação ServeRest, validando os fluxos de autenticação, gerenciamento de usuários, produtos e carrinho de compras, por meio de testes manuais, automatizados e de API.

---

## 2. Escopo

### Funcionalidades em Escopo

* Cadastro de usuários
* Login de usuários
* Consulta de usuários
* Edição de usuários
* Exclusão de usuários
* Cadastro de produtos
* Consulta de produtos
* Edição de produtos
* Exclusão de produtos
* Criação de carrinho
* Consulta de carrinho
* Conclusão de compra
* Cancelamento de compra
* Controle de estoque

### Fora do Escopo

* Testes de performance e carga
* Testes de acessibilidade
* Testes de compatibilidade entre navegadores
* Testes de segurança avançados

---

## 3. Estratégia de Testes

### Testes Funcionais

Validar se as funcionalidades atendem aos requisitos esperados.

### Testes de API

Validar:

* Códigos de status HTTP
* Estrutura dos contratos
* Regras de negócio
* Validação de campos obrigatórios
* Tratamento de erros

### Testes de Integração

Validar a comunicação entre:

* Usuários
* Produtos
* Carrinhos
* Autenticação

### Testes de Regressão

Executar os cenários críticos após alterações no sistema.

### Testes Automatizados

Automatizar os principais fluxos utilizando:

* Cypress
* Playwright
* Robot Framework
* Postman/Newman

---

## 4. Critérios de Entrada

* Ambiente disponível
* Documentação da API acessível
* Massa de testes preparada
* Ferramentas instaladas

---

## 5. Critérios de Saída

* 100% dos cenários críticos executados
* Nenhum defeito crítico aberto
* Evidências registradas
* Relatório final gerado

---

## 6. Riscos

| Risco                               | Impacto |
| ----------------------------------- | ------- |
| Indisponibilidade do ambiente       | Alto    |
| Dados compartilhados entre usuários | Médio   |
| Alterações na API durante os testes | Alto    |
| Instabilidade da aplicação          | Médio   |

---

## 7. Cenários Prioritários

### Login

* Login com credenciais válidas
* Login com senha inválida
* Login com e-mail inexistente
* Campos obrigatórios

### Usuários

* Cadastrar usuário comum
* Cadastrar administrador
* Cadastro com e-mail duplicado
* Buscar usuário por ID
* Editar usuário
* Excluir usuário

### Produtos

* Cadastrar produto
* Cadastro de produto duplicado
* Editar produto
* Consultar produto
* Excluir produto

### Carrinho

* Adicionar produto ao carrinho
* Adicionar múltiplos produtos
* Finalizar compra
* Cancelar compra
* Validar atualização do estoque

---

## 8. Tipos de Defeitos

### Crítico

Impede a utilização da funcionalidade principal.

### Alto

Afeta uma regra de negócio importante.

### Médio

Afeta parcialmente uma funcionalidade.

### Baixo

Problemas visuais ou de baixa prioridade.

---

## 9. Ferramentas

* Postman
* Newman
* Cypress
* Playwright
* Robot Framework
* Git
* GitHub
* GitHub Actions

---

## 10. Entregáveis

* Plano de Testes
* Casos de Teste
* Evidências
* Relatórios de Execução
* Relatórios Newman
* Scripts Automatizados
* Registro de Bugs
* Pipeline CI/CD
