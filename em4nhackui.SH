#!/bin/bash

# ANSI renk kodları
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
M='\033[1;35m'
C='\033[1;36m'
W='\033[0m'

# Sistem bilgisi ve tarih/saat
show_info() {
    echo -e "${B}───────────────────────────────${W}"
    echo -e "${G}Tarih & Saat: $(date +"%d %B %Y %H:%M:%S")"
    echo -e "Cihaz Adı: $(hostname)"
    echo -e "${B}───────────────────────────────${W}"
}

# Banner
banner() {
    clear
    # Üstte Em4nn UI Welcome!
    echo -e "${M}==============================================${W}"
    echo -e "${G}           Em4nn Hacking UI Welcome!${W}"
    echo -e "${M}==============================================${W}"
    sleep 1

    # Mevcut banner
    echo -e "${C}"
    echo " ███████╗███╗   ███╗4𝐍𝟏 𝐓𝐎𝐎𝐋 "
    echo " ██╔════╝████╗ ████║"
    echo " █████╗  ██╔████╔██║"
    echo " ██╔══╝  ██║╚██╔╝██║"
    echo " ███████╗██║ ╚═╝ ██║"
    echo " ╚══════╝╚═╝     ╚═╝"
    echo -e "${W}"
    sleep 1 
}

# Menü
menu() {
    echo -e "${Y}"
    echo "Yöntemleri Seçin:"
    echo -e "${R}[1]${W} Phishing"
    echo -e "${R}[2]${W} SMS Bomber"
    echo -e "${R}[3]${W} Kamera Hack"
    echo -e "${R}[4]${W} Güncel P4n4l"
    echo -e "${R}[5]${W} Spotify Checker [Aktif Değil]"
    echo -e "${R}[6]${W} Netflix Checker (Aktif) accounts.txt"
    echo -e "${R}[7]${W} Traceroute"
    echo -e "${R}[8]${W} Port Tarama (Nmap)"
    echo -e "${R}[9]${W} Email Sorgulama"
    echo -e "${R}[10]${W} IP / GeoIP Bilgisi"
    echo -e "${R}[11]${W} Domain / Subdomain Sorgusu"
    echo -e "${R}[12]${W} CPU / RAM Durumu"
    echo -e "${R}[13]${W} Disk Kullanımı"
    echo -e "${R}[14]${W} Ağ Trafiği İzleme"
    echo -e "${R}[15]${W} Link Kısaltma / QR Kod Oluşturma"
    echo -e "${R}[16]${W} t.me/em4nhackingui"
    echo -e "${R}[17]${W} Güncellemeleri Kontrol Et"
    echo -e "${R}[99]${W} Gerekli kütüphaneleri Yükle"
    echo -e "${R}[0]${W} Çıkış"
    echo
}

