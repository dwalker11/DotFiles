# Hyprland

This package contains the Hyprland setup from my workstation. Paths mirror their locations under the home directory.

| Path | Contents |
| --- | --- |
| `.config/hypr/` | Hyprland Lua configuration, custom overrides, scripts, and Hypridle and Hyprlock configuration |
| `.config/quickshell/ii/` | Illogical Impulse desktop shell |
| `.config/illogical-impulse/config.json` | Illogical Impulse user settings |
| `.config/xdg-desktop-portal/hyprland-portals.conf` | Portal preferences for Hyprland |
| `.config/fuzzel/` | Fallback launcher configuration |
| `.config/matugen/` | Wallpaper-based color generation settings and templates |
| `Pictures/go.png` | Hyprlock background |

## Install

From the repository root, preview the GNU Stow changes with `stow -d window-managers -n -v -t "$HOME" hyprland`. Resolve any conflicts with existing files, then apply the changes with `stow -d window-managers -t "$HOME" hyprland`.

Edit `.config/hypr/custom/` for machine-specific Hyprland settings. If installing under a different username, update the background path in `.config/hypr/hyprlock/colors.conf`.

The Hyprlock configuration refers to `check-capslock.sh` and `status.sh` under `~/.config/hypr/hyprlock/`. Both scripts were absent from the original setup.
