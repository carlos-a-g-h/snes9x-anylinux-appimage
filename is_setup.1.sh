#!/bin/bash

# NOTE: THIS IS AN INTERNAL SCRIPT AND IT CAN ONLY RUN INSIDE THE APPIMAGE AS
# A COMMAND LINE ARGUMENT

set -eu

MAIN_BIN="/usr/bin/snes9x-gtk"

CONFIG_FILE="snes9x.conf"
CONFIG_DIR="$HOME""/.config/snes9x"

DESKTOP="snes9x-gtk.desktop"
DESKTOP_EXEC=$(basename "$MAIN_BIN")
PATH_ICON="/usr/share/icons/snes9x.svg"
declare -a LBINARIES=(
	"/usr/bin/snes9x"
	"$MAIN_BIN"
)

