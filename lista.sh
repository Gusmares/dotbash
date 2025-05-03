#!/bin/bash
RED="\033[31m"
YELLOW="\033[33;5m"
GREEN="\033[32m"
CYAN="\033[36:1m"
RESET="\033[0m"
help="${CYAN}Este script lista grupos do arquivo /etc/group com base em diferentes critérios.${RESET}

${YELLOW}Uso:${RESET} ./listar.sh -ls <categoria>

${YELLOW}Categorias disponíveis:${RESET}
  ${GREEN}ls1${RESET}   Grupos que começam com a letra 'r'.
  ${GREEN}ls2${RESET}   Grupos que terminam com a letra 't'.
  ${GREEN}ls3${RESET}   Grupos que começam com 'r' e terminam com 't'.
  ${GREEN}ls4${RESET}   Grupos que terminam com 'e' ou 'd'.
  ${GREEN}ls5${RESET}   Grupos que não terminam com 'e' ou 'd'.
  ${GREEN}ls6${RESET}   Grupos que começam com um dígito e a segunda letra é 'u' ou 'd'.
  ${GREEN}ls7${RESET}   Grupos com nome de 2 a 4 caracteres.
  ${GREEN}ls8${RESET}   Grupos que começam com 'r' ou 's'.

${YELLOW}Opções:${RESET}
  ${GREEN}-h${RESET}        Exibe esta mensagem de ajuda.
  ${GREEN}-ls <categoria>${RESET}  Lista os grupos da categoria especificada.
"

listar1 () {
  echo -e "${CYAN}Listando grupos que começam com 'r'${YELLOW}...${RESET}"
  sleep 1
  grep '^r' /etc/group
}

listar2 () {
  echo -e "${CYAN}Listando grupos que terminam com 't'${YELLOW}...${RESET}"
  sleep 1
  grep 't$' /etc/group
}

listar3 () {
  echo -e "${CYAN}Listando grupos que começam com 'r' e terminam com 't'${YELLOW}...${RESET}"
  sleep 1
  grep '^r.*t$' /etc/group
}

listar4 () {
  echo -e "${CYAN}Listando grupos que terminam com 'e' ou 'd'${YELLOW}...${RESET}"
  sleep 1
  grep -E 't$|d$' /etc/group
}

listar5 () {
  echo -e "${CYAN}Listando grupos que não terminam com 'e' ou 'd'${YELLOW}...${RESET}"
  sleep 1
  grep -E '[^e]|[^d]' /etc/group
}

listar6 () {
  echo -e "${CYAN}Listando grupos que começam com qualquer dígito e segunda letra 'u' ou 'd'${YELLOW}...${RESET}"
  sleep 1
  grep -E '^.[ud]' /etc/group
}

listar7 () {
  echo -e "${CYAN}Listando grupos com nome de 2 a 4 caracteres${YELLOW}...${RESET}"
  sleep 1
  grep -E '^.{2,4}:' /etc/group
}

listar8 () {
  echo -e "${CYAN}Listando grupos que começam com 'r' ou 's'${YELLOW}...${RESET}"
  sleep 1
  grep -E '^r|^s' /etc/group
}


opcao_ls=""
flag_ls_encontrada=false

while getopts "hls:" opt; do
  case "$opt" in
    h)
      echo -e "$help"
      exit 0
      ;;
    l)
      ;;
    s)
      opcao_ls="$OPTARG"
      flag_ls_encontrada=true
      ;;
    \?)
      echo -e "${RED}Opção inválida: -$OPTARG${RESET}" >&2
      echo -e "Use './${0##*/}' -h para ajuda." >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

if [ "$flag_ls_encontrada" = true ] && [ -n "$opcao_ls" ]; then
  case "$opcao_ls" in
    ls1) listar1 && exit 0 ;;
    ls2) listar2 && exit 0 ;;
    ls3) listar3 && exit 0 ;;
    ls4) listar4 && exit 0 ;;
    ls5) listar5 && exit 0 ;;
    ls6) listar6 && exit 0 ;;
    ls7) listar7 && exit 0 ;;
    ls8) listar8 && exit 0 ;;
    *)
      echo -e "${RED}Categoria de listagem inválida: '$opcao_ls'.${RESET}"
      echo -e "Use './${0##*/}' -h para ver as categorias disponíveis."
      exit 1
      ;;
  esac
else
  echo -e "${RED}Nenhuma categoria de listagem especificada com a opção -ls.${RESET}"
  echo -e "Use './${0##*/}' -ls <categoria> ou './${0##*/}' -h para ajuda."
  exit 1
fi

exit 0
