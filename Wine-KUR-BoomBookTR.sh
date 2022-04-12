#!/bin/bash

clear

printf "\e[32m
╔═╦══╦═╦══╦╦╦══╗
║╬║╔╗║╬╠╗╗║║║══╣
║╔╣╠╣║╗╬╩╝║║╠══║
╚╝╚╝╚╩╩╩══╩═╩══╝
╔╗─╔╦══╦═╦╦═╗
║╚╦╝╠║║╣║║║╦╝
╚╗║╔╬║║╣║║║╩╗
─╚═╝╚══╩╩═╩═╝
╔╦╦╦╦═╦╦╦╗╔╦╦═╦═╗
║╔╣║║╬║║║║║║║║║║║
║╚╣║║╗╣║║╚╣║║║║║║
╚╩╩═╩╩╩═╩═╩═╩╩═╩╝
╔═════════════════════════
║ \e[31mPardus-ETAP Wine Kurulumu v1.0 \e[32m
╠═════════════════════════
║ 『x』 Çıkış
╠═════════════════════════
║ 『1』 ETAP Güncelle
║ 『2』 Wine Stable (Stabil) Kur
║ 『3』 Wine Stable (Stabil) Kur (FORCE Yöntemi)
║ 『4』 Wine Development (Geliştirici) Kur
║ 『5』 Wine Development (Geliştirici) Kur (FORCE Yöntemi)
║ 『6』 Wine Staging (Geliştirme) Kur
║ 『7』 Wine Staging (Geliştirme) Kur (FORCE Yöntemi)
║ 『8』 Wine Versiyonunu Öğren (--version)
║ 『9』 Wine Ayarlar ve Konfigurasyonu (winecfg)
║ 『10』 Wine Testi Yap
║ 『11』 Wine Kaldırma Aracı
║ 『12』 Yazılım Bilgileri
╠═════════════════════════
"
read -e -p $'╚══════〙İşlem Numarası ▶ ' secim

if [[ $secim == x || $secim == X ]]; then
printf "
『!』Kapatılıyor...
"
    sleep 2
    exit


elif [[ $secim == 1 ]]; then
printf "
『!』Pardus-ETAP Güncellenecek...

"

read -n 1 -p "Pardus-ETAP güncellemesi yapılacaktır. Başlasın mı? Evet (E), Hayır (H)?" ans;

case $ans in
    e|E)
        sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade;;
    h|H)
        exit;;
    *)
        exit;;
esac


echo 
sleep 4
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 2 ]]; then
    printf "
『!』Wine Stabil Kurulumu Başlıyor...

"

# KOD BAŞI

sudo apt --purge remove wine* -y
sudo apt autoremove -y
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt-key del F987672F | sudo apt update
sudo dpkg --add-architecture i386
sudo apt update
# echo "deb http://19.depo.pardus.org.tr/backports/ ondokuz-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/pardus-backports.list
# echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/debian-backports.list
# echo "deb http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs.list
# echo "deb-src http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs-source.list
# wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key
echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" | sudo tee /etc/apt/sources.list.d/winehq.list
# sudo apt-get -t ondokuz-backports update -y
# sudo apt-get -t buster-backports update -y
sudo apt update
sudo apt -y install gnupg2 software-properties-common
sudo apt update
# sudo apt-get -t ondokuz-backports install wine -y ; echo "y" | sudo apt install -f
# sudo apt-get -t ondokuz-backports install wine32 -y ; echo "y" | sudo apt install -f
# sudo apt-get -t buster-backports install wine wine32 libwine fonts-wine -y ; echo "y" | sudo apt install -f
# sudo apt install wine wine32 libwine fonts-wine -y
sudo apt install --install-recommends winehq-stable -y
# sudo apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
sudo apt update
sudo dpkg-reconfigure wine-stable-amd64 wine-stable wine-stable-i386
# sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt update -y
# sudo apt dist-upgrade
sudo apt autoremove -y
sudo apt autoclean -y

# KOD SONU


    printf "

