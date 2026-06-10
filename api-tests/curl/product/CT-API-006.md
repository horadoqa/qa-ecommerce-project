# CT-API-006 - Excluir Produto (DELETE)

Para remover um produto do cadastro, informe o identificador (`_id`) do produto e um token de autenticação válido.

A exclusão deve remover permanentemente o registro da base de dados.

### Exemplo de requisição

```bash id="r8x4m2"
curl --location --request DELETE 'https://serverest.dev/produtos/{_id}' \
--header 'Authorization: Bearer <token>'
```

---

## Resultado esperado

**Status Code:** `200 OK`

**Response Body:**

```json id="j5n7q1"
{
  "message": "Registro excluído com sucesso"
}
```

### Validações

* O token de autenticação deve ser válido.
* O produto informado pelo `_id` deve existir.
* O endpoint deve retornar o status `200 OK`.
* A resposta deve conter a mensagem `Registro excluído com sucesso`.
* O produto não deve mais estar disponível para consulta após a exclusão.

---

## Pós-condição

Após a exclusão, recomenda-se realizar uma nova consulta utilizando o mesmo `_id` para confirmar que o registro foi removido.

### Exemplo de validação

```bash id="w2p9f6"
curl --location 'https://serverest.dev/produtos/{_id}'
```

### Resultado esperado

**Status Code:** `400 Bad Request`

**Response Body:**

```json id="k3v8d4"
{
  "message": "Produto não encontrado"
}
```

### Critério de aprovação

O teste será considerado aprovado quando o produto for excluído com sucesso e não puder mais ser recuperado por meio do endpoint de consulta por ID.
