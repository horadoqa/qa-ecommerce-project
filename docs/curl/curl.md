# Manual Básico de cURL com ServeRest

## Introdução

O cURL é uma ferramenta de linha de comando utilizada para realizar requisições HTTP para APIs. A ServeRest é uma API REST gratuita muito utilizada para estudos e testes de automação.

Base URL:

```text
https://serverest.dev
```

---

# 1. Realizando uma requisição GET

O método GET é utilizado para consultar informações.

Exemplo: listar usuários.

```bash
curl https://serverest.dev/usuarios
```

---

# 2. Filtrando dados com Query Parameters

Os Query Parameters permitem enviar filtros diretamente para a API.

Sintaxe:

```bash
curl "https://serverest.dev/recurso?campo=valor"
```

Exemplo:

```bash
curl "https://serverest.dev/usuarios?nome=Fulano da Silva"
```

Filtrando por e-mail:

```bash
curl "https://serverest.dev/usuarios?email=fulano@email.com"
```

Múltiplos filtros:

```bash
curl "https://serverest.dev/usuarios?nome=Fulano&administrador=true"
```

---

# 3. Formatando a resposta com jq

O jq é uma ferramenta para manipular JSON.

Exemplo:

```bash
curl -s https://serverest.dev/usuarios | jq
```

Exibir apenas os nomes:

```bash
curl -s https://serverest.dev/usuarios \
| jq '.usuarios[].nome'
```

---

# 4. Criando registros com POST

O método POST é utilizado para criar novos recursos.

Exemplo: criar usuário.

```bash
curl -X POST https://serverest.dev/usuarios \
-H "Content-Type: application/json" \
-d '{
  "nome":"João Teste",
  "email":"joao_teste@email.com",
  "password":"123456",
  "administrador":"true"
}'
```

Parâmetros:

* `-X POST` → define o método HTTP.
* `-H` → envia cabeçalhos.
* `-d` → envia dados JSON.

---

# 5. Atualizando registros com PUT

O método PUT altera um recurso existente.

Exemplo:

```bash
curl -X PUT https://serverest.dev/usuarios/ID_USUARIO \
-H "Content-Type: application/json" \
-d '{
  "nome":"João Atualizado",
  "email":"joao_atualizado@email.com",
  "password":"123456",
  "administrador":"true"
}'
```

---

# 6. Excluindo registros com DELETE

O método DELETE remove recursos.

Exemplo:

```bash
curl -X DELETE https://serverest.dev/usuarios/ID_USUARIO
```

---

# 7. Realizando Login

Exemplo:

```bash
curl -X POST https://serverest.dev/login \
-H "Content-Type: application/json" \
-d '{
  "email":"usuario@email.com",
  "password":"123456"
}'
```

A resposta retornará um token de autenticação.

---

# 8. Utilizando Token

Após obter o token, envie-o no cabeçalho Authorization.

Exemplo:

```bash
curl https://serverest.dev/produtos \
-H "Authorization: TOKEN_RECEBIDO"
```

---

# 9. Exibindo Cabeçalhos HTTP

Para visualizar os cabeçalhos da resposta:

```bash
curl -i https://serverest.dev/usuarios
```

Somente cabeçalhos:

```bash
curl -I https://serverest.dev/usuarios
```

---

# 10. Salvando Respostas em Arquivo

```bash
curl https://serverest.dev/usuarios -o usuarios.json
```

---

# 11. Boas Práticas

1. Utilize Query Parameters para filtrar dados sempre que possível.
2. Utilize jq para formatar e manipular respostas JSON.
3. Valide os códigos HTTP retornados.
4. Armazene tokens em variáveis de ambiente.
5. Evite expor credenciais diretamente nos scripts.

---

# Exemplos Rápidos

Listar usuários:

```bash
curl https://serverest.dev/usuarios
```

Buscar por nome:

```bash
curl "https://serverest.dev/usuarios?nome=Maria"
```

Buscar por e-mail:

```bash
curl "https://serverest.dev/usuarios?email=maria@email.com"
```

Criar usuário:

```bash
curl -X POST https://serverest.dev/usuarios \
-H "Content-Type: application/json" \
-d @usuario.json
```

Formatar resposta:

```bash
curl -s https://serverest.dev/usuarios | jq
```

Excluir usuário:

```bash
curl -X DELETE https://serverest.dev/usuarios/ID_USUARIO
```