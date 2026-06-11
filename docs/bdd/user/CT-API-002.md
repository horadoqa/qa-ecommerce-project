# CT-API-002 - Realizar Login com Sucesso

Feature: Autenticação de usuários

Como um usuário cadastrado
Quero realizar login
Para obter um token de autenticação

Scenario: Realizar login com credenciais válidas
Given que existe um usuário cadastrado
And possuo credenciais válidas
When enviar uma requisição POST para "/login"
Then o status code deve ser 200
And a resposta deve conter a mensagem "Login realizado com sucesso"
And a resposta deve conter um token de autenticação
