# CT-API-005 - Validar Atualização do Produto

Feature: Atualização de produtos

Como consumidor da API
Quero validar alterações realizadas
Para garantir a persistência dos dados

Scenario: Consultar produto após atualização
Given que um produto foi atualizado com sucesso
When enviar uma requisição GET para "/produtos/{_id}"
Then o status code deve ser 200
And os dados retornados devem refletir as alterações realizadas
