#!/bin/sh
set -euo pipefail

PACKAGE=(
  awesome
  feh
)

# Refresh and install required packages
sudo pacman -Syu --needed --noconfirm "${PACKAGE[@]}"

# Copy files to destination
cp --recursive --verbose ".config/awesome" "${HOME}/.config"
