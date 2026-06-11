# BDD USER

São 11 cenários escritos em BDD para auxiliar a construção e teste da API

Uma outra organização que pode ser usar é consolidar em Features:

features/
├── produtos-create.feature
├── produtos-read.feature
├── produtos-update.feature
├── produtos-delete.feature
└── autenticacao.feature

Essa estrutura reduz duplicação e facilita a manutenção dos testes automatizados em Cucumber, Rest Assured, Cypress ou Playwright.


`Feature`: Consulta de produtos

Como consumidor da API
Quero consultar produtos
Para obter informações sobre os registros cadastrados

Scenario: Buscar produto por ID com sucesso
Given que existe um produto cadastrado
And possuo o identificador do produto
When enviar uma requisição GET para "/produtos/{_id}"
Then o status code deve ser 200
And a resposta deve retornar os dados do produto

Scenario: Listar todos os produtos
Given que existem produtos cadastrados
When enviar uma requisição GET para "/produtos"
Then o status code deve ser 200
And a resposta deve conter uma lista de produtos
