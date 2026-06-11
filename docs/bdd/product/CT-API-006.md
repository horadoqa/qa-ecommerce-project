# CT-API-006 - Excluir Produto

Feature: Exclusão de produtos

Como consumidor da API
Quero excluir produtos
Para remover registros desnecessários

Scenario: Excluir produto com sucesso
Given que existe um produto cadastrado
And possuo um token de autenticação válido
And possuo o identificador do produto
When enviar uma requisição DELETE para "/produtos/{_id}"
Then o status code deve ser 200
And a resposta deve conter a mensagem "Registro excluído com sucesso"
