# ⚡ Em4nn Hacking UI


---

## ⚡ Çalıştırma

**cd ~/em4nhackui**

**chmod +x em4nhackui.SH**
  
  **./em4nhackui.SH**

## 📖 Açıklama
**Em4nn Hacking UI**, Bash tabanlı bir çok amaçlı araç topluluğudur.  
Siber güvenlik ve ağ testlerinde kullanılabilecek farklı modülleri tek bir konsol arayüzü üzerinden yönetmeyi sağlar.  
Renkli menü ve kolay kullanım sayesinde Linux üzerinde hızlıca bilgi toplama, test etme ve çeşitli araçları çalıştırma imkanı sunar.  

⚠️ **Not:** Bu araç yalnızca eğitim ve siber güvenlik testleri için tasarlanmıştır. Kötüye kullanım tamamen kullanıcının sorumluluğundadır.  

---

## ⚡ Özellikler
- 🎭 **Phishing** 
- 📱 **SMS Bomber** 
- 📷 **Kamera Hack**   
- 🎵 **Spotify Account Checker**   
- 👻 **Netflix Accocunt Checker** 
- 📢 **Güncel p4nel linkleri**
- 🌍 **Ping Testi & Traceroute**  
- 🔎 **Port Tarama (Nmap)**  
- 📧 **Email doğrulama**  
- 🌐 **IP / GeoIP Bilgisi (ipinfo.io)**  
- 🏷️ **Domain / Subdomain sorgulama (whois)**  
- 🖥️ **CPU / RAM Durumu**  
- 💾 **Disk Kullanımı**  
- 📡 **Ağ Trafiği İzleme (iftop)**  
- 🔗 **Link Kısaltma / QR Kod Oluşturma**  

---

## 🖥️ Sistem Gereksinimleri
- **İşletim Sistemi**: Linux (Ubuntu/Debian tabanlı önerilir)  
- **Python**: 3.8+  
- **Paketler**: `git`, `curl`, `whois`, `traceroute`, `nmap`, `iftop`, `chromium-browser`, `chromium-chromedriver`  
- **İnternet bağlantısı** (araçların bazıları online çalışmaktadır)  

---

## 📦 Gerekli Kütüphaneler
Kurulum için menüden `99` seçeneğini çalıştırabilirsiniz.  

Elle yüklemek isteyenler için:  
```bash
sudo apt update && sudo apt install -y curl whois traceroute nmap iftop git wget unzip python3 python3-pip chromium-browser chromium-chromedriver qrencode
pip3 install selenium rich
