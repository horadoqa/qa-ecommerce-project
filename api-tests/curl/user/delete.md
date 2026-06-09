# Excluir Usuário (DELETE)

```bash
curl --location --request DELETE 'https://serverest.dev/usuarios/{SEU_ID}'
```

**Esperado:**

```json
{
    "message": "Registro excluído com sucesso"
}
```

---


## Conferindo

```bash
curl https://serverest.dev/usuarios/{SEU_ID}
```

**Esperado:**

```json
{
    "message": "Usuário não encontrado"
}
```