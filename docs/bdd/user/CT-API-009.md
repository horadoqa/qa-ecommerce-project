# CT-API-009 - Login com Credenciais Inválidas

Feature: Autenticação de usuários

Como consumidor da API
Quero validar regras de autenticação
Para impedir acessos indevidos

Scenario: Realizar login com senha inválida
Given que existe um usuário cadastrado
When enviar uma requisição POST para "/login" com senha inválida
Then o status code deve ser 401
And a resposta deve conter a mensagem "Email e/ou senha inválidos"

Scenario: Realizar login com e-mail inválido
Given que existe um usuário cadastrado
When enviar uma requisição POST para "/login" com e-mail inválido
Then o status code deve ser 401
And a resposta deve conter a mensagem "Email e/ou senha inválidos"
