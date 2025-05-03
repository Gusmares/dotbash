# ------------------------------------------------------------------------------
# 🌟 dotbash - Deixe seu terminal brilhar! 🌟
# ------------------------------------------------------------------------------

# 🚀 Sobre este Makefile 🚀
# Este arquivo Makefile automatiza tarefas comuns para o repositório dotbash.
# Simplifica a clonagem, a configuração de permissões e fornece informações
# sobre como usar e contribuir com este conjunto de scripts Bash.

# 🎯 Metas Principais 🎯
.PHONY: all clone chmod use contribute license contact info

all: info clone chmod use contribute license contact

info:
	@echo "------------------------------------------------------------------------------"
	@echo "🌟 dotbash - Deixe seu terminal brilhar! 🌟"
	@echo "------------------------------------------------------------------------------"
	@echo ""
	@echo "👋 Bem-vindo ao dotbash, meu repositório onde o terminal vira palco! 👋"
	@echo "   Aqui você encontra uma coleção de até 10 scripts Bash cheios de personalidade,"
	@echo "   feitos com muito carinho e um toque do meu jeito único. São ferramentas que"
	@echo "   vão do básico ao quase avançado, com cores vibrantes e aquele charme que"
	@echo "   faz o #!/bin/bash brilhar! ✨"
	@echo ""
	@echo "🎯 O que é o dotbash? 🎯"
	@echo "   O dotbash é meu laboratório de ideias no terminal. Um lugar onde crio scripts"
	@echo "   Bash para simplificar a vida, automatizar tarefas ou só curtir a vibe do Linux."
	@echo "   Cada script é como uma pintura: simples, funcional e com um toque de estilo"
	@echo "   (spoiler: eu adoro um output colorido! 🎨). A meta é ter até 10 ferramentas,"
	@echo "   a maioria básicas, mas todas com aquele quê especial que é só meu. ☕"
	@echo ""
	@echo "   🛠️ Scripts práticos para o dia a dia"
	@echo "   🎨 Outputs coloridos e cheios de vida"
	@echo "   😎 Feito com o meu jeito de programar"
	@echo ""

clone:
	@echo "⬇️ Clonando o repositório dotbash..."
	@if [ ! -d "dotbash" ]; then \
		git clone https://github.com/seu-usuario/dotbash.git; \
		echo "✅ Repositório dotbash clonado com sucesso!"; \
	else \
		echo "⚠️ O diretório 'dotbash' já existe. Se precisar clonar novamente, remova-o primeiro."; \
	fi

chmod: clone
	@echo "🔑 Liberando o poder dos scripts (chmod +x *.sh)..."
	@if [ -d "dotbash" ]; then \
		cd dotbash && chmod +x *.sh && cd ..; \
		echo "✅ Permissões de execução concedidas aos scripts!"; \
	else \
		echo "⚠️ Diretório 'dotbash' não encontrado. Execute 'make clone' primeiro."; \
	fi

use:
	@echo ""
	@echo "🖥️ Como Usar 🖥️"
	@echo "   Quer mergulhar no dotbash? É só seguir esses passos:"
	@echo ""
	@echo "   1. Clone o repositório e sinta a vibe:"
	@echo "      git clone https://github.com/seu-usuario/dotbash.git"
	@echo "      cd dotbash"
	@echo ""
	@echo "   2. Libere o poder dos scripts:"
	@echo "      chmod +x *.sh"
	@echo ""
	@echo "   3. Escolha sua ferramenta e divirta-se:"
	@echo "      Cada script tem suas próprias instruções. Dá uma olhada nos arquivos ou"
	@echo "      nos READMEs específicos na pasta! 📂"
	@echo ""

contribute:
	@echo ""
	@echo "🤝 Contribuindo 🤝"
	@echo "   O dotbash é meu xodó, mas estou sempre aberto a ideias! Se você quiser"
	@echo "   sugerir melhorias ou até criar algo novo, é só:"
	@echo ""
	@echo "   - Abrir uma issue com sua ideia 💡"
	@echo "   - Mandar um pull request com seu código 🚀"
	@echo ""
	@echo "   Vamos fazer o terminal brilhar juntos? 😄"
	@echo ""

license:
	@echo ""
	@echo "📜 Licença 📜"
	@echo "   O dotbash está sob a MIT License. Isso significa que você pode usar, remixar"
	@echo "   e compartilhar à vontade, desde que dê um high-five com os créditos pro seu"
	@echo "   amigo aqui! ✋"
	@echo ""

contact:
	@echo ""
	@echo "📬 Contato 📬"
	@echo "   Quer trocar ideia sobre Bash, Linux ou só jogar conversa fora? Me acha por aí:"
	@echo ""
	@echo "   🌐 GitHub: https://github.com/seu-usuario"
	@echo "   📧 Gmail: gustavocg2107@gmail.com"
	@echo "   🔗 LinkedIn: https://www.linkedin.com/in/gustavo-gaspar-270850319/"
	@echo ""
	@echo "   Tô sempre na área pra um papo! 🗣️"
	@echo ""

final: info
	@echo ""
	@echo "✨ Feito com 💻, muita cafeína e paixão pelo terminal por Gusmares. ✨"
	@echo "------------------------------------------------------------------------------"

.PHONY: final
all: final
