# CT-API-010 - Cadastro com E-mail Duplicado

Feature: Cadastro de usuários

Como consumidor da API
Quero validar a unicidade do e-mail
Para evitar cadastros duplicados

Scenario: Tentar cadastrar usuário com e-mail já existente
Given que existe um usuário cadastrado com determinado e-mail
When enviar uma requisição POST para "/usuarios" utilizando o mesmo e-mail
Then o status code deve ser 400
And a resposta deve conter a mensagem "Este email já está sendo usado"
