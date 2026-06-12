#!/bin/bash

# =========================
# CORES
# =========================
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor

API_PRODUTOS="https://serverest.dev/produtos"
LOGIN_URL="https://serverest.dev/login"
USERS_URL="https://serverest.dev/usuarios"

# =========================
# CREDENCIAIS
# =========================
USER_NAME="Admin Teste"
LOGIN_EMAIL="admin@teste.com"
LOGIN_PASSWORD="123456"

SESSION_TOKEN=""

SUCCESS=0
FAILED=0

# =========================
# CRIAR USUÁRIO (SE PRECISAR)
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

    MSG=$(echo "$RESPONSE" | jq -r '.message // empty')

    if echo "$MSG" | grep -qi "email"; then
        echo "ℹ Usuário já existe"
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
    fi

    echo -e "${RED}✗ Falha no login${NC}"
    echo "$RESPONSE" | jq .
    return 1
}

# =========================
# LISTAR PRODUTOS
# =========================
get_products() {
    curl --silent --location "$API_PRODUTOS" \
      --header "Authorization: $SESSION_TOKEN"
}

# =========================
# DELETE PRODUTO
# =========================
delete_product() {
    local id="$1"

    response=$(curl --silent --location --request DELETE \
      "$API_PRODUTOS/$id" \
      --header "Authorization: $SESSION_TOKEN")

    echo "$response"

    echo "$response" | jq -r '.message // empty' | grep -qi "token"
    return $?
}

# =========================
# GARANTIR AUTH
# =========================
ensure_auth() {
    if [ -z "$SESSION_TOKEN" ]; then
        create_user
        login || return 1
    fi
}

# =========================
# INÍCIO
# =========================
echo "========================================"
echo "Iniciando remoção de produtos"
echo "========================================"

ensure_auth || exit 1

# =========================
# BUSCA PRODUTOS
# =========================
RESPONSE=$(get_products)

PRODUCT_IDS=$(echo "$RESPONSE" | jq -r '.produtos[]?._id')

if [ -z "$PRODUCT_IDS" ]; then
    echo "⚠ Nenhum produto encontrado"
    exit 0
fi

TOTAL=$(echo "$PRODUCT_IDS" | wc -l)

echo "Total de produtos encontrados: $TOTAL"
echo ""

# =========================
# LOOP DELETE
# =========================
for ID in $PRODUCT_IDS; do

    echo "----------------------------------------"
    echo "Deletando produto: $ID"

    ATTEMPT=0
    MAX_ATTEMPTS=2
    SUCCESS_FLAG=0

    while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do

        RESPONSE=$(delete_product "$ID")

        MSG=$(echo "$RESPONSE" | jq -r '.message // empty')

        # sucesso típico da API ServeRest
        if echo "$MSG" | grep -qi "sucesso"; then
            echo -e "${GREEN}✔ Produto removido: $ID${NC}"
            SUCCESS=$((SUCCESS + 1))
            SUCCESS_FLAG=1
            break
        fi

        # token inválido
        if echo "$MSG" | grep -qi "token"; then
           cho -e "${YELLOW}⚠ Token inválido. Recriando autenticação...${NC}"
            SESSION_TOKEN=""
            ensure_auth
        fi

        ATTEMPT=$((ATTEMPT + 1))
    done

    if [ $SUCCESS_FLAG -eq 0 ]; then
        echo -e "${RED}✗ Falha ao remover: $ID${NC}"
        FAILED=$((FAILED + 1))
    fi

done

# =========================
# RELATÓRIO FINAL
# =========================
echo ""
echo "================ RELATÓRIO FINAL ================"
echo -e "${BLUE}Total de produtos: $TOTAL${NC}"
echo -e "${GREEN}Produtos removidos: $SUCCESS${NC}"
echo -e "${RED}Produtos que não foram removidos: $FAILED${NC}"
echo "================================================="