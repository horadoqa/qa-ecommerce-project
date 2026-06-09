# Casos de Teste – ServeRest

Para portfólio, recomendo organizar os casos por funcionalidade e incluir:

- ID
- Cenário
- Pré-condições
- Passos
- Resultado esperado
- Prioridade

Pode usar o Excel

## Módulo: Login

### CT-LOGIN-001 - Realizar login com credenciais válidas

**Prioridade:** Alta

**Pré-condições:**

* Usuário previamente cadastrado.

**Passos:**

1. Acessar a página de login.
2. Informar e-mail válido.
3. Informar senha válida.
4. Clicar em "Entrar".

**Resultado Esperado:**

* Usuário autenticado com sucesso.
* Redirecionamento para a área principal do sistema.

---

### CT-LOGIN-002 - Tentar login com senha inválida

**Prioridade:** Alta

**Pré-condições:**

* Usuário cadastrado.

**Passos:**

1. Acessar a página de login.
2. Informar e-mail válido.
3. Informar senha inválida.
4. Clicar em "Entrar".

**Resultado Esperado:**

* Exibir mensagem de erro.
* Não permitir autenticação.

---

### CT-LOGIN-003 - Tentar login com e-mail inexistente

**Prioridade:** Alta

**Passos:**

1. Acessar a página de login.
2. Informar e-mail não cadastrado.
3. Informar senha qualquer.
4. Clicar em "Entrar".

**Resultado Esperado:**

* Sistema deve impedir o acesso.
* Exibir mensagem informativa.

---

## Módulo: Usuários

### CT-USR-001 - Cadastrar usuário comum

**Prioridade:** Alta

**Passos:**

1. Acessar cadastro de usuário.
2. Preencher nome.
3. Preencher e-mail válido.
4. Preencher senha.
5. Selecionar usuário comum.
6. Salvar cadastro.

**Resultado Esperado:**

* Usuário cadastrado com sucesso.

---

### CT-USR-002 - Cadastrar usuário administrador

**Prioridade:** Média

**Passos:**

1. Informar dados válidos.
2. Selecionar perfil administrador.
3. Salvar cadastro.

**Resultado Esperado:**

* Usuário administrador cadastrado com sucesso.

---

### CT-USR-003 - Tentar cadastrar usuário com e-mail duplicado

**Prioridade:** Alta

**Pré-condições:**

* E-mail já cadastrado.

**Passos:**

1. Acessar cadastro.
2. Informar e-mail existente.
3. Salvar cadastro.

**Resultado Esperado:**

* Sistema deve impedir cadastro duplicado.

---

### CT-USR-004 - Editar usuário existente

**Prioridade:** Média

**Pré-condições:**

* Usuário cadastrado.

**Passos:**

1. Localizar usuário.
2. Alterar dados.
3. Salvar.

**Resultado Esperado:**

* Dados atualizados corretamente.

---

### CT-USR-005 - Excluir usuário existente

**Prioridade:** Média

**Pré-condições:**

* Usuário cadastrado.

**Passos:**

1. Localizar usuário.
2. Excluir cadastro.

**Resultado Esperado:**

* Usuário removido com sucesso.

---

## Módulo: Produtos

### CT-PROD-001 - Cadastrar produto válido

**Prioridade:** Alta

**Pré-condições:**

* Usuário administrador autenticado.

**Passos:**

1. Acessar cadastro de produtos.
2. Informar nome.
3. Informar preço.
4. Informar descrição.
5. Informar quantidade.
6. Salvar.

**Resultado Esperado:**

* Produto cadastrado com sucesso.

---

### CT-PROD-002 - Cadastrar produto com nome duplicado

**Prioridade:** Alta

**Pré-condições:**

* Produto já cadastrado.

**Passos:**

1. Informar nome já existente.
2. Salvar.

**Resultado Esperado:**

* Sistema deve impedir duplicidade.

---

### CT-PROD-003 - Editar produto

**Prioridade:** Média

**Resultado Esperado:**

* Produto atualizado corretamente.

---

### CT-PROD-004 - Excluir produto

**Prioridade:** Média

**Resultado Esperado:**

* Produto removido com sucesso.

---

## Módulo: Carrinho

### CT-CART-001 - Adicionar produto ao carrinho

**Prioridade:** Alta

**Pré-condições:**

* Produto disponível em estoque.

**Passos:**

1. Selecionar produto.
2. Adicionar ao carrinho.

**Resultado Esperado:**

* Produto incluído no carrinho.

---

### CT-CART-002 - Adicionar múltiplos produtos ao carrinho

**Prioridade:** Média

**Resultado Esperado:**

* Todos os produtos adicionados corretamente.

---

### CT-CART-003 - Finalizar compra

**Prioridade:** Crítica

**Pré-condições:**

* Carrinho com produtos.

**Passos:**

1. Acessar carrinho.
2. Confirmar compra.

**Resultado Esperado:**

* Compra finalizada.
* Estoque atualizado.

---

### CT-CART-004 - Cancelar compra

**Prioridade:** Alta

**Pré-condições:**

* Carrinho com produtos.

**Passos:**

1. Acessar carrinho.
2. Cancelar compra.

**Resultado Esperado:**

* Compra cancelada.
* Estoque restaurado.

---

### CT-CART-005 - Tentar comprar produto sem estoque

**Prioridade:** Alta

**Pré-condições:**

* Produto sem estoque.

**Passos:**

1. Adicionar produto indisponível.
2. Tentar finalizar compra.

**Resultado Esperado:**

* Sistema deve impedir a compra.
* Exibir mensagem apropriada.
