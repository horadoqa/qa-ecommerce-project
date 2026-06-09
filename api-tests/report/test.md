Reportar testes de API é basicamente **documentar o que você testou, como testou e qual foi o resultado**, de forma que outra pessoa consiga reproduzir e entender o comportamento da API.

Em QA, isso normalmente vira **relatório de execução de testes de API**.

---

## 🧾 Estrutura básica de um reporte de Teste de API

Um bom relatório geralmente tem:

### 1. Identificação

* Projeto
* Data
* Responsável
* Ambiente (ex: ServeRest dev)

---

### 2. Escopo

O que foi testado:

* Usuários
* Login
* Produtos (se aplicável)
* Carrinho (se aplicável)

---

### 3. Ferramentas usadas

Ex:

* curl
* Postman
* Newman
* GitHub Actions (se tiver CI)

---

### 4. Cenários executados

Você lista os testes:

| ID         | Cenário              | Endpoint       | Resultado |
| ---------- | -------------------- | -------------- | --------- |
| CT-API-001 | Criar usuário válido | POST /usuarios | Pass      |
| CT-API-002 | Login válido         | POST /login    | Pass      |
| CT-API-003 | Email duplicado      | POST /usuarios | Fail      |

---

### 5. Evidências

Você pode incluir:

* print do terminal (curl)
* resposta JSON
* logs de execução
* screenshots (Postman)
* relatório Newman

---

### 6. Bugs encontrados (se houver)

Exemplo:

**BUG-001**

* Título: Permite cadastro com email duplicado
* Severidade: Alta
* Evidência: resposta 201 com email repetido
* Status: Aberto

---

### 7. Conclusão

Resumo simples:

* Quantos testes passaram
* Quantos falharam
* Se há bloqueios

Exemplo:

> Foram executados 10 testes de API, com 9 aprovados e 1 falha relacionada à validação de email duplicado.

---

## 📄 Exemplo pronto (formato simples)

```text id="rep1"
Relatório de Testes de API - ServeRest

Data: 09/06/2026
Responsável: Ricardo Fahham
Ambiente: https://serverest.dev

Escopo:
- Usuários
- Login

Ferramentas:
- curl

Resultados:
- 6 testes executados
- 5 aprovados
- 1 falha (email duplicado aceito indevidamente)

Conclusão:
API funcional, com inconsistência na validação de duplicidade de email.
```

---

## 🚀 Dica importante (nível portfólio)

Se quiser se destacar, evolua seu reporte para:

* Markdown no GitHub (`reports/api-report.md`)
* ou relatório automático via **Newman**
* ou pipeline no GitHub Actions gerando artefato

---

Se quiser, posso montar pra você um:
✔ template profissional de relatório
✔ ou um modelo pronto já baseado nos seus curls
✔ ou até integração com Newman no CI

Só me fala 👍
