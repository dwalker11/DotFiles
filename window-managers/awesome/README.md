# AwesomeWM

An AwesomeWM configuration for X11 with a One Dark palette, a bundled wallpaper, and nine numbered tags per screen. The bar includes a tag list, task list, system tray, clock, and layout switcher. With inspiration from https://github.com/anhsirk0/awesome-config.

## Customize

| File | Settings |
| --- | --- |
| [`rc.lua`](.config/awesome/rc.lua) | Terminal, editor, modifier key, and available layouts |
| [`bindings.lua`](.config/awesome/bindings.lua) | Keyboard and mouse bindings |
| [`bar.lua`](.config/awesome/bar.lua) | Tags, menus, and bar widgets |
| [`theme.lua`](.config/awesome/theme.lua) and [`colors.lua`](.config/awesome/themes/onedark/colors.lua) | Fonts, wallpaper, and colors |
| [`rules.lua`](.config/awesome/rules.lua) and [`titlebar.lua`](.config/awesome/titlebar.lua) | Window rules and title bars |
| [`autorun.sh`](.config/awesome/autorun.sh) | Startup commands, with commented examples for Picom and Feh |

## Keybindings

| Shortcut | Action |
| --- | --- |
| Super+S | Show keyboard shortcuts |
| Super+Enter | Open Alacritty |
| Super+R | Open the command prompt |
| Super+1–9 | Switch to a tag |
| Super+Shift+1–9 | Move the focused window to a tag |
| Super+J / Super+K | Focus the next or previous window |
| Super+Shift+C | Close the focused window |
| Super+Ctrl+R | Reload AwesomeWM |

## Copy install

The installer installs AwesomeWM and Feh, then asks whether to copy the configuration. Press Enter to skip copying. It uses APT on Debian, Ubuntu, and their derivatives, and Pacman on Arch and its derivatives. Run it from the repository root:

```sh
sh window-managers/awesome/install.sh
```

## Install with Stow

Install AwesomeWM and GNU Stow. The default terminal shortcut launches Alacritty. The theme uses Source Code Pro for the bar and Iosevka NF for notifications.

Back up any existing configuration at `~/.config/awesome`, then run this from the DotFiles repository root:

```sh
stow -d window-managers --no-folding -t "$HOME" --ignore='(^|/)(install\.sh|README(\.md)?)$' awesome
```

Stow links the configuration into `~/.config/awesome` and skips the installer and README files. The `--no-folding` flag makes Stow link individual files, so the nested theme README stays excluded even on a fresh install.

Check the configuration with `awesome -k`, then select **Awesome** at the X11 login screen. If AwesomeWM is already running, press **Super+Ctrl+R** to reload it.
