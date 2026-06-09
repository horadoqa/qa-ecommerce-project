# Excluir Produto (DELETE)

```bash
curl --location --request DELETE 'https://serverest.dev/produtos/{ID Produto}' \
--header 'Authorization: Bearer SEU_TOKEN'
```

## Esperado:

```json
{
    "message": "Registro excluído com sucesso"
}
```