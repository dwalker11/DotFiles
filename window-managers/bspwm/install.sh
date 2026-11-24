#!/bin/sh
set -euo pipefail

PACKAGE=(
  bspwm
  sxhkd
  polybar
  rofi
  picom
  dunst
  feh
  arandr
  lxappearance
  # betterlockscreen # Use yay to install
)

# Refresh and install required packages
sudo pacman -Syu --needed --noconfirm "${PACKAGE[@]}"

# Copy files to destination
cp --recursive --verbose "{.Xresources,.fehbg,.screenlayout}" "${HOME}"
cp --recursive --verbose ".config/*" "${HOME}/.config"
