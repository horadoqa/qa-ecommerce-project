# Criar Produto (CREATE)

```bash
curl --location 'https://serverest.dev/produtos' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJpY2FyZG8ucWEudGVzdGVAZXhhbXBsZS5jb20iLCJwYXNzd29yZCI6IjEyMzQ1NiIsImlhdCI6MTc4MTAzNjU2NiwiZXhwIjoxNzgxMDM3MTY2fQ.I1tDVKynppbBqWCYH7WdECijY-EpWK3uQMG8Gh9Fkx8' \
--data-raw '{
  "nome": "Mouse Gamer QA",
  "preco": 150,
  "descricao": "Mouse para testes de automação",
  "quantidade": 0
}'
```

---

## Esperado:

```json
{
    "message": "Cadastro realizado com sucesso",
    "_id": "luZ2p6CIt58ggE67"
}
```

---

## 🧪 Cenários importantes para QA (recomendado)

### ✔ Sem passar o token

```bash
curl --location 'https://serverest.dev/produtos' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer SEU_TOKEN' \
--data-raw '{
  "nome": "Mouse Gamer QA",
  "preco": 150,
  "descricao": "Mouse para testes de automação",
  "quantidade": 10
}'
```

## Esperado:

```json
{
  "message": "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
}
```

---

### ✔ Produto com nome duplicado

```bash
curl --location 'https://serverest.dev/produtos' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer SEU_TOKEN' \
--data-raw '{
  "nome": "Mouse Gamer QA",
  "preco": 150,
  "descricao": "Duplicado",
  "quantidade": 5
}'
```

---

## Esperado:

```json
{
    "message": "Já existe produto com esse nome"
}
```

---

### ✔ Produto com preço inválido

```bash
curl --location 'https://serverest.dev/produtos' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer SEU_TOKEN' \
--data-raw '{
  "nome": "Produto inválido",
  "preco": -10,
  "descricao": "Teste negativo",
  "quantidade": 5
}'
```

---

## Esperado:

```json
{
    "preco": "preco deve ser um número positivo"
}
```

---

### ✔ Produto sem estoque

```bash
curl --location 'https://serverest.dev/produtos' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer SEU_TOKEN' \
--data-raw '{
  "nome": "Sem estoque",
  "preco": 100,
  "descricao": "Produto sem estoque",
  "quantidade": 0
}'
```