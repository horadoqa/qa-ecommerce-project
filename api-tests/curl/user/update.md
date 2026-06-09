# Editar Usuário (UPDATE)

```bash
curl --location --request PUT 'https://serverest.dev/usuarios/{SEU_ID}' \
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