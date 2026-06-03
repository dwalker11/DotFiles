# DotFiles

Configuration files used on my Linux-based workstation

## Instructions

Run `stow <package>` from the dotfiles directory to install into the home directory

- *This requires `dotfiles/` to be installed in the home directory*

You can also run `stow -t <directory> <package>` to specify the target directory

Run `stow -R <package>` to reinstall/update a package (if you add new files)

Run `stow -D <package>` to uninstall a package

## Packages

CLI

- bat
- btop
- cmatrix
- eza
- fd
- fzf
- lf
- ripgrep
- tree
- wget
- yazi
- zoxide

Conky

Dev

- git
- gh
- httpie
- lazygit

Editor

- neovim

Shell

- fastfetch
- fish
- starship
- tmux
- zsh

Terminal

- alacritty
- kitty
