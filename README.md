# dotfiles

My configuration for Arch Linux, managed by [chezmoi](https://www.chezmoi.io/).

## Brief description

-   **Display server:** Wayland
-   **Window compositor:** Hyprland
-   **Theme:** Catppuccin
-   **Fonts:** Fira Code, Roboto Mono

## Installation

At the moment, this repository is not recommended for usage.

It is not yet templated and contains some user-specific data (e.g. git config).

For now, it is advisable to copy only certain configs and edit them for your use case.

## Apps

Currently configured:

-   [bat](https://github.com/sharkdp/bat)
-   [delta](https://github.com/dandavison/delta)
-   [dunst](https://github.com/dunst-project/dunst)
-   [electron](https://github.com/electron/electron) (Wayland flag)
-   [fastfetch](https://github.com/fastfetch-cli/fastfetch)
-   [git](https://github.com/git/git)
-   [gtk](https://github.com/GNOME/gtk) (3 & 4)
-   [gnupg](https://github.com/gpg/gnupg)
-   [hyprwm](https://github.com/hyprwm)
    -   [hyprland](https://github.com/hyprwm/Hyprland)
    -   [hyprlock](https://github.com/hyprwm/hyprlock/)
    -   [hypridle](https://github.com/hyprwm/hypridle)
    -   [grimblast](https://github.com/hyprwm/contrib/tree/main/grimblast)
-   [kitty](https://github.com/kovidgoyal/kitty)
-   [Kvantum](https://github.com/tsujan/Kvantum)
-   [lf](https://github.com/gokcehan/lf)
-   [vscode](https://github.com/microsoft/vscode) (only Wayland flag)
-   [qt](https://github.com/qt) (5 & 6)
-   [Waybar](https://github.com/Alexays/Waybar)
-   [wofi](https://sr.ht/~scoopta/wofi/)
-   [zsh](https://www.zsh.org/)

This does not mean "fully configured": everything is subject to change.

## Theme and fonts

I use [Catppuccin](https://github.com/catppuccin/catppuccin) as a main theme.

Currently used in:

-   bat
-   delta
-   dunst
-   hyprwm apps
-   kitty
-   qtk
-   qt
-   waybar
-   wofi

Terminal font is [Fira Code](https://github.com/tonsky/FiraCode), interface font is [Roboto Mono](https://github.com/googlefonts/RobotoMono) (both from [Nerd Fonts](https://www.nerdfonts.com/)). Size: 16px (12pt).

## Scripts

-   [packages](root/dot_scripts/packages/README.md) (tested, but not on a new machine)
