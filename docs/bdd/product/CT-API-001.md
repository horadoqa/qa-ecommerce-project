# CT-API-001 - Cadastrar Produto

Feature: Cadastro de produtos

Como consumidor da API
Quero cadastrar produtos
Para disponibilizá-los no catálogo

Scenario: Cadastrar produto com sucesso
Given que possuo um token de autenticação válido
And possuo os dados válidos de um produto
When enviar uma requisição POST para "/produtos"
Then o status code deve ser 201
And a resposta deve conter a mensagem "Cadastro realizado com sucesso"
And a resposta deve retornar um identificador "_id"
