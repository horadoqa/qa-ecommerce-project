# CT-API-007 - Excluir Usuário

Feature: Exclusão de usuários

Como consumidor da API
Quero excluir usuários
Para remover registros desnecessários

Scenario: Excluir usuário com sucesso
Given que existe um usuário cadastrado
And possuo o identificador do usuário
When enviar uma requisição DELETE para "/usuarios/{_id}"
Then o status code deve ser 200
And a resposta deve conter a mensagem "Registro excluído com sucesso"
