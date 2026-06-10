# CT-API-008 - Login com senha inválida

Cenários Negativos para seus Casos de Teste

## Login com senha inválida

```bash
curl --location 'https://serverest.dev/login' \
--header 'Content-Type: application/json' \
--data-raw '{
  "email": "ricardo.qa.teste@example.com",
  "password": "senha_errada"
}'
```

**Esperado:**

```json
{
  "message": "Email e/ou senha inválidos"
}
```

---

## Login com e-mail inválida

```bash
curl --location 'https://serverest.dev/login' \
--header 'Content-Type: application/json' \
--data-raw '{
  "email": "ricardo.qa.teste.example.com",
  "password": "123456"
}'
```

**Esperado:**

```json
{
  "message": "Email e/ou senha inválidos"
}
```