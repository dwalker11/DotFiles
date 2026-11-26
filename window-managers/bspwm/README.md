bspwm on X11
============

Install
-------

- Install bspwm, sxhkd, polybar, rofi, picom, dunst, feh, and alacritty.
  Alacritty is the terminal launched by the default sxhkd binding.
- Install `xorg-xsetroot` on Arch or `x11-xserver-utils` on Debian/Ubuntu
  so bspwmrc can set the cursor on the empty desktop.
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

Screen locking
--------------

Install [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen#installation)
and its dependencies, including i3lock-color. From your X session, prepare
the cached lock-screen images with:

```sh
betterlockscreen --update "$HOME/Pictures/wallpaper.png"
```

Run `~/.local/bin/lock` or choose Lock in the Rofi power menu (`super + p`).
The script uses betterlockscreen's blurred background and the supplied
`~/.config/betterlockscreenrc`. Run the update command again after changing
your wallpaper or display layout. Both Stow and the copy installer install
the lock script; rerun your installation command to pick it up.

Displays and Polybar
--------------------

Run `xrandr --listmonitors` from the X session to find its output names.
At startup, `~/.config/bspwm/bspwmrc` assigns desktops I through VI to
the focused monitor.

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
