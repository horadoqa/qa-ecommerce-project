# CT-API-004 - Atualizar usuário (UPDATE)

```bash
curl --location --request PUT 'https://serverest.dev/usuarios/{_id}' \
--header 'Content-Type: application/json' \
--data-raw '{
  "nome": "Ricardo Fahham Atualizado",
  "email": "ricardo.qa@example.com",
  "password": "123456",
  "administrador": "true"
}'
```

**Esperado:**

```json
{
    "message": "Registro alterado com sucesso"
}
```