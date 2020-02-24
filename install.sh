banner()
{
    printf '\e[93m
                                __             __         __ __            
 .---.-.--.--.----.---.-.______|__.-----.-----|  |_.---.-|  |  .-----.----.
 |  _  |  |  |   _|  _  |______|  |     |__ --|   _|  _  |  |  |  -__|   _|
 |___._|_____|__| |___._|      |__|__|__|_____|____|___._|__|__|_____|__|  
                                                                           
                                                                           
                                                                           
                                                                           
'
}

banner
read -p "PRESS [ENTER] TO INSTALL..."
printf "\nINSTALLING...\n\e[0m"
chmod +x aura.sh
apt update 
apt-get install aircrack-ng -y 
apt-get install macchanger -y 
apt-get install speedtest-cli -y
apt-get install figlet -y
printf "\e[93m\nDONE!\n"
