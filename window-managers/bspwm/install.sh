#!/bin/sh
set -eu

if [ -r /etc/os-release ]; then
  . /etc/os-release
elif [ -r /usr/lib/os-release ]; then
  . /usr/lib/os-release
fi

cd -- "$(dirname -- "$0")"
set -- bspwm sxhkd polybar rofi picom dunst feh arandr lxappearance

case " ${ID:-} ${ID_LIKE:-} " in
  *" debian "*|*" ubuntu "*)
    sudo apt-get update
    sudo apt-get install -y "$@" x11-xserver-utils
    ;;
  *" arch "*)
    sudo pacman -Syu --needed --noconfirm "$@" xorg-xsetroot
    ;;
  *)
    printf 'Unsupported Linux distribution: %s\n' "${PRETTY_NAME:-${ID:-unknown}}" >&2
    exit 1
    ;;
esac

printf 'Copy bspwm configuration files into %s? Existing files may be overwritten. [y/N] ' "$HOME"
if ! read -r answer; then
  answer=
fi
case "$answer" in
  [yY]|[yY][eE][sS]) ;;
  *) printf '%s\n' 'Skipped copying configuration files.'; exit 0 ;;
esac

mkdir -p "$HOME/.config"
cp -Rv .Xresources .fehbg .screenlayout "$HOME/"
cp -Rv .config/. "$HOME/.config/"
