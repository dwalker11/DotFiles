# Sway on Wayland

A Sway configuration with a bundled wallpaper, ten numbered workspaces, Wofi as
the application launcher, and Waybar for workspaces, the clock, and system status.
The default terminal is Alacritty.

## Copy install

Run this from the repository root:

```sh
sh window-managers/sway/install.sh
```

The installer installs Sway, swaybg, swayidle, swaylock, Waybar, Wofi, Alacritty,
and pavucontrol. It uses APT on Debian, Ubuntu, and their derivatives, or Pacman
on Arch and its derivatives. It then asks whether to copy the Sway and Waybar
configuration into `~/.config`. Existing files may be overwritten; back them up
first. Press Enter to skip copying. Packages are installed before this prompt.

Install Hack Nerd Font and Font Awesome for the Waybar text and icons, then run
`fc-cache -f` after adding fonts.

## Install with Stow

Install the packages listed above, the fonts, and GNU Stow. Back up existing
configuration at `~/.config/sway` and `~/.config/waybar`, then run this from the
repository root:

```sh
stow -d window-managers --no-folding -t "$HOME" --ignore='(^|/)(install\.sh|README(\.md)?)$' sway
```

Stow links the configuration files and wallpaper into `~/.config/sway` and
`~/.config/waybar`, skipping the installer and README.

## Customize

| File | Settings |
| --- | --- |
| [`config`](.config/sway/config) | Terminal, launcher, monitor layout, wallpaper, gaps, and idle locking |
| [`0-bindings`](.config/sway/config.d/0-bindings) | Keyboard shortcuts and resize mode |
| [`Waybar config`](.config/waybar/config) | Modules, clock timezone, batteries, and audio controls |
| [`style.css`](.config/waybar/style.css) | Bar fonts, colors, and spacing |

The monitor variables and output positions describe a specific multi-monitor
setup. Run `swaymsg -t get_outputs` from a Sway session and adjust them for your
displays. Review the lid-switch bindings and the **Super+O** shortcut, which
toggles `eDP-1`.

The wallpaper uses the bundled `~/.config/sway/sway_bg.png`. The lock command
expects `~/Pictures/lock_screen.jpg`; add that image or change `$lock` in the Sway
config. Swayidle locks after five minutes, turns displays off after ten minutes,
and locks before sleep.

Waybar's clock uses `America/New_York`. Adjust its timezone and remove or update
the `battery#bat2` module if your machine has no `BAT2` battery. Clicking the
audio module opens pavucontrol.

## Keybindings

The modifier key is **Super**.

| Shortcut | Action |
| --- | --- |
| Super+Enter | Open Alacritty |
| Super+D | Open Wofi |
| Super+Shift+Q | Close the focused window |
| Super+H/J/K/L or arrow keys | Move focus |
| Super+Shift+H/J/K/L or arrow keys | Move the focused window |
| Super+1–9 / Super+0 | Switch to workspace 1–9 / 10 |
| Super+Shift+1–9 / Super+Shift+0 | Move the focused window to a workspace |
| Super+B / Super+V | Split horizontally / vertically |
| Super+F | Toggle fullscreen |
| Super+Shift+Space | Toggle floating |
| Super+R | Enter resize mode; Enter or Escape exits |
| Super+Shift+C | Reload the configuration |
| Super+Shift+E | Show the exit confirmation |

## Start Sway

Select **Sway** in your display manager, or run `sway` from a Linux virtual
console. After customizing the files, run `sway --validate` to check the
configuration. If Sway is already running, press **Super+Shift+C** to reload it.
