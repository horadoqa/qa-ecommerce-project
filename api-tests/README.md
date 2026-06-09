## Teste de API

É o processo de validar se uma API (Interface de Programação de Aplicações) está funcionando corretamente, garantindo que ela recebe requisições, processa dados e retorna respostas conforme o esperado.

Na prática, você não testa interface visual — você testa diretamente os **endpoints** (rotas) da aplicação.

---

## 💡 O que é uma API nesse contexto?

Uma API é um conjunto de regras que permite comunicação entre sistemas.

Exemplo no ServeRest:

* `POST /usuarios` → cria usuário
* `GET /usuarios` → lista usuários
* `PUT /usuarios/:id` → atualiza usuário
* `DELETE /usuarios/:id` → remove usuário
* `POST /login` → autentica usuário

---

## 🧪 O que é Teste de API na prática

É verificar coisas como:

### ✔️ Funcionalidade

* O endpoint responde?
* Faz o que deveria fazer?

### ✔️ Status HTTP

* `200` (OK)
* `201` (criado)
* `400` (erro de validação)
* `401` (não autorizado)
* `404` (não encontrado)

### ✔️ Dados retornados

* JSON está correto?
* Campos existem?
* Valores estão certos?

### ✔️ Regras de negócio

* Não permite email duplicado?
* Não deixa comprar sem estoque?
* Login inválido é bloqueado?

### ✔️ Segurança básica

* Endpoint protegido exige token?
* Usuário não acessa dados de outro?

---

## 🔧 Exemplos (com seu contexto ServeRest)

### Criar usuário (teste positivo)

```bash id="api1"
curl -X POST https://serverest.dev/usuarios \
-H "Content-Type: application/json" \
-d '{
  "nome": "QA Test",
  "email": "qa@test.com",
  "password": "123456",
  "administrador": "true"
}'
```

### Login (validação)

```bash id="api2"
curl -X POST https://serverest.dev/login \
-H "Content-Type: application/json" \
-d '{
  "email": "qa@test.com",
  "password": "123456"
}'
```

---

## 🧠 Em resumo simples

> Teste de API é garantir que o “cérebro do sistema” funciona corretamente, sem precisar abrir o navegador.

---

## 🎯 Diferença rápida

| Tipo de teste  | O que valida               |
| -------------- | -------------------------- |
| UI (interface) | Botões, telas, layout      |
| API            | Regras, dados, backend     |
| Unitário       | Funções isoladas do código |

---

## 🚀 Por que isso é importante em QA

Porque APIs:

* são mais rápidas que UI
* são mais estáveis
* validam regras reais do sistema
* são base de automação e CI/CD

---
