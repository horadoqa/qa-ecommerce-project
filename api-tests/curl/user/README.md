# Suíte de Testes - Usuários

### 🔹 Autenticação

* CT-API-002 - Realizar Login com Sucesso
* CT-API-009 - Realizar Login com Credenciais Inválidas

---

### 🔹 CRUD de Usuários

* CT-API-001 - Cadastrar Usuário Administrador (CREATE)
* CT-API-003 - Buscar Usuário por ID (READ ONE)
* CT-API-004 - Listar Usuários (READ ALL)
* CT-API-005 - Atualizar Usuário (UPDATE)
* CT-API-006 - Validar Alteração do Usuário
* CT-API-007 - Excluir Usuário (DELETE)
* CT-API-008 - Validar Exclusão do Usuário

---

### 🔹 Cenários Negativos

* CT-API-010 - Cadastro de Usuário com E-mail Duplicado
* CT-API-011 - Buscar Usuário Inexistente

---

## 🔁 Fluxo sugerido de execução

1. Criar usuário administrador
2. Realizar login
3. Buscar usuário por ID
4. Listar usuários
5. Atualizar usuário
6. Validar atualização
7. Excluir usuário
8. Validar exclusão

---

## 🎯 Critérios gerais

* E-mails devem ser únicos na base
* Tokens devem ser necessários para operações protegidas
* Exclusões devem remover completamente o registro
* Consultas após exclusão devem retornar erro
* Atualizações devem persistir corretamente

---

