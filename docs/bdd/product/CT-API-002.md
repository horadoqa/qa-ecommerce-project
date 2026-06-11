# CT-API-002 - Buscar Produto por ID

Feature: Consulta de produtos

Como consumidor da API
Quero consultar produtos
Para obter suas informações

Scenario: Buscar produto por ID com sucesso
Given que existe um produto cadastrado
And possuo o identificador do produto
When enviar uma requisição GET para "/produtos/{_id}"
Then o status code deve ser 200
And a resposta deve retornar os dados do produto
And o "_id" retornado deve ser igual ao informado na requisição
