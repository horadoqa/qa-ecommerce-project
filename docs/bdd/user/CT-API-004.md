# CT-API-004 - Listar Usuários

Feature: Consulta de usuários

Como consumidor da API
Quero listar usuários
Para visualizar os registros cadastrados

Scenario: Listar todos os usuários
Given que existem usuários cadastrados
When enviar uma requisição GET para "/usuarios"
Then o status code deve ser 200
And a resposta deve conter o campo "quantidade"
And a resposta deve conter uma lista de usuários
