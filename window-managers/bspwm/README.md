bspwm on X11
============

Install
-------

- Install bspwm, sxhkd, polybar, rofi, picom, dunst, feh, and alacritty.
  Alacritty is the terminal launched by the default sxhkd binding.
- Install Hack Nerd Font for Polybar and run `fc-cache -f` after adding it.
- From the repository root, run `stow -d window-managers -t "$HOME" bspwm` to link the
  configuration. If you previously installed this package, use
  `stow -d window-managers -R -t "$HOME" bspwm` to refresh the links after the Polybar rename.
- Put your wallpaper at `~/Pictures/wallpaper.png` or edit `~/.fehbg`.
- Start bspwm with `startx` using the supplied `~/.xinitrc`, or select
  bspwm in your display manager. The startup script loads X resources and
  starts sxhkd, Picom, Dunst, Polybar, and the wallpaper.

For a copy-based setup, run `sh window-managers/bspwm/install.sh` from the
repository root. The script installs packages with APT on Debian, Ubuntu,
and their derivatives, or Pacman on Arch and its derivatives, then asks
whether to copy the configuration files. Press Enter to skip copying.

Displays and Polybar
--------------------

Run `xrandr --listmonitors` from the X session to find its output names.
The desktop assignment in `~/.config/bspwm/bspwmrc` targets `DP-2`.
Set that name to your actual output to assign desktops I through VI.
On the current workstation, X reports the output as `DisplayPort-1`.

`~/.screenlayout/default.sh` is an older two-monitor preset. It places
`DP-1-1` (2560x2880) on the left and the primary `HDMI-1` (2560x1440)
on the right. Its invocation is commented out in bspwmrc. If you want a
fixed layout, adapt it to your connected outputs first. ARandR can help
generate a new xrandr script.

Polybar's launcher loads `~/.config/polybar/config.ini`. Polybar selects
an active display automatically. To choose a specific output, run
`MONITOR=DisplayPort-1 ~/.config/polybar/launch.sh` from the X session,
substituting an output listed by `polybar --list-monitors`.

The network modules in `~/.config/polybar/modules.ini` use `wlan0` and
`eno3`. If your interface names differ, check `ip -br link` and update
the Wi-Fi and Ethernet settings.

Window opacity
--------------

Picom sets unfocused windows to 95% opacity and window frames to 100% in
`~/.config/picom/picom.conf`. Applications can also draw translucent
backgrounds in both focus states. For an opaque Alacritty background,
set `opacity = 1.0` under `[window]` in the Alacritty config you use,
typically `~/.config/alacritty/alacritty.toml`.

Theme sources
-------------

- https://github.com/catppuccin/polybar
- https://github.com/catppuccin/rofi
