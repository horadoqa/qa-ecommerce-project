#!/bin/bash

OUTPUT="produtos.csv"

echo "nome,preco,descricao,quantidade" > "$OUTPUT"

for i in $(seq 1 500); do
  nome="Produto $i"
  preco=$(awk -v min=10 -v max=5000 'BEGIN{srand(); printf "%.2f", min+rand()*(max-min)}')
  descricao="Descricao do produto $i"
  quantidade=$((RANDOM % 500 + 1))

  echo "$nome,$preco,$descricao,$quantidade" >> "$OUTPUT"
done

echo "Arquivo $OUTPUT gerado com 500 produtos com sucesso."