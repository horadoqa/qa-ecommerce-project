# CT-API-003 - Listar Produtos

Feature: Consulta de produtos

Como consumidor da API
Quero listar produtos
Para visualizar os registros cadastrados

Scenario: Listar todos os produtos
Given que existem produtos cadastrados
When enviar uma requisição GET para "/produtos"
Then o status code deve ser 200
And a resposta deve conter o campo "quantidade"
And a resposta deve conter uma lista de produtos
