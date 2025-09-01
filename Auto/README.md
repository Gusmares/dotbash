# 📜 Goddamn.sh - Ferramenta Épica de Automação Terminal

![Versão](https://img.shields.io/badge/Versão-2.0.0-blue.svg)
![Linux](https://img.shields.io/badge/Linux-Suportado-green.svg)
![Windows](https://img.shields.io/badge/Windows-Suportado-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

Uma ferramenta épica de automação em bash com interface colorida e funcionalidades incríveis para converter imagens, baixar vídeos, gerar QR codes e muito mais!

## 🎯 Funcionalidades

### 🔄 Conversão de Imagens
- Converter entre formatos: JPEG, PNG, WEBP, BMP, GIF
- Interface intuitiva e visualização no terminal

### 📥 Download de Conteúdo
- **Vídeos**: Suporte a YouTube e outras plataformas
- **Imagens**: Download direto da web em JPEG ou PNG
- Múltiplas qualidades e formatos

### 🎨 Ferramentas Criativas
- **Gerador de QR Codes**: Crie QR codes personalizados
- **Criador de GIFs**: Transforme vídeos em GIFs animados
- **Visualização de Imagens**: Visualize imagens diretamente no terminal

### ⚙️ Utilitários do Sistema
- **Renomeação em Massa**: Renomeie arquivos em lote
- **Informações do Sistema**: Monitoramento de recursos
- **Interface Épica**: Arte ASCII e cores vibrantes

## 🚀 Instalação

### Para Windows (Git Bash)
```bash
# Clone o repositório ou baixe os arquivos
git clone <repository-url>
cd goddamn

# Execute a versão Windows
./goddamn-win.sh
```

### Para Linux (Debian/Ubuntu/Arch)
```bash
# Clone o repositório ou baixe os arquivos
git clone <repository-url>
cd goddamn

# Torne o script executável
chmod +x goddamn-linux.sh

# Execute a versão Linux
./goddamn-linux.sh
```

## 📦 Dependências Automáticas

O script detecta e instala automaticamente as dependências necessárias:

### Windows
- **FFmpeg**: Processamento de vídeo
- **ImageMagick**: Conversão de imagens
- **yt-dlp**: Download de vídeos
- **QREncode**: Geração de QR codes
- **Figlet**: Arte ASCII
- **curl/wget**: Download de arquivos

### Linux
- Mesmas dependências com instalação via gerenciador de pacotes nativo

## 🎮 Como Usar

1. **Execute o script** correspondente ao seu sistema operacional
2. **Escolha uma opção** no menu principal
3. **Siga as instruções** na tela
4. **Aproveite os resultados!**

### Exemplo: Baixar uma imagem
```
[1] Converter Imagem
[2] Baixar Vídeo
[3] Baixar Imagem da Web
[4] Gerar QR Code

Digite o número da opção: 3

Digite a URL da imagem: https://exemplo.com/imagem.jpg
Selecione o formato:
1) JPEG (.jpg)
2) PNG (.png)
Opção: 1
Nome do arquivo: minha_imagem

[+] Imagem baixada: minha_imagem.jpg
```

## 🖥️ Screenshots

## 🛠️ Personalização

### Adicionar novas funcionalidades
Edite o script e adicione novas funções seguindo o padrão:

```bash
minha_nova_funcao() {
    show_status "Iniciando nova funcionalidade..."
    # Sua lógica aqui
    read -n 1 -s -r -p "Pressione qualquer tecla para continuar..."
    echo
}
```

### Modificar cores e tema
Ajuste as variáveis de cor no início do script:

```bash
RED='\033[0;31m'
GREEN='\033[0;32m'
# Adicione suas cores personalizadas
```

## 🤝 Contribuindo

Contribuições são bem-vindas! Siga estos passos:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para detalhes.

## ⚠️ Troubleshooting

### Problemas comuns no Windows
- **Erro de permissão**: Execute o Git Bash como administrador
- **Dependências não instaladas**: Execute o script novamente

### Problemas comuns no Linux
- **sudo não configurado**: Configure sudo ou execute como root
- **Repositórios desatualizados**: Execute `sudo apt update` antes

## 🏆 Créditos

Desenvolvido com ❤️ por [Seu Nome] - Uma ferramenta épica para usuários que amam terminal!

---

**⭐️ Se você gostou deste projeto, deixe uma estrela no repositório!**

## 🔗 Links Úteis

- [Documentação do FFmpeg](https://ffmpeg.org/documentation.html)
- [Documentação do ImageMagick](https://imagemagick.org/script/command-line-tools.php)
- [Repositório yt-dlp](https://github.com/yt-dlp/yt-dlp)

## 🆕 Changelog

### v2.0.0
- Adicionado suporte para Windows e Linux
- Sistema de detecção automática de dependências
- Função de download de imagens da web
- Interface melhorada e mais estável

### v1.0.0
- Versão inicial com funcionalidades básicas
- Conversão de imagens e download de vídeos
- Interface colorida com arte ASCII

---

**💡 Dica:** Use o atalho `Ctrl+C` para sair do script a qualquer momento!
