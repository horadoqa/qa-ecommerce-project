#!/bin/bash

API_URL="https://serverest.dev/login"

# Caminho robusto baseado na localização do script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

JSON_FILE="$PROJECT_ROOT/data/user.json"
TOKENS_FILE="$PROJECT_ROOT/data/tokens.json"

if [ ! -f "$JSON_FILE" ]; then
    echo "Arquivo $JSON_FILE não encontrado."
    exit 1
fi

echo "[" > "$TOKENS_FILE"

FIRST=true

jq -c '.[]' "$JSON_FILE" | while read -r user
do
    email=$(echo "$user" | jq -r '.email')
    password=$(echo "$user" | jq -r '.password')

    echo "Realizando login: $email"

    response=$(curl --silent --location "$API_URL" \
      --header "Content-Type: application/json" \
      --data-raw "{
        \"email\": \"$email\",
        \"password\": \"$password\"
      }")

    token=$(echo "$response" | jq -r '.authorization // empty')

    if [ -n "$token" ]; then

        if [ "$FIRST" = true ]; then
            FIRST=false
        else
            echo "," >> "$TOKENS_FILE"
        fi

        cat >> "$TOKENS_FILE" <<EOF
{
  "email": "$email",
  "token": "$token"
}
EOF

        echo "✓ Login realizado com sucesso"
    else
        echo "✗ Falha no login"
        echo "$response" | jq .
    fi

done

echo "]" >> "$TOKENS_FILE"

echo ""
echo "Tokens salvos em: $TOKENS_FILE"
