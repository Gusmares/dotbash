#!/bin/bash

# --- Cores e estilos ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# --- Funções de mensagem ---
show_status() { echo -e "${GREEN}[+]${NC} $1"; }
show_error() { echo -e "${RED}[-]${NC} $1"; }
show_warning() { echo -e "${YELLOW}[!]${NC} $1"; }

# --- Função para detectar distribuição ---
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    elif [ -f /etc/arch-release ]; then
        echo "arch"
    else
        echo "unknown"
    fi
}

# --- Instalar dependências Linux ---
install_dependencies_linux() {
    local missing_deps=("$@")
    local distro=$(detect_distro)

    echo -e "${YELLOW}As seguintes dependências serão instaladas:${NC}"
    for dep in "${missing_deps[@]}"; do
        case $dep in
            "ffmpeg") echo " - FFmpeg" ;;
            "convert") echo " - ImageMagick" ;;
            "yt-dlp") echo " - yt-dlp" ;;
            "qrencode") echo " - QREncode" ;;
            "figlet") echo " - Figlet" ;;
            "curl") echo " - curl" ;;
            "wget") echo " - wget" ;;
        esac
    done

    echo -e "\n${YELLOW}Deseja instalar estas dependências? [s/N]${NC}"
    read -r response
    if [[ "$response" =~ ^[Ss]([Ii][Mm])?$ ]]; then
        show_status "Instalando dependências para $distro..."

        case $distro in
            "ubuntu"|"debian")
                sudo apt update
                for dep in "${missing_deps[@]}"; do
                    case $dep in
                        "ffmpeg") sudo apt install -y ffmpeg ;;
                        "convert") sudo apt install -y imagemagick ;;
                        "yt-dlp")
                            sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
                            sudo chmod a+rx /usr/local/bin/yt-dlp
                            ;;
                        "qrencode") sudo apt install -y qrencode ;;
                        "figlet") sudo apt install -y figlet ;;
                        "curl") sudo apt install -y curl ;;
                        "wget") sudo apt install -y wget ;;
                    esac
                done
                ;;
            "arch")
                sudo pacman -Sy
                for dep in "${missing_deps[@]}"; do
                    case $dep in
                        "ffmpeg") sudo pacman -S --noconfirm ffmpeg ;;
                        "convert") sudo pacman -S --noconfirm imagemagick ;;
                        "yt-dlp") sudo pacman -S --noconfirm yt-dlp ;;
                        "qrencode") sudo pacman -S --noconfirm qrencode ;;
                        "figlet") sudo pacman -S --noconfirm figlet ;;
                        "curl") sudo pacman -S --noconfirm curl ;;
                        "wget") sudo pacman -S --noconfirm wget ;;
                    esac
                done
                ;;
            *)
                show_error "Distribuição não suportada!"
                return 1
                ;;
        esac

        show_status "Dependências instaladas!"
        return 0
    else
        show_error "Instalação cancelada."
        return 1
    fi
}

# --- Verificação de dependências Linux ---
check_dependencies_linux() {
    local deps=("ffmpeg" "convert" "yt-dlp" "qrencode" "figlet" "curl")
    local missing_deps=()

    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing_deps+=("$dep")
        fi
    done

    if [ ${#missing_deps[@]} -ne 0 ]; then
        install_dependencies_linux "${missing_deps[@]}"
        return $?
    fi
    return 0
}

# --- Função para baixar imagens (Linux) ---
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
    if wget -q -O "$output_file" "$image_url"; then
        show_status "Imagem baixada: $output_file"
    else
        show_error "Falha no download!"
        return 1
    fi

    read -n 1 -s -r -p "$(echo -e ${CYAN}"Pressione qualquer tecla para continuar..."${NC})"
    echo
}

# --- Arte ASCII e outras funções (manter como na versão Windows) ---
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

# --- Menu principal Linux ---
main_menu_linux() {
    while true; do
        show_ascii_art
        echo -e "${CYAN}          MENU PRINCIPAL${NC}"
        echo -e "${YELLOW}=========================================${NC}"
        echo -e " ${RED}[1]${NC} Converter Imagem"
        echo -e " ${RED}[2]${NC} Baixar Vídeo"
        echo -e " ${RED}[3]${NC} Baixar Imagem da Web"
        echo -e " ${RED}[4]${NC} Criar GIF de Vídeo"
        echo -e " ${RED}[5]${NC} Gerar QR Code"
        echo -e " ${RED}[6]${NC} Informações do Sistema"
        echo -e " ${RED}[7]${NC} Sair"
        echo -e "${YELLOW}=========================================${NC}"
        read -p "$(echo -e ${CYAN}"Digite o número da opção: "${NC})" choice

        case $choice in
            1) convert_image ;;
            2) download_video ;;
            3) download_image ;;
            4) create_gif ;;
            5) generate_qrcode ;;
            6) system_info ;;
            7)
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

# --- Iniciar script Linux ---
check_dependencies_linux
if [ $? -eq 0 ]; then
    main_menu_linux
else
    exit 1
fi
