#!/bin/bash
echo "Arch Apps Minimal Installer"

# Güncelleme ve Derleme Araçları
# 'gcc make fakeroot' yerine 'base-devel' kullanmak zorundayız, 
# çünkü bazı AUR paketleri (patch, pkgconf vb.) buna ihtiyaç duyar.
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel

# Yay Kurulumu
# Uyarı: Eğer betik burada hata verir ve tekrar çalıştırırsan,
# 'yay' klasörünü elle silmen gerekir.
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd .. 

# Uygulamalar
# Google Antigravity (artık AUR'da var olduğu için çalışır)
yay -S --needed --noconfirm google-antigravity-bin min

# Pacman paketleri
sudo pacman -S --needed --noconfirm python keepassxc

echo "Bitti."
