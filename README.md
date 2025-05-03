# ------------------------------------------------------------------------------
# dotbash - Scripts para o Terminal
# ------------------------------------------------------------------------------

# Este Makefile automatiza tarefas comuns para o repositório dotbash.
# Simplifica a clonagem, a configuração de permissões e fornece informações
# sobre como usar e contribuir com os scripts Bash.

.PHONY: all clone chmod use contribute license contact info

all: info clone chmod use contribute license contact

info:
	@echo "------------------------------------------------------------------------------"
	@echo "dotbash - Scripts para o Terminal"
	@echo "------------------------------------------------------------------------------"
	@echo ""
	@echo "Bem-vindo ao dotbash. Este repositório contém uma coleção de scripts Bash."
	@echo "São ferramentas que abrangem funcionalidades básicas e um pouco mais avançadas,"
	@echo "com foco em praticidade e organização."
	@echo ""
	@echo "O objetivo é fornecer um conjunto de ferramentas úteis para o dia a dia no terminal."
	@echo ""
	@echo "Funcionalidades:"
	@echo "  - Scripts práticos para tarefas diárias"
	@echo "  - Saída organizada"
	@echo "  - Desenvolvido com foco na utilidade"
	@echo ""

clone:
	@echo "Clonando o repositório dotbash..."
	@if [ ! -d "dotbash" ]; then \
		git clone https://github.com/seu-usuario/dotbash.git; \
		echo "Repositório dotbash clonado com sucesso."; \
	else \
		echo "O diretório 'dotbash' já existe."; \
	fi

chmod: clone
	@echo "Configurando permissões de execução para os scripts..."
	@if [ -d "dotbash" ]; then \
		cd dotbash && chmod +x *.sh && cd ..; \
		echo "Permissões de execução concedidas aos scripts."; \
	else \
		echo "Diretório 'dotbash' não encontrado. Execute 'make clone' primeiro."; \
	fi

use:
	@echo ""
	@echo "Como Usar:"
	@echo ""
	@echo "1. Clone o repositório:"
	@echo "   git clone https://github.com/seu-usuario/dotbash.git"
	@echo "   cd dotbash"
	@echo ""
	@echo "2. Conceda permissões de execução:"
	@echo "   chmod +x *.sh"
	@echo ""
	@echo "3. Execute os scripts:"
	@echo "   Cada script possui sua própria finalidade e pode ter instruções específicas."
	@echo "   Consulte os arquivos ou READMEs dentro do diretório."
	@echo ""

contribute:
	@echo ""
	@echo "Contribuições:"
	@echo ""
	@echo "Contribuições são bem-vindas. Para sugerir melhorias ou adicionar novos scripts:"
	@echo ""
	@echo "  - Abra uma issue com sua sugestão."
	@echo "  - Envie um pull request com seu código."
	@echo ""

license:
	@echo ""
	@echo "Licença:"
	@echo ""
	@echo "Este projeto está licenciado sob a MIT License."
	@echo "Consulte o arquivo de licença para mais detalhes."
	@echo ""

contact:
	@echo ""
	@echo "Contato:"
	@echo ""
	@echo "Para entrar em contato:"
	@echo ""
	@echo "  GitHub: https://github.com/seu-usuario"
	@echo "  Gmail: gustavocg2107@gmail.com"
	@echo "  LinkedIn: https://www.linkedin.com/in/gustavo-gaspar-270850319/"
	@echo ""

final: info
	@echo ""
	@echo "Desenvolvido por Gusmares."
	@echo "------------------------------------------------------------------------------"

.PHONY: final
all: final
