banner()
{
    printf '\e[93m
                                __             __         __ __            
 .---.-.--.--.----.---.-.______|__.-----.-----|  |_.---.-|  |  .-----.----.
 |  _  |  |  |   _|  _  |______|  |     |__ --|   _|  _  |  |  |  -__|   _|
 |___._|_____|__| |___._|      |__|__|__|_____|____|___._|__|__|_____|__|  
                                                                           
                                                                           
                                                                           
                                                                           
'
}

rootcheck()
{
if [[ $EUID -ne 0 ]]; then
   echo "\n\e[0m[\e[91m!\e[0m] THIS SCRIPT MUST BE RUN AS ROOT! ABORTING...\n" 
   exit 1
fi
}

rootcheck

info='\n\e[0m[\e[92mi\e[0m] INSTALLING TOOL...\n'

banner
read -p "PRESS [ENTER] TO INSTALL..."

service="network-manager"
if [ -f "/etc/init.d/$service" ]; then
    printf '\n\e[0m[\e[92mi\e[0m] Service network-manager is installed!\n\n'; sleep 1.2
else
    apt-get install network-manager -y
fi 

command -v aircrack-ng >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install aircrack-ng; }
    command -v macchanger >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install macchanger; }
    command -v speedtest-cli >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install speedtest-cli -y; }
    command -v figlet >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install figlet -y; }
    command -v l2ping >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install bluez -y; }
    command -v ruby >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install ruby -y; }
     command -v unzip >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install unzip -y; }
    command -v curl >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install curl -y; }
    command -v wget >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; apt-get install wget -y; }
    
command -v lolcat >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; 
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
rm -r master.zip
cd lolcat-master/bin
gem install lolcat
cd -
rm -r lolcat-master

}

printf '\n\e[0m[\e[92mi\e[0m] COPYING SETTINGS...\n'
mkdir config
wget https://raw.githubusercontent.com/rkhunt3r/aura/master/settings.conf
mv settings.conf config

chmod +x aura.sh
printf "\n\e[0m[\e[92mi\e[0m] DONE!\n"
