#!/bin/bash

# =========================
# CORES
# 🔵 Informações do processo
# 🟢 Cadastro realizado com sucesso
# 🔴 Erros de cadastro
# 🟡 Destaque para o e-mail do usuário cadastrado
# =========================
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

API_URL="https://serverest.dev/usuarios"

SUCCESS=0
FAILED=0

# =========================
# CAMINHOS
# =========================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

JSON_FILE="$PROJECT_ROOT/data/user.json"

# =========================
# VALIDAÇÃO
# =========================
if [ ! -f "$JSON_FILE" ]; then
    echo -e "${RED}Arquivo $JSON_FILE não encontrado.${NC}"
    exit 1
fi

if ! jq empty "$JSON_FILE" 2>/dev/null; then
    echo -e "${RED}JSON inválido: $JSON_FILE${NC}"
    exit 1
fi

# =========================
# TOTAL DE REGISTROS
# =========================
TOTAL=$(jq length "$JSON_FILE")

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Iniciando cadastro de usuários${NC}"
echo -e "${BLUE}Total encontrados: $TOTAL${NC}"
echo -e "${BLUE}========================================${NC}"

# =========================
# LOOP DE CADASTRO
# =========================
while read -r user
do
    nome=$(echo "$user" | jq -r '.nome')
    email=$(echo "$user" | jq -r '.email')
    password=$(echo "$user" | jq -r '.password')
    administrador=$(echo "$user" | jq -r '.administrator')

    echo ""
    echo -e "${BLUE}Cadastrando usuário:${NC} $nome (${YELLOW}$email${NC})"

    response=$(curl --silent --location "$API_URL" \
      --header "Content-Type: application/json" \
      --data-raw "{
        \"nome\": \"$nome\",
        \"email\": \"$email\",
        \"password\": \"$password\",
        \"administrador\": \"$administrador\"
      }")

    if echo "$response" | jq -e '._id' >/dev/null 2>&1; then
        echo -e "${GREEN}✔ Usuário cadastrado com sucesso${NC}"
        SUCCESS=$((SUCCESS + 1))
    else
        echo -e "${RED}✗ Erro ao cadastrar usuário${NC}"
        FAILED=$((FAILED + 1))
    fi

    echo -e "${BLUE}Resposta:${NC}"
    echo "$response" | jq .

    echo -e "${BLUE}----------------------------------------${NC}"

done < <(jq -c '.[]' "$JSON_FILE")

# =========================
# RELATÓRIO FINAL
# =========================
echo ""
echo -e "${GREEN}Processamento concluído.${NC}"

echo ""
echo "================ RELATÓRIO FINAL ================"
echo -e "${BLUE}Total do Registros: $TOTAL${NC}"
echo -e "${GREEN}Total cadastrado: $SUCCESS${NC}"
echo -e "${RED}Falhas no cadastro: $FAILED${NC}"
echo "================================================="