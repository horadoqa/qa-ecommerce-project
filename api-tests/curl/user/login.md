# Realizar Login

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

Guarde o valor de `authorization`, pois ele será utilizado nas operações protegidas. ([serverest.dev][1])

---

## Cenários Negativos para seus Casos de Teste

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