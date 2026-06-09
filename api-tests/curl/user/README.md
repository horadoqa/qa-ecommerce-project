Para os testes de API no ServeRest, você pode cobrir todo o CRUD de usuários e autenticação com os seguintes exemplos de `curl`.

**Base URL:**

```bash
https://serverest.dev
```

As rotas de Login e Usuários são documentadas oficialmente pelo [ServeRest](https://serverest.dev).

---

## Fluxo completo:

```text
CT-API-001 - Cadastrar usuário administrador
CT-API-002 - Realizar login com sucesso
CT-API-003 - Buscar usuário por ID
CT-API-004 - Atualizar usuário
CT-API-005 - Validar alteração realizada
CT-API-006 - Excluir usuário
CT-API-007 - Validar exclusão
CT-API-008 - Login com senha inválida
CT-API-009 - Cadastro com e-mail duplicado
CT-API-010 - Buscar usuário inexistente
```

Essa sequência já cobre o CRUD completo de usuários e autenticação, sendo uma excelente base para Postman, Newman e automação em CI/CD.

Podendo ser utilizada nos Testes Automatizados

