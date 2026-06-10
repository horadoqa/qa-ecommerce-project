# CT-API-001 - Cadastrar Usuário Administrador (CREATE)

Para cadastrar um usuário administrador, envie os dados obrigatórios no corpo da requisição, informando o campo `administrador` com o valor `true`.

### Exemplo de requisição

```bash id="a8x7m2"
curl --location 'https://serverest.dev/usuarios' \
--header 'Content-Type: application/json' \
--data-raw '{
  "nome": "Ricardo Fahham",
  "email": "ricardo.qa.teste@example.com",
  "password": "123456",
  "administrador": "true"
}'
```

---

## Resultado esperado

**Status Code:** `201 Created`

**Response Body:**

```json id="p5v9q3"
{
  "message": "Cadastro realizado com sucesso",
  "_id": "DOQOugWPYpvN3OaS"
}
```

### Validações

* O endpoint deve retornar o status `201 Created`.
* O usuário deve ser cadastrado com sucesso.
* A resposta deve conter a mensagem `Cadastro realizado com sucesso`.
* O campo `_id` deve ser gerado automaticamente.
* O usuário deve ser criado com perfil de administrador.
* O e-mail informado deve ser único na base de dados.

---

## Cenário alternativo: Cadastro com e-mail duplicado

Execute novamente a requisição utilizando um e-mail já cadastrado.

### Resultado esperado

**Status Code:** `400 Bad Request`

**Response Body:**

```json id="x4m7n8"
{
  "message": "Este email já está sendo usado"
}
```

### Validações

* O endpoint deve retornar o status `400 Bad Request`.
* O cadastro não deve ser realizado.
* A resposta deve conter a mensagem `Este email já está sendo usado`.
* Nenhum novo usuário deve ser criado com o e-mail informado.

### Critério de aprovação

O teste será considerado aprovado quando o usuário administrador for criado com sucesso e a API impedir o cadastro de usuários com e-mails duplicados.
