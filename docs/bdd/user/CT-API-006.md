# CT-API-006 - Validar Alteração do Usuário

Feature: Atualização de usuários

Como consumidor da API
Quero validar alterações realizadas
Para garantir a persistência dos dados

Scenario: Consultar usuário após atualização
Given que um usuário foi atualizado com sucesso
When enviar uma requisição GET para "/usuarios/{_id}"
Then o status code deve ser 200
And os dados retornados devem refletir as alterações realizadas
