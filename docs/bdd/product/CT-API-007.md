# CT-API-007 - Validar Exclusão do Produto

Feature: Exclusão de produtos

Como consumidor da API
Quero validar exclusões realizadas
Para garantir a remoção dos registros

Scenario: Consultar produto excluído
Given que um produto foi excluído com sucesso
When enviar uma requisição GET para "/produtos/{_id}"
Then o status code deve ser 400
And a resposta deve conter a mensagem "Produto não encontrado"
