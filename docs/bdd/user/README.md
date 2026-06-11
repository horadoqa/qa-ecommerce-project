# BDD USER

São 11 cenários escritos em BDD para auxiliar a construção e teste da API

Uma outra organização que pode ser usar é consolidar em Features:

features/
├── usuarios-create.feature
├── usuarios-read.feature
├── usuarios-update.feature
├── usuarios-delete.feature
└── autenticacao.feature

Essa estrutura reduz duplicação e facilita a manutenção dos testes automatizados em Cucumber, Rest Assured, Cypress ou Playwright.


`Feature`: Consulta de usuários

Feature: Consulta de usuários

Como consumidor da API
Quero consultar usuários
Para obter informações sobre os registros cadastrados

Scenario: Buscar usuário por ID com sucesso
Given que existe um usuário cadastrado
And possuo o identificador do usuário
When enviar uma requisição GET para "/usuarios/{_id}"
Then o status code deve ser 200
And a resposta deve retornar os dados do usuário

Scenario: Listar todos os usuários
Given que existem usuários cadastrados
When enviar uma requisição GET para "/usuarios"
Then o status code deve ser 200
And a resposta deve conter uma lista de usuários
