# ------------------------------------------------------------------------------
# 🌟 dotbash - Deixe seu terminal brilhar! 🌟
# ------------------------------------------------------------------------------

# 🚀 Sobre este Makefile 🚀
# Automatiza tarefas para o repositório dotbash: clonar, dar permissão,
# exibir instruções, licenças e contatos.

## 🗂️ Seções

### 📌 Informações Gerais
info:
	@cat <<EOF
------------------------------------------------------------------------------
🌟 dotbash - Deixe seu terminal brilhar! 🌟
------------------------------------------------------------------------------

👋 Bem-vindo ao dotbash, meu repositório onde o terminal vira palco! 👋
Aqui você encontra até 10 scripts Bash com estilo e praticidade, do básico ao
quase avançado — sempre com cores vibrantes e um toque pessoal. ✨

🎯 O que é o dotbash?
  • Meu laboratório de ideias no terminal.
  • Scripts úteis, automatizados e com outputs coloridos 🎨
  • A meta? Até 10 ferramentas únicas e cheias de personalidade ☕

EOF

### 📦 Clonagem do Repositório
clone:
	@echo "⬇️ Clonando o repositório dotbash..."
	@if [ ! -d "dotbash" ]; then \
		git clone https://github.com/seu-usuario/dotbash.git; \
		echo "✅ Repositório clonado com sucesso!"; \
	else \
		echo "⚠️ Diretório 'dotbash' já existe. Remova-o para clonar novamente."; \
	fi

### 🔐 Permissões de Execução
chmod:
	@echo "🔑 Concedendo permissão de execução aos scripts..."
	@if [ -d "dotbash" ]; then \
		cd dotbash && chmod +x *.sh && cd ..; \
		echo "✅ Scripts agora são executáveis!"; \
	else \
		echo "⚠️ Diretório 'dotbash' não encontrado. Execute 'make clone' primeiro."; \
	fi

### 🛠️ Como Usar
use:
	@cat <<EOF

🖥️ Como Usar

1. Clone o repositório:
   git clone https://github.com/seu-usuario/dotbash.git
   cd dotbash

2. Dê permissão de execução:
   chmod +x *.sh

3. Execute os scripts com ./nomedoscript.sh
   Cada script tem instruções próprias no README ou no próprio arquivo.

EOF

### 🤝 Como Contribuir
contribute:
	@cat <<EOF

🤝 Contribuindo

Quer colaborar? Sinta-se à vontade:

• Abra uma issue com sugestões 💡
• Envie um pull request com melhorias 🚀

Vamos fazer o terminal brilhar juntos! 😄

EOF

### 📜 Licença
license:
	@cat <<EOF

📜 Licença

Este projeto está sob a MIT License.
Use, modifique e compartilhe — só não esqueça de dar os créditos! ✋

EOF

### 📬 Contato
contact:
	@cat <<EOF

📬 Contato

• GitHub:   https://github.com/seu-usuario
• Gmail:    gustavocg2107@gmail.com
• LinkedIn: https://www.linkedin.com/in/gustavo-gaspar-270850319/

Tô sempre na área pra trocar ideia! 🗣️

EOF

### ✨ Encerramento
final:
	@cat <<EOF

✨ Feito com 💻, cafeína e paixão pelo terminal por Gusmares. ✨
------------------------------------------------------------------------------

EOF

## 🎯 Metas Principais
.PHONY: all info clone chmod use contribute license contact final
all: info clone chmod use contribute license contact final
