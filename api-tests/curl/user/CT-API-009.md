# CCT-API-009 - Cadastro com e-mail duplicado

```bash
curl --location 'https://serverest.dev/usuarios' \
--header 'Content-Type: application/json' \
--data-raw '{
  "nome": "Ricardo Fahham",
  "email": "ricardo.qa.teste@example.com",
  "password": "123456",
  "administrador": "true"
}'
```

**Resposta esperada:**

```json
{
  "message": "Cadastro realizado com sucesso",
  "_id": "DOQOugWPYpvN3OaS"
}
```

---

## Cadastro com e-mail duplicado

Execute o cadastro duas vezes com o mesmo e-mail.

**Esperado:**

```json
{
  "message": "Este email já está sendo usado"
}
```