『!』Kurulum Bitti...

"

sleep 3
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 3 ]]; then
    printf "
『!』Wine Stabil FORCE YÖNTEMİ ile Kurulumu Başlıyor...

"

# KOD BAŞI

sudo apt --purge remove wine* -y
sudo apt autoremove -y
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt-key del F987672F | sudo apt update
sudo dpkg --add-architecture i386
sudo apt update
echo "deb http://19.depo.pardus.org.tr/backports/ ondokuz-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/pardus-backports.list
# echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/debian-backports.list
echo "deb http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs.list
echo "deb-src http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs-source.list
# wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key
echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" | sudo tee /etc/apt/sources.list.d/winehq.list
sudo apt-get -t ondokuz-backports update -y
# sudo apt-get -t buster-backports update -y
sudo apt update
sudo apt -y install gnupg2 software-properties-common
sudo apt update
# sudo apt-get -t ondokuz-backports install wine -y ; echo "y" | sudo apt install -f
sudo apt-get -t ondokuz-backports install wine32 -y ; echo "y" | sudo apt install -f
# sudo apt-get -t buster-backports install wine wine32 libwine fonts-wine -y ; echo "y" | sudo apt install -f
# sudo apt install wine wine32 libwine fonts-wine -y
sudo apt install --install-recommends winehq-stable -y
sudo apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
sudo apt update
sudo dpkg-reconfigure wine-stable-amd64 wine-stable wine-stable-i386
# sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt update -y
# sudo apt dist-upgrade
sudo apt autoremove -y
sudo apt autoclean -y

# KOD SONU


    printf "

『!』Kurulum Bitti...

"

sleep 3
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 4 ]]; then
    printf "
『!』Wine Development (Geliştirici) Kurulumu Başlıyor...

"


# KOD BAŞI

sudo apt --purge remove wine* -y
sudo apt autoremove -y
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt-key del F987672F | sudo apt update
sudo dpkg --add-architecture i386
sudo apt update
# echo "deb http://19.depo.pardus.org.tr/backports/ ondokuz-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/pardus-backports.list
# echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/debian-backports.list
# echo "deb http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs.list
# echo "deb-src http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs-source.list
# wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key
echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" | sudo tee /etc/apt/sources.list.d/winehq.list
# sudo apt-get -t ondokuz-backports update -y
# sudo apt-get -t buster-backports update -y
sudo apt update
sudo apt -y install gnupg2 software-properties-common
sudo apt update
# sudo apt-get -t ondokuz-backports install wine -y ; echo "y" | sudo apt install -f
# sudo apt-get -t ondokuz-backports install wine32 -y ; echo "y" | sudo apt install -f
# sudo apt-get -t buster-backports install wine wine32 libwine fonts-wine -y ; echo "y" | sudo apt install -f
# sudo apt install wine wine32 libwine fonts-wine -y
sudo apt install --install-recommends winehq-devel -y
# sudo apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
sudo apt update
sudo dpkg-reconfigure wine-devel-amd64 wine-devel wine-devel-i386
# sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt update -y
# sudo apt dist-upgrade
sudo apt autoremove -y
sudo apt autoclean -y

# KOD SONU


    printf "

『!』Kurulum Bitti...

"

sleep 3
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 5 ]]; then
    printf "
『!』Wine Development (Geliştirici) FORCE YÖNTEMİ ile Kurulumu Başlıyor...

"


# KOD BAŞI

