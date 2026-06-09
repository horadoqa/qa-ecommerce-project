# Atualizar Produto (UPDATE)

```bash
curl --location --request PUT 'https://serverest.dev/produtos/SEU_ID' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer SEU_TOKEN' \
--data-raw '{
  "nome": "Mouse Gamer QA Updated",
  "preco": 200,
  "descricao": "Produto atualizado para testes",
  "quantidade": 20
}'
```