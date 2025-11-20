#!/bin/bash
echo "Arch Apps + XFCE4 & Plasma Installer"

# Güncelleme ve Derleme Araçları
# 'gcc make fakeroot' yerine 'base-devel' kullanmak zorundayız, 
# çünkü bazı AUR paketleri (patch, pkgconf vb.) buna ihtiyaç duyar.
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel

# Yay Kurulumu
# Uyarı: Eğer betik burada hata verir ve tekrar çalıştırırsan,
# 'yay' klasörünü elle silmen gerekir.
if [ ! -d "yay" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
else
    echo "'yay' klasörü zaten var, atlanıyor..."
fi

# --- MASAÜSTÜ ORTAMLARI KURULUMU ---

# 1. XFCE4 Kurulumu
# xfce4-goodies: Ekstra eklentiler ve araçlar içerir (tavsiye edilir).
echo "XFCE4 Masaüstü Ortamı kuruluyor..."
sudo pacman -S --needed --noconfirm xfce4 xfce4-goodies

# 2. KDE Plasma Kurulumu
# plasma-meta: Tüm standart Plasma paketlerini içerir.
# konsole: KDE terminali (gerekli olabilir).
# dolphin: KDE dosya yöneticisi.
echo "KDE Plasma Masaüstü Ortamı kuruluyor..."
sudo pacman -S --needed --noconfirm plasma-meta konsole dolphin ark spectacle

# 3. Giriş Yöneticisi (Display Manager)
# İki masaüstü arasında seçim yapabilmek için SDDM kuruyoruz.
echo "SDDM (Giriş Yöneticisi) kuruluyor..."
sudo pacman -S --needed --noconfirm sddm

# SDDM servisini etkinleştir (Bilgisayar açılınca otomatik başlasın)
# Eğer başka bir DM (GDM, LightDM) varsa hata verebilir, bu temiz kurulum içindir.
sudo systemctl enable sddm

# --- UYGULAMALAR ---

# Google Antigravity (AUR) ve Min Browser
yay -S --needed --noconfirm google-antigravity-bin min

# Diğer Pacman paketleri
# firefox: Yedek tarayıcı olarak eklemek her zaman iyidir.
sudo pacman -S --needed --noconfirm python keepassxc firefox

echo "Kurulum Bitti! Bilgisayarını yeniden başlattığında giriş ekranında XFCE veya Plasma seçebilirsin."