sudo apt --purge remove wine* -y
sudo apt autoremove -y
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt-key del F987672F | sudo apt update
sudo dpkg --add-architecture i386
sudo apt update
echo "deb http://19.depo.pardus.org.tr/backports/ ondokuz-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/pardus-backports.list
# echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/debian-backports.list
echo "deb http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs.list
echo "deb-src http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs-source.list
# wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key
echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" | sudo tee /etc/apt/sources.list.d/winehq.list
sudo apt-get -t ondokuz-backports update -y
# sudo apt-get -t buster-backports update -y
sudo apt update
sudo apt -y install gnupg2 software-properties-common
sudo apt update
# sudo apt-get -t ondokuz-backports install wine -y ; echo "y" | sudo apt install -f
sudo apt-get -t ondokuz-backports install wine32 -y ; echo "y" | sudo apt install -f
# sudo apt-get -t buster-backports install wine wine32 libwine fonts-wine -y ; echo "y" | sudo apt install -f
# sudo apt install wine wine32 libwine fonts-wine -y
sudo apt install --install-recommends winehq-devel -y
sudo apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
sudo apt update
sudo dpkg-reconfigure wine-devel-amd64 wine-devel wine-devel-i386
# sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt update -y
# sudo apt dist-upgrade
sudo apt autoremove -y
sudo apt autoclean -y

# KOD SONU


    printf "

『!』Kurulum Bitti...

"

sleep 3
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 6 ]]; then
    printf "
『!』Wine Staging (Geliştirme) Kurulumu Başlıyor...

"

# KOD BAŞI

sudo apt --purge remove wine* -y
sudo apt autoremove -y
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt-key del F987672F | sudo apt update
sudo dpkg --add-architecture i386
sudo apt update
# echo "deb http://19.depo.pardus.org.tr/backports/ ondokuz-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/pardus-backports.list
# echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/debian-backports.list
# echo "deb http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs.list
# echo "deb-src http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs-source.list
# wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key
echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" | sudo tee /etc/apt/sources.list.d/winehq.list
# sudo apt-get -t ondokuz-backports update -y
# sudo apt-get -t buster-backports update -y
sudo apt update
sudo apt -y install gnupg2 software-properties-common
sudo apt update
# sudo apt-get -t ondokuz-backports install wine -y ; echo "y" | sudo apt install -f
# sudo apt-get -t ondokuz-backports install wine32 -y ; echo "y" | sudo apt install -f
# sudo apt-get -t buster-backports install wine wine32 libwine fonts-wine -y ; echo "y" | sudo apt install -f
# sudo apt install wine wine32 libwine fonts-wine -y
sudo apt install --install-recommends winehq-staging -y
# sudo apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
sudo apt update
sudo dpkg-reconfigure wine-staging-amd64 wine-staging wine-staging-i386
# sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt update -y
# sudo apt dist-upgrade
sudo apt autoremove -y
sudo apt autoclean -y

# KOD SONU


    printf "

『!』Kurulum Bitti...

"

sleep 3
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 7 ]]; then
    printf "
『!』Wine Staging (Geliştirme) FORCE YÖNTEMİ ile Kurulumu Başlıyor...

"

# KOD BAŞI

sudo apt --purge remove wine* -y
sudo apt autoremove -y
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt-key del F987672F | sudo apt update
sudo dpkg --add-architecture i386
sudo apt update
echo "deb http://19.depo.pardus.org.tr/backports/ ondokuz-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/pardus-backports.list
# echo "deb http://deb.debian.org/debian/ buster-backports main contrib non-free" | sudo tee /etc/apt/sources.list.d/debian-backports.list
echo "deb http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs.list
echo "deb-src http://19.depo.pardus.org.tr/pardus/ ondokuz main contrib non-free" | sudo tee /etc/apt/sources.list.d/winehq-libs-source.list
# wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key && sudo apt-key add winehq.key
echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" | sudo tee /etc/apt/sources.list.d/winehq.list
sudo apt-get -t ondokuz-backports update -y
# sudo apt-get -t buster-backports update -y
sudo apt update
sudo apt -y install gnupg2 software-properties-common
sudo apt update
# sudo apt-get -t ondokuz-backports install wine -y ; echo "y" | sudo apt install -f
sudo apt-get -t ondokuz-backports install wine32 -y ; echo "y" | sudo apt install -f
# sudo apt-get -t buster-backports install wine wine32 libwine fonts-wine -y ; echo "y" | sudo apt install -f
# sudo apt install wine wine32 libwine fonts-wine -y
sudo apt install --install-recommends winehq-staging -y
sudo apt --purge remove wine32:i386 libwine libwine:i386 fonts-wine -y
sudo apt update
sudo dpkg-reconfigure wine-staging-amd64 wine-staging wine-staging-i386
# sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo rm /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt update -y
# sudo apt dist-upgrade
sudo apt autoremove -y
sudo apt autoclean -y