# Ana döngü
while true; do
    banner
    show_info
    menu
    read -p "Seçiminiz >> " choice

    case $choice in
        1)
            cd ~/zphisher && bash zphisher.sh
            ;;
        2)
            cd ~/Enough-Reborn && python3 enough.py
            ;;
        3)
            cd ~/CamHack && bash CamHack.sh
            ;;
        4)
            echo -e "${M}──────────────────────${W}"
            echo "🔗 𝐋𝐈𝐍𝐊: AKTIF DEGIL"
            echo "        AKTIF DEGIL"
            echo "     AKTIF DEGIL"
            echo "──────────────────────"
            echo "⚡️ 𝐊e𝐘: ÜCRETSİZ GİRİŞ MEVCUT"
            echo "──────────────────────"
            echo "🚫 𝐕𝐏𝐍𝐒𝐈𝐙 𝐆𝐈𝐑𝐌𝐄𝐙 🚫"
            echo "──────────────────────"
            echo "En Güncel Linkler için"
            echo "https://github.com/Em4nnn/em4nhackui"
            echo "Em4nn UI Güncelleme"
            echo "cd ~/em4nhackui  /  chmod +x update.sh  /  ./update.sh"
            read -p "Devam etmek için Enter..."
            ;;
        5)
            spotify_checker
            ;;
    
        6)
   if [ ! -f "$HOME/netflix_checker/accounts.txt" ]; then
     echo -e "${R}❌ accounts.txt bulunamadı! Lütfen hesapları ekleyin.${W}"
   else
    python3 "$HOME/netflix_checker/netflix_checker.py"
   fi
   read -p "Devam etmek için Enter..."
   ;;

        7)
            read -p "Hedef IP veya domain: " target
            traceroute "$target"
            read -p "Devam etmek için Enter..."
            ;;
        8)
            read -p "Hedef IP veya domain: " target
            nmap -A "$target"
            read -p "Devam etmek için Enter..."
            ;;
        9)
            read -p "Email adresi girin: " email
            if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$ ]]; then
                echo "Email formatı geçerli: $email"
            else
                echo "Geçersiz email formatı!"
            fi
            read -p "Devam etmek için Enter..."
            ;;
        10)
            read -p "IP adresi girin: " ipaddr
            curl ipinfo.io/"$ipaddr"
            read -p "Devam etmek için Enter..."
            ;;
        11)
            read -p "Domain girin: " domain
            whois "$domain"
            read -p "Devam etmek için Enter..."
            ;;
        12)
            echo -e "${M}────────────────────────${W}"
            echo -e "${G}📊 CPU & RAM Durumu${W}"
            echo -e "${M}────────────────────────${W}"
            top -b -n 1 | head -n 15
            echo -e "${M}────────────────────────${W}"
            read -p "Devam etmek için Enter..."
            ;;
        13)
            echo -e "${M}────────────────────────${W}"
            echo -e "${G}💾 Disk Kullanımı${W}"
            echo -e "${M}────────────────────────${W}"
            df -h | awk 'NR==1 || $6=="/" || $6=="/home"{print}'
            echo -e "${M}────────────────────────${W}"
            read -p "Devam etmek için Enter..."
            ;;
        14)
            echo -e "${M}────────────────────────${W}"
            echo -e "${G}🌐 Ağ Trafiği İzleme (iftop)${W}"
            echo -e "${M}────────────────────────${W}"
            echo "Çıkmak için Ctrl+C kullanın..."
            sudo iftop
            read -p "Devam etmek için Enter..."
            ;;
        15)
            read -p "Link girin: " url
            if command -v qrencode >/dev/null 2>&1; then
                echo "$url" | qrencode -o qr.png
                echo "QR kod qr.png olarak oluşturuldu."
            else
                echo "qrencode yüklü değil! (sudo apt install qrencode)"
            fi
            read -p "Devam etmek için Enter..."
            ;;
        16)
            echo -e "${M}Güncelleme Ve Haberler t.me/em4nhackingui Em4n Inc...${W}"
            read -p "Devam etmek için Enter..."
            ;;

       17)
          echo -e "${C}🔄 Güncelleme kontrolü başlatılıyor...${W}"
           if [ -f "$HOME/em4nhackui/update.sh" ]; then
           chmod +x "$HOME/em4nhackui/update.sh"
           "$HOME/em4nhackui/update.sh"
        else
          echo -e "${R}❌ update.sh dosyası bulunamadı!${W}"
        fi
         read -p "Devam etmek için Enter..."
          ;;
 
        99) 
            echo -e "${Y}Kütüphaneler ve gerekli projeler kuruluyor...${W}"
            
            # Sistem paketleri
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y curl whois traceroute nmap iftop git wget unzip python3 python3-pip chromium-browser chromium-chromedriver qrencode
            
            # Python kütüphaneleri
            pip3 install --upgrade pip
            pip3 install selenium rich
            pip3 install selenium rich requests

            # Reposlar
            if [ ! -d "$HOME/zphisher" ]; then
                git clone https://github.com/htr-tech/zphisher.git "$HOME/zphisher"
            else
                echo -e "${C}Zphisher zaten mevcut, atlanıyor.${W}"
            fi
            
            if [ ! -d "$HOME/Enough-Reborn" ]; then
                git clone https://github.com/thewhiteh4t/Enough-Reborn.git "$HOME/Enough-Reborn"
            else
                echo -e "${C}Enough-Reborn zaten mevcut, atlanıyor.${W}"
            fi

             if [ ! -d "$HOME/netflix_checker" ]; then
          git clone https://github.com/Em4nnn/xx2025xx.git "$HOME/netflix_checker"
             else
             echo -e "${C}Netflix Checker zaten mevcut, atlanıyor.${W}"
           fi

            CAMHACK_REPO="https://github.com/username/CamHack.git"
            if [ ! -d "$HOME/CamHack" ]; then
                git clone "$CAMHACK_REPO" "$HOME/CamHack"
            else
                echo -e "${C}CamHack zaten mevcut, atlanıyor.${W}"
            fi
            
            echo -e "${G}Kurulum tamamlandı!${W}"
            read -p "Devam etmek için Enter..." 
          ;;
       
       0)
            exit 0
            ;;
        *)
            echo -e "${R}Geçersiz seçim!${W}"
            sleep 1
            ;;
    esac
done
