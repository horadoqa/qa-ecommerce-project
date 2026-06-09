# Listar Usuários (READ)

```bash
curl --location 'https://serverest.dev/usuarios'
```

---

# Buscar Usuário por ID (READ)

Substitua o ID pelo retornado no cadastro.

```bash
curl --location 'https://serverest.dev/usuarios/{SEU_ID}'
```

---


## Buscar usuário inexistente

```bash
curl --location 'https://serverest.dev/usuarios/ID_INEXISTENTE'
```

**Esperado:**

```json
{
  "message": "Usuário não encontrado"
}
```