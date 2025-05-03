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
	@cat <<EOF
------------------------------------------------------------------------------
🌟 dotbash - Deixe seu terminal brilhar! 🌟
------------------------------------------------------------------------------

👋 Bem-vindo ao dotbash, meu repositório onde o terminal vira palco! 👋
  Aqui você encontra uma coleção de até 10 scripts Bash cheios de personalidade,
  feitos com muito carinho e um toque do meu jeito único. São ferramentas que
  vão do básico ao quase avançado, com cores vibrantes e aquele charme que
  faz o #!/bin/bash brilhar! ✨

🎯 O que é o dotbash? 🎯
  O dotbash é meu laboratório de ideias no terminal. Um lugar onde crio scripts
  Bash para simplificar a vida, automatizar tarefas ou só curtir a vibe do Linux.
  Cada script é como uma pintura: simples, funcional e com um toque de estilo
  (spoiler: eu adoro um output colorido! 🎨). A meta é ter até 10 ferramentas,
  a maioria básicas, mas todas com aquele quê especial que é só meu. ☕

  🛠️ Scripts práticos para o dia a dia
  🎨 Outputs coloridos e cheios de vida
  😎 Feito com o meu jeito de programar

EOF

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
	@cat <<EOF

🖥️ Como Usar 🖥️
  Quer mergulhar no dotbash? É só seguir esses passos:

  1. Clone o repositório e sinta a vibe:
     git clone https://github.com/seu-usuario/dotbash.git
     cd dotbash

  2. Libere o poder dos scripts:
     chmod +x *.sh

  3. Escolha sua ferramenta e divirta-se:
     Cada script tem suas próprias instruções. Dá uma olhada nos arquivos ou
     nos READMEs específicos na pasta! 📂

EOF

contribute:
	@cat <<EOF

🤝 Contribuindo 🤝
  O dotbash é meu xodó, mas estou sempre aberto a ideias! Se você quiser
  sugerir melhorias ou até criar algo novo, é só:

  - Abrir uma issue com sua ideia 💡
  - Mandar um pull request com seu código 🚀

  Vamos fazer o terminal brilhar juntos? 😄

EOF

license:
	@cat <<EOF

📜 Licença 📜
  O dotbash está sob a MIT License. Isso significa que você pode usar, remixar
  e compartilhar à vontade, desde que dê um high-five com os créditos pro seu
  amigo aqui! ✋

EOF

contact:
	@cat <<EOF

📬 Contato 📬
  Quer trocar ideia sobre Bash, Linux ou só jogar conversa fora? Me acha por aí:

  🌐 GitHub: https://github.com/seu-usuario
  📧 Gmail: gustavocg2107@gmail.com
  🔗 LinkedIn: https://www.linkedin.com/in/gustavo-gaspar-270850319/

  Tô sempre na área pra um papo! 🗣️

EOF

final: info
	@cat <<EOF

✨ Feito com 💻, muita cafeína e paixão pelo terminal por Gusmares. ✨
------------------------------------------------------------------------------
EOF

.PHONY: final
all: final
