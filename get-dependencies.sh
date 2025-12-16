#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Downloading scripts..."
echo "----------------------"

URL_DPKGS="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/get-debloated-pkgs.sh"
URL_SHARUN="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/quick-sharun.sh"

FILENAME=$(basename "${URL_DPKGS:7}")
wget "$URL_DPKGS" -O "$FILENAME"
chmod +x "$FILENAME"

FILENAME=$(basename "${URL_SHARUN:7}")
wget "$URL_SHARUN" -O "$FILENAME"
chmod +x "$FILENAME"

echo "Installing package dependencies..."
echo "----------------------------------"
pacman -Sy --noconfirm zsync zstd patchelf base-devel xorg-server-xvfb \
sdl2 \
portaudio pulseaudio pipewire pipewire-alsa jack2 alsa-oss

echo "Installing debloated packages..."
echo "--------------------------------"
bash get-debloated-pkgs --add-common --prefer-nano mesa-mini gtk3-mini gdk-pixbuf2-mini librsvg-mini libxml2-mini

echo "Installing the main packages..."
echo "-------------------------------"
pacman -Sy --noconfirm snes9x-gtk snes9x

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
