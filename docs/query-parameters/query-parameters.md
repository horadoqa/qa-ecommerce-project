# Query Parameters

## Quando usar?

Prefira Query Parameters quando:

* A API oferece o filtro que você precisa.
* Você quer performance.
* O volume de dados pode crescer.

## Filtrar direto no servidor

Quando você faz:

```bash
curl "https://serverest.dev/usuarios?nome=João"
```

O servidor recebe o filtro e retorna apenas os registros que atendem ao critério.

**Vantagens:**

* Menos dados trafegando pela rede.
* Resposta mais rápida.
* Menor consumo de memória no cliente.
* A lógica de busca fica centralizada na API.
* Funciona bem com grandes volumes de dados.

Exemplo:

```bash
curl "https://serverest.dev/produtos?nome=Notebook"
```

A API já devolve apenas os produtos chamados "Notebook".

## Exemplos

### Buscar usuário pelo nome

```bash
curl -X GET "https://serverest.dev/usuarios?nome=João"
```

### Buscar pelo e-mail

```bash
curl -X GET "https://serverest.dev/usuarios?email=joao@email.com"
```

### Combinar múltiplos filtros

Use `&` para separar os parâmetros:

```bash
curl -X GET "https://serverest.dev/usuarios?nome=João&email=joao@email.com"
```

### Buscar um produto por nome

```bash
curl -X GET "https://serverest.dev/produtos?nome=Logitech MX Vertical"
```

### Exemplo com resposta formatada

```bash
curl -s "https://serverest.dev/usuarios?nome=João" | jq
```

### Estrutura geral

```text
https://serverest.dev/<recurso>?campo1=valor1&campo2=valor2
```

Onde:

* `?` inicia a query string.
* `campo=valor` define um filtro.
* `&` separa múltiplos filtros.

Por exemplo:

```bash
curl "https://serverest.dev/usuarios?administrador=true"
```

ou

```bash
curl "https://serverest.dev/produtos?preco=470"
```
