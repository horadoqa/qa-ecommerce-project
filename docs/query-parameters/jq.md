# Query Parameters & JQ

Usar **Query Parameters** e usar **`jq`** resolvem problemas diferentes, então normalmente eles se complementam.

### Query Parameters: filtrar no servidor

Quando você faz:

```bash
curl "https://serverest.dev/usuarios?nome=João"
```

o servidor recebe o filtro e retorna apenas os registros que atendem ao critério.

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

---

### jq: filtrar no cliente

Com `jq`, você baixa a resposta inteira e filtra localmente:

```bash
curl -s "https://serverest.dev/usuarios" | jq '.usuarios[] | select(.nome == "João")'
```

**Vantagens:**

* Permite filtros complexos.
* Não depende da API suportar determinado filtro.
* Permite transformar, agrupar e formatar dados.
* Excelente para scripts e automações.

---

### Comparação prática

Imagine uma API com 100.000 usuários.

#### Query Parameter

```bash
curl "https://serverest.dev/usuarios?nome=João"
```

Tráfego:

```text
Servidor -> 1 usuário
```

#### jq

```bash
curl "https://serverest.dev/usuarios" | jq ...
```

Tráfego:

```text
Servidor -> 100.000 usuários
Cliente -> filtra 1 usuário
```

Nesse caso, Query Parameters são muito mais eficientes.

---

### Quando usar cada um?

**Prefira Query Parameters quando:**

* A API oferece o filtro que você precisa.
* Você quer performance.
* O volume de dados pode crescer.

**Use jq quando:**

* A API não possui o filtro desejado.
* Você precisa combinar condições complexas.
* Quer extrair ou transformar campos específicos.

---

### Melhor prática

Muitas vezes o ideal é usar os dois juntos:

```bash
curl -s "https://serverest.dev/usuarios?administrador=true" \
| jq '.usuarios[] | {nome, email}'
```

Nesse exemplo:

1. A API filtra apenas administradores.
2. O `jq` formata a saída mostrando apenas `nome` e `email`.

Assim você reduz o tráfego e ainda aproveita o poder de manipulação do `jq`.
