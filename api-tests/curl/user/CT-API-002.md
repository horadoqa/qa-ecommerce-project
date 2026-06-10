# CT-API-002 - Realizar login com sucesso

```bash
curl --location 'https://serverest.dev/login' \
--header 'Content-Type: application/json' \
--data-raw '{
  "email": "ricardo.qa.teste@example.com",
  "password": "123456"
}'
```

**Resposta esperada:**

```json
{
  "message": "Login realizado com sucesso",
  "authorization": "Bearer eyJ..."
}
```

---

