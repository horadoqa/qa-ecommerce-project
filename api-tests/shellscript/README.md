# Shell Scripts de Automação - ServeRest

Este projeto contém scripts para automatizar o cadastro de usuários, autenticação e cadastro de produtos na API ServeRest.

## Fluxo do Processo

O processo é executado em três etapas:

1. **Cadastro de usuários**

   * Lê os dados do arquivo `user.json`
   * Cria os usuários na API ServeRest

2. **Login dos usuários**

   * Utiliza os mesmos usuários do arquivo `user.json`
   * Realiza autenticação na API
   * Armazena os tokens retornados em `tokens.json`

3. **Cadastro de produtos**

   * Lê os produtos do arquivo `produtos.csv`
   * Utiliza os tokens armazenados em `tokens.json`
   * Realiza o cadastro dos produtos na API

---

## Estrutura do Projeto

```text
.
├── user.json
├── produtos.csv
├── tokens.json
├── user.sh
├── login_usuarios.sh
├── cadastrar_produtos.sh
└── README.md
```

---

## Pré-requisitos

### Instalar o jq

O `jq` é utilizado para manipular arquivos JSON nos scripts.

Ubuntu/Debian:

```bash
sudo apt update
sudo apt install jq
```

Verificar instalação:

```bash
jq --version
```

---

## Arquivos de Dados

### Usuários (`user.json`)

Arquivo contendo os usuários que serão cadastrados.

Exemplo:

```json
[
  {
    "nome": "Ana Silva",
    "email": "ana.silva1@example.com",
    "password": "Senha@1001",
    "administrator": false
  }
]
```

### Produtos (`produtos.csv`)

Arquivo contendo os produtos que serão cadastrados.

Exemplo:

```csv
nome,preco,descricao,quantidade
Notebook Ultra 14,3499.90,Notebook com processador i5 e 8GB RAM,15
Mouse Óptico USB,49.90,Mouse óptico com conexão USB,120
```

### Tokens (`tokens.json`)

Este arquivo é gerado automaticamente após a execução do login dos usuários.

Exemplo:

```json
[
  {
    "email": "ana.silva1@example.com",
    "token": "Bearer eyJhbGciOiJIUzI1NiIs..."
  }
]
```

---

# Etapa 1 - Cadastro de Usuários

## Permissão de execução

```bash
chmod +x user.sh
```

## Execução

```bash
./user.sh
```

## O que o script faz

* Lê o arquivo `user.json`
* Percorre todos os usuários
* Envia requisições para:

```http
POST https://serverest.dev/usuarios
```

* Exibe a resposta da API para cada cadastro

---

# Etapa 2 - Login dos Usuários

Após o cadastro dos usuários, execute o login para obter os tokens de autenticação.

## Permissão de execução

```bash
chmod +x login_usuarios.sh
```

## Execução

```bash
./login_usuarios.sh
```

## O que o script faz

* Lê o arquivo `user.json`
* Realiza login de cada usuário
* Obtém o token JWT retornado pela API
* Salva todos os tokens no arquivo `tokens.json`

Endpoint utilizado:

```http
POST https://serverest.dev/login
```

---

# Etapa 3 - Cadastro de Produtos

Após gerar o arquivo `tokens.json`, execute o cadastro dos produtos.

## Permissão de execução

```bash
chmod +x cadastrar_produtos.sh
```

## Execução

```bash
./cadastrar_produtos.sh
```

## O que o script faz

* Lê os produtos do arquivo `produtos.csv`
* Lê os tokens do arquivo `tokens.json`
* Utiliza os tokens em rotação (round-robin)
* Realiza o cadastro dos produtos na API

Endpoint utilizado:

```http
POST https://serverest.dev/produtos
```

---

## Ordem Recomendada de Execução

Execute os scripts nesta ordem:

```bash
./user.sh
./login_usuarios.sh
./cadastrar_produtos.sh
```

---

## Quantidade de Dados Utilizados

### Usuários

* 50 usuários
* Campos:

  * nome
  * email
  * password
  * administrator

### Produtos

* 50 produtos
* Campos:

  * nome
  * preco
  * descricao
  * quantidade

---

## Tecnologias Utilizadas

* Bash Shell Script
* Curl
* jq
* JSON
* CSV
* API ServeRest

---

## API Utilizada

Documentação oficial:

[https://serverest.dev](https://serverest.dev)

Endpoints utilizados:

| Método | Endpoint    | Descrição            |
| ------ | ----------- | -------------------- |
| POST   | `/usuarios` | Cadastro de usuários |
| POST   | `/login`    | Autenticação         |
| POST   | `/produtos` | Cadastro de produtos |

---

## Possíveis Melhorias

* Cadastro de produtos em paralelo
* Geração automática de relatórios
* Exportação dos IDs criados
* Exclusão automática dos dados de teste
* Pipeline CI/CD para execução automatizada
* Integração com testes automatizados
