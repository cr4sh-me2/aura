banner()
{
    clear
    printf '\e[93m
 8888b.  888  888 888d888 8888b.      
    "88b 888  888 888P"      "88b 
.d888888 888  888 888    .d888888  
888  888 Y88b 888 888    888  888 
"Y888888  "Y88888 888    "Y888888 v0.1\n
'
}

banner
read -p "PRESS [ENTER] TO INSTALL..."
printf "\nINSTALLING...\n"
apt update 
apt-get install aircrack-ng -y 
apt-get install macchanger -y 
apt-get install speedtest-cli -y
apt-get install figlet -y
printf "\nDONE!\n"
