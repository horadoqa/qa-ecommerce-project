# CT-API-003 - Buscar Usuário por ID

Feature: Consulta de usuários

Como consumidor da API
Quero consultar usuários
Para obter suas informações

Scenario: Buscar usuário por ID com sucesso
Given que existe um usuário cadastrado
And possuo o identificador do usuário
When enviar uma requisição GET para "/usuarios/{_id}"
Then o status code deve ser 200
And a resposta deve retornar os dados do usuário
And o "_id" retornado deve ser igual ao informado na requisição