# KOD SONU


    printf "

『!』Kurulum Bitti...

"

sleep 3
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 8 ]]; then
printf "
『!』Wine Versiyon Bilgisi Al

"
 
sudo wine --version
echo 
sleep 4
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 9 ]]; then
printf "
『!』Wine Ayarları ve Konfigurasyonunu Yap (winecfg)

"
 
sudo winecfg
echo 
sleep 4
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 10 ]]; then
printf "
『!』Test Programı Açılıyor...

"
sleep 1
printf "
『!』Test Programı Başlatılamadı
『!』Lütfen Manüel Olarak Çalıştırın 
『!』test > bin > Debug > test.exe
『!』wine test.exe
『!』wine /home/etapadmin/İndirilenler/test.exe

"
sleep 5 
bash Wine-Kur-BoomBookTR.sh

elif [[ $secim == 11 ]]; then
printf "\e[31m
『!』Wine Kaldırılsın mı ? [E|H]

"
read -e -p $'▶ ' kaldir
if [[ $kaldir == E || $kaldir == e ]]; then
printf "\e[32m
『!』Wine Kaldırılıyor...

"
sleep 2
sudo rm -rf /etc/apt/sources.list.d/pardus-backports.list | sudo rm /etc/apt/sources.list.d/debian-backports.list | sudo rm /etc/apt/sources.list.d/winehq.list | sudo rm /etc/apt/sources.list.d/winehq-libs.list | sudo rm /etc/apt/sources.list.d/winehq-libs-source.list | rm winehq.key
sudo apt-key del F987672F | sudo apt update
# sudo apt purge wine* -y
sudo apt --purge remove wine* -y

sudo apt autoremove -y

printf "\e[32m
『!』Wine Kaldırıldı...

"
sleep 3

bash Wine-Kur-BoomBookTR.sh

elif [[ $kaldir == H || $kaldir == h ]]; then
printf "\e[32m
『!』Wine Kaldırma İşlemi İptal Edildi...

"
sleep 2

bash Wine-Kur-BoomBookTR.sh

fi

elif [[ $secim == 12 ]]; then
printf "\e[32m
╔═╦══╦═╦══╦╦╦══╗
║╬║╔╗║╬╠╗╗║║║══╣
║╔╣╠╣║╗╬╩╝║║╠══║
╚╝╚╝╚╩╩╩══╩═╩══╝
╔╗─╔╦══╦═╦╦═╗
║╚╦╝╠║║╣║║║╦╝
╚╗║╔╬║║╣║║║╩╗
─╚═╝╚══╩╩═╩═╝
╔╦╦╦╦═╦╦╦╗╔╦╦═╦═╗
║╔╣║║╬║║║║║║║║║║║
║╚╣║║╗╣║║╚╣║║║║║║
╚╩╩═╩╩╩═╩═╩═╩╩═╩╝
╔═════════════════════════
║ Planlama ve Düzenleme : \e[31mİsa AKYER\e[32m
╠═════════════════════════
║ 『a』 Ana Menü
╠═════════════════════════
║ 『Github』 \e[31m@BoomBookTR\e[32m
║ 
║ 『Bilgiler』
║  Bu program \e[31mİsa AKYER\e[32m
║  tarafından wine 
║  kurulumunu ve testlerini 
║  otomatik olarak yapmak 
║  için geliştirilmiş bir araçtır.
╠═════════════════════════
║ 『!』Ana Sayfaya 
║ 『!』Yönlendiriliyorsunuz...
╚═════════════════════════
"
sleep 7
bash Wine-Kur-BoomBookTR.sh
fi
