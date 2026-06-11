# CT-API-011 - Buscar Usuário Inexistente

Feature: Consulta de usuários

Como consumidor da API
Quero consultar usuários
Para validar o tratamento de registros inexistentes

Scenario: Buscar usuário inexistente
Given que não existe um usuário para o identificador informado
When enviar uma requisição GET para "/usuarios/{_id}"
Then o status code deve ser 400
And a resposta deve conter a mensagem "Usuário não encontrado"
