# Listar Produtos (READ ALL)

```bash
curl --location 'https://serverest.dev/produtos'
```

## Esperado:

```json
{
    "quantidade": 15,
    "produtos": [
        {
            "nome": "Sausages SKU: 71102242",
            "preco": 171,
            "descricao": "The Football Is Good For Training And Recreational Purposes",
            "quantidade": 56,
            "_id": "9DjLPXyev9ONoHmc"
        },
        {
            "nome": "Cheese SKU: 44779705",
            "preco": 127,
            "descricao": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
            "quantidade": 45,
            "_id": "9W4i8DY2G02mqXiO"
        },
        {
            "nome": "Tuna SKU: 28587163",
            "preco": 133,
            "descricao": "The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients",
            "quantidade": 33,
            "_id": "9WAAqlbVS1V8phmA"
        },
        {
            "nome": "Logitech MX Vertical",
            "preco": 470,
            "descricao": "Mouse",
            "quantidade": 382,
            "_id": "BeeJh5lz3k6kSIzA"
        },
        {
            "nome": "Sausages SKU: 23330753",
            "preco": 130,
            "descricao": "Boston's most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
            "quantidade": 52,
            "_id": "GFRALsUvUKRtfPJM"
        },
        {
            "nome": "Fish SKU: 73531263",
            "preco": 151,
            "descricao": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
            "quantidade": 93,
            "_id": "IwZjaNiDhugTmkr3"
        },
        {
            "nome": "Samsung 60 polegadas",
            "preco": 5240,
            "descricao": "TV",
            "quantidade": 49977,
            "_id": "K6leHdftCeOJj8BJ"
        },
        {
            "nome": "Shirt SKU: 11717617",
            "preco": 186,
            "descricao": "The Football Is Good For Training And Recreational Purposes",
            "quantidade": 96,
            "_id": "UrAYk3K3Emzjo9CW"
        },
        {
            "nome": "Shirt SKU: 62283129",
            "preco": 136,
            "descricao": "The Football Is Good For Training And Recreational Purposes",
            "quantidade": 83,
            "_id": "Y1U30YQipX94Q3ze"
        },
        {
            "nome": "Table SKU: 28621652",
            "preco": 144,
            "descricao": "The Football Is Good For Training And Recreational Purposes",
            "quantidade": 78,
            "_id": "YCkIjxKE9lc0ASmL"
        },
        {
            "nome": "Fish SKU: 71830534",
            "preco": 143,
            "descricao": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
            "quantidade": 14,
            "_id": "c3LAgk6d06nlNg95"
        },
        {
            "nome": "Mouse Gamer QA",
            "preco": 150,
            "descricao": "Mouse para testes de automação",
            "quantidade": 10,
            "_id": "luZ2p6CIt58ggE67"
        },
        {
            "nome": "Soap SKU: 84773404",
            "preco": 127,
            "descricao": "The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design",
            "quantidade": 61,
            "_id": "rdlQSzgYyM48v9wt"
        },
        {
            "nome": "Logitech MX Vertical 1",
            "preco": 480,
            "descricao": "Mouse",
            "quantidade": 389,
            "_id": "uvi87QgeqzQk6ebF"
        },
        {
            "nome": "Mouse Gamer QA 2",
            "preco": 150,
            "descricao": "Mouse para testes de automação",
            "quantidade": 0,
            "_id": "zlC4WQzJL2FCGki1"
        }
    ]
}
```

---

## Buscar Produto por ID (READ ONE)

```bash id="prod3"
curl --location 'https://serverest.dev/produtos/zlC4WQzJL2FCGki1'
```

## Esperado:


```json
{
    "nome": "Mouse Gamer QA 2",
    "preco": 150,
    "descricao": "Mouse para testes de automação",
    "quantidade": 0,
    "_id": "zlC4WQzJL2FCGki1"
}
```

---

## Buscar Produto por ID (READ ONE), mas a base foi removida

```bash
curl --location 'https://serverest.dev/produtos/zlC4WQzJL2FCGki1'
```

## Esperado:

```json
{
    "message": "Produto não encontrado"
}
```
