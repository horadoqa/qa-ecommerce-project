#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

CSV_FILE="$PROJECT_ROOT/data/produtos.csv"
JSON_FILE="$PROJECT_ROOT/data/produtos.json"

if [ ! -f "$CSV_FILE" ]; then
    echo "Arquivo CSV não encontrado: $CSV_FILE"
    exit 1
fi

echo "Convertendo CSV para JSON..."

jq -R -s '
  split("\n")                          # quebra linhas
  | map(select(length > 0))            # remove linhas vazias
  | .[1:]                              # remove cabeçalho
  | map(
      split(",")
      | {
          nome: .[0],
          preco: (.[1] | tonumber),
          descricao: .[2],
          quantidade: (.[3] | tonumber)
        }
    )
' "$CSV_FILE" > "$JSON_FILE"

echo "Conversão concluída!"
echo "Arquivo gerado: $JSON_FILE"