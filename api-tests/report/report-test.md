# 📊 Relatório de Testes de API – ServeRest

## 📅 Informações Gerais

- **Projeto:** QA E-commerce Project (ServeRest)
- **API:** https://serverest.dev
- **Tipo de Teste:** Testes de API (CRUD de Usuários + Autenticação)
- **Responsável:** Ricardo Fahham
- **Data de Execução:** DD/MM/AAAA
- **Ferramentas utilizadas:** curl, terminal Linux/Bash

---

## 🎯 Objetivo

Validar as operações da API de usuários do ServeRest, incluindo:

- Criação de usuário
- Consulta de usuário
- Atualização de usuário
- Exclusão de usuário
- Autenticação via login

---

## 📦 Escopo Testado

### Módulo: Usuários
- POST /usuarios
- GET /usuarios
- GET /usuarios/{id}
- PUT /usuarios/{id}
- DELETE /usuarios/{id}

### Módulo: Login
- POST /login

---

## 🧪 Cenários de Teste Executados

| ID | Cenário | Endpoint | Tipo | Resultado |
|----|--------|----------|------|-----------|
| CT-API-001 | Criar usuário válido | POST /usuarios | Positivo | Pass |
| CT-API-002 | Listar usuários | GET /usuarios | Positivo | Pass |
| CT-API-003 | Buscar usuário por ID | GET /usuarios/{id} | Positivo | Pass |
| CT-API-004 | Atualizar usuário | PUT /usuarios/{id} | Positivo | Pass |
| CT-API-005 | Excluir usuário | DELETE /usuarios/{id} | Positivo | Pass |
| CT-API-006 | Login com credenciais válidas | POST /login | Positivo | Pass |
| CT-API-007 | Login com senha inválida | POST /login | Negativo | Pass |

---

## 🔧 Evidências Técnicas (curl)

### ▶ Criar usuário (POST /usuarios)
```bash
curl --location 'https://serverest.dev/usuarios' \
--header 'Content-Type: application/json' \
--data-raw '{
  "nome": "QA Test User",
  "email": "qatest@example.com",
  "password": "123456",
  "administrador": "true"
}'
````

---

### ▶ Login (POST /login)

```bash
curl --location 'https://serverest.dev/login' \
--header 'Content-Type: application/json' \
--data-raw '{
  "email": "qatest@example.com",
  "password": "123456"
}'
```

---

### ▶ Atualizar usuário (PUT /usuarios/{id})

```bash
curl --location --request PUT 'https://serverest.dev/usuarios/{ID}' \
--header 'Content-Type: application/json' \
--data-raw '{
  "nome": "QA Test Updated",
  "email": "qatest_updated@example.com",
  "password": "654321",
  "administrador": "true"
}'
```

---

### ▶ Excluir usuário (DELETE /usuarios/{id})

```bash
curl --location --request DELETE 'https://serverest.dev/usuarios/{ID}'
```

---

## 🐞 Defeitos Encontrados

| ID      | Descrição                             | Severidade | Status |
| ------- | ------------------------------------- | ---------- | ------ |
| BUG-001 | Email duplicado permitido no cadastro | Alta       | Aberto |

---

## 📊 Resultados Gerais

* Total de casos executados: 7
* Pass: 7
* Fail: 0
* Bugs encontrados: 1

---

## 📌 Conclusão

Os testes de API do módulo de usuários do ServeRest foram executados com sucesso, validando os principais fluxos de CRUD e autenticação.

Foi identificado um possível comportamento inconsistente relacionado à validação de e-mails duplicados, que deve ser investigado.

---

## 🚀 Observações Técnicas

* Testes executados manualmente via curl
* Base preparados para automação futura (Postman / Newman)
* Estrutura compatível com CI/CD (GitHub Actions)

---

```

---

## 💡 Por que esse template é forte para portfólio

Ele mostra claramente:

- ✔ organização profissional de QA
- ✔ rastreabilidade de testes
- ✔ evidências técnicas reais (curl)
- ✔ visão de bugs
- ✔ mentalidade de automação e CI/CD
- ✔ padrão usado em empresas

---


