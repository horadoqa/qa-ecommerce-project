#!/bin/bash

# =========================
# CORES
# =========================
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

API_URL="https://serverest.dev"

SUCCESS=0
FAILED=0

# =========================
# LISTAR USUÁRIOS
# =========================
get_usuarios() {
    curl --silent --location "$API_URL/usuarios"
}

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Iniciando remoção dos usuários...${NC}"
echo -e "${BLUE}========================================${NC}"

RESPONSE=$(get_usuarios)

USER_IDS=$(echo "$RESPONSE" | jq -r '.usuarios[]?._id')

if [ -z "$USER_IDS" ]; then
    echo -e "${YELLOW}⚠ Nenhum usuário encontrado.${NC}"
    exit 0
fi

TOTAL=$(echo "$USER_IDS" | wc -l)

echo -e "${BLUE}Total de usuários encontrados:${NC} $TOTAL"

for USER_ID in $USER_IDS
do
    echo ""
    echo -e "${BLUE}Removendo usuário ID:${NC} $USER_ID"

    RESPONSE=$(curl --silent \
        --request DELETE \
        --location "$API_URL/usuarios/$USER_ID")

    MESSAGE=$(echo "$RESPONSE" | jq -r '.message // empty')

    if echo "$MESSAGE" | grep -qi "registro excluído"; then
        echo -e "${GREEN}✔ Usuário removido com sucesso${NC}"
        SUCCESS=$((SUCCESS + 1))
    else
        echo -e "${RED}✗ Erro ao remover usuário${NC}"
        echo "$RESPONSE" | jq .
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "================ RELATÓRIO FINAL ================"
echo -e "${BLUE}Total encontrados: $TOTAL${NC}"
echo -e "${GREEN}Sucesso: $SUCCESS${NC}"
echo -e "${RED}Falhas: $FAILED${NC}"
echo "================================================="