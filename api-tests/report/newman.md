# Newman

O **Newman** é a ferramenta de linha de comando do **Postman**.

Em outras palavras:

> 👉 Newman permite executar coleções do Postman diretamente no terminal (sem abrir a interface gráfica).

---

## 💡 Explicação simples

* Você cria testes no **Postman**
* Exporta uma **Collection**
* Executa essa collection via **Newman**
* Gera relatórios automaticamente

---

## 🧪 Exemplo prático

### No Postman:

Você cria testes para:

* `POST /usuarios`
* `GET /usuarios`
* `POST /login`

---

### No Newman (terminal):

```bash id="new1"
newman run collection.json
```

---

## 📊 O que o Newman faz

Ele executa automaticamente:

* Requisições da API
* Validações (tests do Postman)
* Assertions
* Relatórios de execução

---

## 📄 Exemplo de execução com relatório

```bash id="new2"
newman run collection.json -r cli,html
```

Isso gera:

* saída no terminal
* relatório HTML

---

## 🚀 Por que isso é importante em QA

Newman é muito usado porque permite:

### ✔ CI/CD

Rodar testes automaticamente no:

* GitHub Actions
* Jenkins
* GitLab CI

---

### ✔ Automação real de API

Transforma testes manuais em testes automatizados.

---

### ✔ Relatórios profissionais

Ex:

* Pass/Fail
* tempo de resposta
* erros da API

---

## 🔧 Exemplo no seu contexto (ServeRest)

Você poderia ter:

```text id="new3"
api-tests/
├── collection.json
├── environment.json
└── reports/
```

E rodar:

```bash id="new4"
newman run collection.json -e environment.json
```

---

## 🎯 Resumo direto

> Newman = executor de testes do Postman via terminal

---

## 💡 Diferença rápida

| Ferramenta | Uso                                          |
| ---------- | -------------------------------------------- |
| Postman    | Criar e rodar testes manualmente             |
| Newman     | Rodar testes automaticamente via terminal/CI |

---