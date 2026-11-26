#!/bin/sh
set -eu

if [ -r /etc/os-release ]; then
  . /etc/os-release
elif [ -r /usr/lib/os-release ]; then
  . /usr/lib/os-release
fi

cd -- "$(dirname -- "$0")"
set -- sway swaybg swayidle swaylock waybar wofi alacritty pavucontrol

case " ${ID:-} ${ID_LIKE:-} " in
  *" debian "*|*" ubuntu "*)
    sudo apt-get update
    sudo apt-get install -y "$@"
    ;;
  *" arch "*)
    sudo pacman -Syu --needed --noconfirm "$@"
    ;;
  *)
    printf 'Unsupported Linux distribution: %s\n' "${PRETTY_NAME:-${ID:-unknown}}" >&2
    exit 1
    ;;
esac

printf 'Copy Sway and Waybar configuration files into %s? Existing files may be overwritten. [y/N] ' "$HOME"
if ! read -r answer; then
  answer=
fi
case "$answer" in
  [yY]|[yY][eE][sS]) ;;
  *) printf '%s\n' 'Skipped copying configuration files.'; exit 0 ;;
esac

mkdir -p "$HOME/.config"
cp -Rv .config/sway .config/waybar "$HOME/.config/"
