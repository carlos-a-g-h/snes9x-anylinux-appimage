#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION="v$(pacman -Q snes9x-gtk | awk '{print $2; exit}')"

# Unique Build ID, it can be a date in YYYYMMDD, a git commit, etc...
UBID="$1"
UBID_SHORT="${UBID:0:8}"

NAME="Snes9x"
APPIMAGE_STEM="$NAME"_"$VERSION"_"$UBID_SHORT"_anylinux_"$ARCH"

export ARCH VERSION
export OUTPATH=./dist
#export ADD_HOOKS="self-updater.bg.hook"
#export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON="/usr/share/icons/hicolor/scalable/apps/snes9x.svg"
export OUTNAME="$APPIMAGE_STEM".AppImage
export DESKTOP="snes9x-gtk.desktop"

export DEPLOY_OPENGL=1
export DEPLOY_GEGL=0
export DEPLOY_PULSE=1
export DEPLOY_PIPEWIRE=1
export DEPLOY_VULKAN=1
export DEPLOY_GTK=1
export DEPLOY_SDL=1
export DEPLOY_GLYCIN=0

# Deploy dependencies
quick-sharun /usr/bin/snes9x /usr/bin/snes9x-gtk /usr/lib/libalsatoss.so

# Additional changes can be done in between here

# Copy the config
mkdir -p AppDir/_config
cp -va _config/* AppDir/_config/

# Copy details
mkdir -v AppDir/_details
echo "$UBID" > AppDir/_details/commit.txt
echo "$(date)" > AppDir/_details/date.txt
pacman -Q > AppDir/_details/packages.txt

# Copy Internal scripts
mkdir -vp AppDir/bin

cp -v is_details AppDir/bin/details
cp -v is_setup.1.sh AppDir/bin/setup
cat is_setup.2.sh >> AppDir/bin/setup

chmod +x AppDir/bin/details
chmod +x AppDir/bin/setup

# Turn AppDir into AppImage
./quick-sharun.sh --make-appimage
