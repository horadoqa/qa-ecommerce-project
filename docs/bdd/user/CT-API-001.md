# CT-API-001 - Cadastrar Usuário Administrador

Feature: Cadastro de usuários

Como um consumidor da API
Quero cadastrar usuários
Para que possam acessar o sistema

Scenario: Cadastrar usuário administrador com sucesso
Given que possuo os dados válidos de um usuário administrador
When enviar uma requisição POST para "/usuarios"
Then o status code deve ser 201
And a resposta deve conter a mensagem "Cadastro realizado com sucesso"
And a resposta deve retornar um identificador "_id"
