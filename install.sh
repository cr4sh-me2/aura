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
printf "\nINSTALLING...\n"
apt update 
apt-get install network-manager -y
apt-get install aircrack-ng -y 
apt-get install macchanger -y 
apt-get install speedtest-cli -y
apt-get install figlet -y
apt-get install ruby -y
apt-get install wget -y
apt-get install curl -y
apt-get install unzip -y
apt-get install l2ping -y
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
rm -r master.zip
cd lolcat-master/bin
gem install lolcat
cd -
rm -r lolcat-master
chmod +x aura.sh
printf "\nDONE!\n"
