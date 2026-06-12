#!/bin/bash

# =========================
# CORES
# =========================
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor

API_URL="https://serverest.dev/produtos"
LOGIN_URL="https://serverest.dev/login"
USERS_URL="https://serverest.dev/usuarios"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

JSON_FILE="$PROJECT_ROOT/data/produtos2.json"

# =========================
# VALIDAÇÃO JSON
# =========================
if ! jq empty "$JSON_FILE" 2>/dev/null; then
    echo "ERRO: JSON de produtos inválido"
    exit 1
fi

# =========================
# PRODUTOS
# =========================
mapfile -t PRODUCTS < <(jq -c '.[]' "$JSON_FILE")

TOTAL=${#PRODUCTS[@]}
SUCCESS=0
FAILED=0

# =========================
# CREDENCIAIS DINÂMICAS
# =========================
USER_NAME="Admin Teste"
LOGIN_EMAIL="admin@teste.com"
LOGIN_PASSWORD="123456"
SESSION_TOKEN=""

# =========================
# CADASTRAR USUÁRIO (SE NECESSÁRIO)
# =========================
create_user() {
    echo -e "${BLUE}👤 Verificando/criando usuário...${NC}"

    RESPONSE=$(curl --silent --location "$USERS_URL" \
      --header "Content-Type: application/json" \
      --data-raw "{
        \"nome\": \"$USER_NAME\",
        \"email\": \"$LOGIN_EMAIL\",
        \"password\": \"$LOGIN_PASSWORD\",
        \"administrador\": \"true\"
      }")

    MESSAGE=$(echo "$RESPONSE" | jq -r '.message // empty')

    if echo "$MESSAGE" | grep -qi "email"; then
        echo -e "${YELLOW}ℹ Usuário já existe${NC}"
        return 0
    fi

    if echo "$RESPONSE" | jq -e '.message' >/dev/null 2>&1; then
        echo -e "${GREEN}✔ Usuário criado ou já existente${NC}"
        return 0
    fi

    echo -e "${GREEN}✔ Cadastro de usuário concluído${NC}"
}

# =========================
# LOGIN
# =========================
login() {
    echo -e "${BLUE}🔐 Realizando login...${NC}"

    RESPONSE=$(curl --silent --location "$LOGIN_URL" \
      --header "Content-Type: application/json" \
      --data-raw "{
        \"email\": \"$LOGIN_EMAIL\",
        \"password\": \"$LOGIN_PASSWORD\"
      }")

    TOKEN=$(echo "$RESPONSE" | jq -r '.authorization // empty')

    if [ -n "$TOKEN" ]; then
        SESSION_TOKEN="$TOKEN"
        echo -e "${GREEN}✔ Login OK${NC}"
        return 0
    else
        echo -e "${RED}✗ Falha no login${NC}"
        echo "$RESPONSE" | jq .
        return 1
    fi
}

# =========================
# CREATE PRODUCT
# =========================
create_product() {
    local payload="$1"

    response=$(curl --silent --location "$API_URL" \
      --header "Content-Type: application/json" \
      --header "Authorization: $SESSION_TOKEN" \
      --data-raw "$payload")

    echo "$response"

    echo "$response" | jq -r '.message // empty' | grep -qi "token"
    return $?
}

# =========================
# GARANTIR AUTENTICAÇÃO
# =========================
ensure_auth() {
    if [ -z "$SESSION_TOKEN" ]; then
        create_user
        login || return 1
    fi
    return 0
}

# =========================
# INÍCIO
# =========================
echo "========================================"
echo "Iniciando cadastro de produtos"
echo "Total: $TOTAL"
echo "========================================"
echo ""

ensure_auth || exit 1

# =========================
# LOOP PRODUTOS
# =========================
for row in "${PRODUCTS[@]}"; do

    nome=$(echo "$row" | jq -r '.nome')
    preco=$(echo "$row" | jq -r '.preco')
    descricao=$(echo "$row" | jq -r '.descricao')
    quantidade=$(echo "$row" | jq -r '.quantidade')

    echo "----------------------------------------"
    echo -e "${BLUE}Produto:${NC} $nome"

    payload=$(jq -n \
      --arg nome "$nome" \
      --arg preco "$preco" \
      --arg descricao "$descricao" \
      --arg quantidade "$quantidade" \
      '{
        nome: $nome,
        preco: $preco,
        descricao: $descricao,
        quantidade: $quantidade
      }')

    ATTEMPT=0
    MAX_ATTEMPTS=2
    SUCCESS_FLAG=0

    while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do

        RESPONSE=$(create_product "$payload")

        ID=$(echo "$RESPONSE" | jq -r '._id // empty')
        ERROR=$(echo "$RESPONSE" | jq -r '.message // empty')

        # =========================
        # SUCESSO
        # =========================
        if [ -n "$ID" ]; then
            echo -e "${GREEN}✔ Produto criado com sucesso: $ID${NC}"
            SUCCESS=$((SUCCESS + 1))
            SUCCESS_FLAG=1
            break
        fi

        # =========================
        # TOKEN INVÁLIDO
        # =========================
        if echo "$ERROR" | grep -qi "token"; then
            echo -e "${YELLOW}⚠ Token inválido. Recriando autenticação...${NC}"
            SESSION_TOKEN=""
            ensure_auth
        fi

        ATTEMPT=$((ATTEMPT + 1))
    done

    # =========================
    # FALHA FINAL
    # =========================
    if [ $SUCCESS_FLAG -eq 0 ]; then
        echo -e "${RED}✗ Falha no produto: $nome${NC}"
        FAILED=$((FAILED + 1))
    fi

done

# =========================
# RELATÓRIO FINAL
# =========================
echo ""
echo "================ RELATÓRIO FINAL ================"
echo "Total de produtos: $TOTAL"
echo -e "${GREEN}Sucesso: $SUCCESS${NC}"
echo -e "${RED}Falha: $FAILED${NC}"
echo "================================================="