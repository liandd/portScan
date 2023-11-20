#!/bin/bash
#Autor:liandd
##Colours
greenColour="\e[0;32m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m"
blueColour="\e[0;34m"
yellowColour="\e[0;33m"
purpleColour="\e[0;35m"
turquoiseColour="\e[0;36m"
grayColour="\e[0;37m"

function ctrl_c(){
  echo -e "\n\n${redColour}[!] Saliendo...\n${endColour}"
  tput cnorm; exit 1
}

# Ctrl+C
trap ctrl_c INT

tput civis # Ocultar el cursor
for port in $(seq 1 65535); do
  (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "${yellowColour}[+]${endColour} ${grayColour}$port -${endColour}${blueColour} OPEN${endColour}" &
done; wait

# Recuperamos el cursor
tput cnorm
