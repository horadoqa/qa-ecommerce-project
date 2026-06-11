# CT-API-005 - Atualizar Usuário

Feature: Atualização de usuários

Como consumidor da API
Quero atualizar usuários
Para manter seus dados atualizados

Scenario: Atualizar usuário com sucesso
Given que existe um usuário cadastrado
And possuo o identificador do usuário
When enviar uma requisição PUT para "/usuarios/{_id}"
Then o status code deve ser 200
And a resposta deve conter a mensagem "Registro alterado com sucesso"
