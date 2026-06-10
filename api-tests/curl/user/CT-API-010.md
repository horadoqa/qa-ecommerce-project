## CT-API-010 - Buscar usuário inexistente

```bash
curl --location 'https://serverest.dev/usuarios/{_id}'
```

**Esperado:**

```json
{
  "message": "Usuário não encontrado"
}
```