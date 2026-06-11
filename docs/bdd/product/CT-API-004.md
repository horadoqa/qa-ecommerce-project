# CT-API-004 - Atualizar Produto

Feature: Atualização de produtos

Como consumidor da API
Quero atualizar produtos
Para manter seus dados atualizados

Scenario: Atualizar produto com sucesso
Given que existe um produto cadastrado
And possuo um token de autenticação válido
And possuo o identificador do produto
When enviar uma requisição PUT para "/produtos/{_id}"
Then o status code deve ser 200
And a resposta deve conter a mensagem "Registro alterado com sucesso"
