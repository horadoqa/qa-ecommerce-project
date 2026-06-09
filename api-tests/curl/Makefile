# =========================
# ServeRest API Test Suite
# CRUD Users + Products + Auth Token Persistence
# =========================

API_URL=https://serverest.dev
TOKEN_FILE=.token

# =========================
# HELP
# =========================

help:
	@echo "===================================="
	@echo " ServeRest API Test Suite"
	@echo "===================================="
	@echo ""
	@echo "AUTH:"
	@echo "  make login"
	@echo "  make show-token"
	@echo "  make clear-token"
	@echo ""
	@echo "USERS:"
	@echo "  make user-create"
	@echo "  make user-list"
	@echo "  make user-get"
	@echo "  make user-update"
	@echo "  make user-delete"
	@echo ""
	@echo "PRODUCTS:"
	@echo "  make product-create"
	@echo "  make product-list"
	@echo "  make product-get"
	@echo "  make product-update"
	@echo "  make product-delete"
	@echo ""

# =========================
# AUTH - TOKEN MANAGEMENT
# =========================

login:
	@echo "Fazendo login..."
	@TOKEN=$$(curl -s --location "$(API_URL)/login" \
	--header "Content-Type: application/json" \
	--data-raw '{ "email":"qauser@test.com", "password":"123456" }' | jq -r '.authorization') ; \
	echo $$TOKEN > $(TOKEN_FILE) ; \
	echo "Token salvo com sucesso!"

show-token:
	@cat $(TOKEN_FILE)

clear-token:
	@rm -f $(TOKEN_FILE)
	@echo "Token removido"

# =========================
# USERS - CRUD (SEM TOKEN)
# =========================

user-create:
	curl --location "$(API_URL)/usuarios" \
	--header "Content-Type: application/json" \
	--data-raw '{ "nome":"QA User", "email":"qauser@test.com", "password":"123456", "administrador":"true" }'

user-list:
	curl --location "$(API_URL)/usuarios"

user-get:
	@echo "Informe o ID: "; \
	read id; \
	curl --location "$(API_URL)/usuarios/$$id"

user-update:
	@echo "Informe o ID: "; \
	read id; \
	curl --location --request PUT "$(API_URL)/usuarios/$$id" \
	--header "Content-Type: application/json" \
	--data-raw '{ "nome":"QA Updated", "email":"updated@test.com", "password":"123456", "administrador":"true" }'

user-delete:
	@echo "Informe o ID: "; \
	read id; \
	curl --location --request DELETE "$(API_URL)/usuarios/$$id"

# =========================
# PRODUCTS - CRUD (COM TOKEN)
# =========================

product-create:
	curl --location "$(API_URL)/produtos" \
	--header "Content-Type: application/json" \
	--header "Authorization: $$(cat $(TOKEN_FILE))" \
	--data-raw '{ "nome":"Mouse QA", "preco":100, "descricao":"Produto de teste", "quantidade":10 }'

product-list:
	curl --location "$(API_URL)/produtos" \
	--header "Authorization: $$(cat $(TOKEN_FILE))"

product-get:
	@echo "Informe o ID: "; \
	read id; \
	curl --location "$(API_URL)/produtos/$$id" \
	--header "Authorization: $$(cat $(TOKEN_FILE))"

product-update:
	@echo "Informe o ID: "; \
	read id; \
	curl --location --request PUT "$(API_URL)/produtos/$$id" \
	--header "Content-Type: application/json" \
	--header "Authorization: $$(cat $(TOKEN_FILE))" \
	--data-raw '{ "nome":"Mouse QA Updated", "preco":150, "descricao":"Atualizado", "quantidade":20 }'

product-delete:
	@echo "Informe o ID: "; \
	read id; \
	curl --location --request DELETE "$(API_URL)/produtos/$$id" \
	--header "Authorization: $$(cat $(TOKEN_FILE))"