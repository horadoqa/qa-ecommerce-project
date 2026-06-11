# CT-API-008 - Validar Exclusão do Usuário

Feature: Exclusão de usuários

Como consumidor da API
Quero validar exclusões realizadas
Para garantir a remoção dos registros

Scenario: Consultar usuário excluído
Given que um usuário foi excluído com sucesso
When enviar uma requisição GET para "/usuarios/{_id}"
Then o status code deve ser 400
And a resposta deve conter a mensagem "Usuário não encontrado"
