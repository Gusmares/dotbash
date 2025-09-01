#!/bin/bash

# --- Cores e estilos para interface épica ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# --- Função para exibir mensagens de status ---
show_status() { echo -e "${GREEN}[+]${NC} $1"; }
show_error() { echo -e "${RED}[-]${NC} $1"; }
show_warning() { echo -e "${YELLOW}[!]${NC} $1"; }

# --- Função para instalar dependências no Windows ---
install_dependencies_windows() {
    local missing_deps=("$@")

    echo -e "${YELLOW}As seguintes dependências serão instaladas:${NC}"
    for dep in "${missing_deps[@]}"; do
        case $dep in
            "ffmpeg") echo " - FFmpeg (processamento de vídeo)" ;;
            "convert") echo " - ImageMagick (processamento de imagem)" ;;
            "yt-dlp") echo " - yt-dlp (download de vídeos)" ;;
            "qrencode") echo " - QREncode (geração de QR codes)" ;;
            "figlet") echo " - Figlet (arte ASCII)" ;;
            "curl") echo " - curl (transferência de dados)" ;;
            "wget") echo " - wget (download de arquivos)" ;;
        esac
    done

    echo -e "\n${YELLOW}Deseja instalar estas dependências? [s/N]${NC}"
    read -r response
    if [[ "$response" =~ ^[Ss]([Ii][Mm])?$ ]]; then
        echo -e "${GREEN}Instalando dependências...${NC}"

        # Verificar se o Chocolatey está instalado
        if ! command -v choco &> /dev/null; then
            show_status "Instalando Chocolatey..."
            powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
            export PATH="$PATH:/c/ProgramData/chocolatey/bin"
        fi

        for dep in "${missing_deps[@]}"; do
            show_status "Instalando $dep..."
            case $dep in
                "ffmpeg") choco install ffmpeg -y --force ;;
                "convert") choco install imagemagick -y --force ;;
                "yt-dlp")
                    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -o /usr/local/bin/yt-dlp.exe
                    chmod +x /usr/local/bin/yt-dlp.exe
                    ;;
                "qrencode") choco install qrencode -y --force ;;
                "figlet") choco install figlet -y --force ;;
                "curl") choco install curl -y --force ;;
                "wget") choco install wget -y --force ;;
            esac
        done

        show_status "Dependências instaladas! Talvez precise reiniciar o terminal."
        return 0
    else
        show_error "Instalação cancelada."
        return 1
    fi
}

# --- Verificação de dependências Windows ---
check_dependencies_win() {
    local deps=("ffmpeg" "convert" "yt-dlp" "qrencode" "figlet" "curl")
    local missing_deps=()

    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing_deps+=("$dep")
        fi
    done

    if [ ${#missing_deps[@]} -ne 0 ]; then
        install_dependencies_windows "${missing_deps[@]}"
        return $?
    fi
    return 0
}

# --- Arte ASCII épica ---
show_ascii_art() {
    clear
    echo -e "${MAGENTA}"
    echo "

▓█████▄  ▒█████  ▄▄▄█████▓ ▄▄▄▄    ▄▄▄        ██████  ██░ ██  ▐██▌
▒██▀ ██▌▒██▒  ██▒▓  ██▒ ▓▒▓█████▄ ▒████▄    ▒██    ▒ ▓██░ ██▒ ▐██▌
░██   █▌▒██░  ██▒▒ ▓██░ ▒░▒██▒ ▄██▒██  ▀█▄  ░ ▓██▄   ▒██▀▀██░ ▐██▌
░▓█▄   ▌▒██   ██░░ ▓██▓ ░ ▒██░█▀  ░██▄▄▄▄██   ▒   ██▒░▓█ ░██  ▓██▒
░▒████▓ ░ ████▓▒░  ▒██▒ ░ ░▓█  ▀█▓ ▓█   ▓██▒▒██████▒▒░▓█▒░██▓ ▒▄▄
 ▒▒▓  ▒ ░ ▒░▒░▒░   ▒ ░░   ░▒▓███▀▒ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒ ░▀▀▒
 ░ ▒  ▒   ░ ▒ ▒░     ░    ▒░▒   ░   ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░ ░  ░
 ░ ░  ░ ░ ░ ░ ▒    ░       ░    ░   ░   ▒   ░  ░  ░   ░  ░░ ░    ░
   ░        ░ ░            ░            ░  ░      ░   ░  ░  ░ ░
 ░                              ░

"
    echo -e "${CYAN}"
    echo "    A ferramenta épica de automação terminal!"
    echo -e "${YELLOW}=========================================${NC}"
}

# --- Função para baixar imagens da internet ---
download_image() {
    show_status "Download de imagens da internet..."

    read -p "$(echo -e ${CYAN}"Digite a URL da imagem: "${NC})" image_url

    if [ -z "$image_url" ]; then
        show_error "URL não fornecida!"
        return 1
    fi

    echo -e "${CYAN}Selecione o formato:${NC}"
    echo "1) JPEG (.jpg)"
    echo "2) PNG (.png)"
    read -p "$(echo -e ${CYAN}"Opção: "${NC})" format_choice

    case $format_choice in
        1) extension="jpg" ;;
        2) extension="png" ;;
        *)
            show_error "Opção inválida!"
            return 1
            ;;
    esac

    read -p "$(echo -e ${CYAN}"Nome do arquivo (sem extensão): "${NC})" filename
    output_file="${filename}.${extension}"

    show_status "Baixando imagem..."
    if curl -s -o "$output_file" "$image_url"; then
        show_status "Imagem baixada: $output_file"
    else
        show_error "Falha no download!"
        return 1
    fi

    read -n 1 -s -r -p "$(echo -e ${CYAN}"Pressione qualquer tecla para continuar..."${NC})"
    echo
}

# --- Funções principais (convert_image, download_video, etc.) ---
# [As funções anteriores convert_image, download_video, etc. aqui]
# ... (manter as funções existentes)

# --- Menu principal Windows ---
main_menu_win() {
    while true; do
        show_ascii_art
        echo -e "${CYAN}          MENU PRINCIPAL${NC}"
        echo -e "${YELLOW}=========================================${NC}"
        echo -e " ${RED}[1]${NC} Converter Imagem"
        echo -e " ${RED}[2]${NC} Baixar Vídeo"
        echo -e " ${RED}[3]${NC} Baixar Imagem da Web"
        echo -e " ${RED}[4]${NC} Gerar QR Code"
        echo -e " ${RED}[5]${NC} Informações do Sistema"
        echo -e " ${RED}[6]${NC} Sair"
        echo -e "${YELLOW}=========================================${NC}"
        read -p "$(echo -e ${CYAN}"Digite o número da opção: "${NC})" choice

        case $choice in
            1) convert_image ;;
            2) download_video ;;
            3) download_image ;;
            4) generate_qrcode ;;
            5) system_info ;;
            6)
                echo -e "${RED}Saindo... Obrigado por usar o GODDAMN!${NC}"
                exit 0
                ;;
            *)
                show_error "Opção inválida!"
                sleep 2
                ;;
        esac
    done
}

# --- Iniciar script Windows ---
check_dependencies_win
if [ $? -eq 0 ]; then
    main_menu_win
else
    exit 1
fi
