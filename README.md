# dotfiles

My configuration for Arch Linux, managed by [chezmoi](https://www.chezmoi.io/).

![index](./showcase/index.png)

## Table of Contents

<!--toc:start-->

- [Description](#description)
  - [Display](#display)
  - [Visuals](#visuals)
- [Installation](#installation)
- [Configurations](#configurations)
  - [bat](#bat)
  - [btop](#btop)
  - [cava](#cava)
  - [delta](#delta)
  - [dunst](#dunst)
  - [fastfetch](#fastfetch)
  - [fd](#fd)
  - [fzf](#fzf)
  - [Git](#git)
  - [Helix](#helix)
  - [hyprwm](#hyprwm)
  - [Kanata](#kanata)
  - [kitty](#kitty)
  - [Kvantum](#kvantum)
  - [lazydocker](#lazydocker)
  - [lazygit](#lazygit)
  - [lf](#lf)
  - [mpd](#mpd)
  - [Nushell](#nushell)
  - [nvim](#nvim)
  - [Oh My Posh](#oh-my-posh)
  - [pacman](#pacman)
  - [GnuPG](#gnupg)
  - [rmpc](#rmpc)
  - [Waybar](#waybar)
  - [Wofi](#wofi)
  - [xdg-desktop](#xdg-desktop)
  - [yazi](#yazi)
  - [zsh](#zsh)
  - [spotity-launcher](#spotity-launcher)
  - [Electron](#electron)
  - [VS Code](#vs-code)
- [Scripts](#scripts)
- [Contributing](#contributing)
- [License](#license)

<!--toc:end-->

## Description

Every configuration is designed specifically for me and always could change.

At the moment, this repository is not recommended for usage as a drop-in config.
It needs tinkering and manual setup for many aspects of the system. Also, it's
not yet templated and contains some user-specific data (e.g. git).

### Display

The configuration assumes and uses Wayland with Hyprland window compositor.

### Visuals

[Showcase](./showcase.md)

Where possible, the configuration uses

- Catppuccin Mocha as the theme,
- Fira Code font as the code font (nerd variant),
- Roboto Mono as the UI font.

Links:

- [Catppuccin](https://github.com/catppuccin/catppuccin)
- [Fira Code](https://github.com/tonsky/FiraCode)
- [Roboto Mono](https://github.com/googlefonts/RobotoMono)
- [Nerd Fonts](https://www.nerdfonts.com/)

## Installation

For now, it is advisable to copy only certain configs and edit them for your use
case. Clone the repository with

```sh
git clone https://github.com/shimeoki/dotfiles.git
```

and grab the configurations you need and apply them manually.

If you want to apply configurations with chezmoi, you can do:

```sh
chezmoi init shimeoki
chezmoi apply
```

Last command will apply _all_ configurations at once. As it's not recommended,
you can use

```sh
chezmoi apply <path>
```

to apply configurations in needed directories. In both cases you are prompted to
confirm the override of the files, if present. To confirm single files, press
`o` and to confirm all - `a`. Be careful and backup your configurations.

After that, some [scripts](#scripts) (for example, `packages`) could be ran.

## Configurations

The configurations for applications I don't use are not going to be updated. You
can call them "archived". But this state is not permanent if I start using the
app again.

Archived state doesn't mean that these configurations are invalid, but you
should be aware that they could be outdated.

The repository uses chezmoi and separate root directory, so, for example, all
paths with `root/private_dot_config` are translated to `~/.config`.

### bat

- Project: https://github.com/sharkdp/bat
- Path: root/private_dot_config/bat
- Archived: no

Configuration is a Catppuccin Mocha theme. This theme is used by other
applications, and this command needs to be executed after the first install:

```sh
bat cache --build
```

### btop

- Project: https://github.com/aristocratos/btop
- Path: root/private_dot_config/btop
- Archived: no

### cava

- Project: https://github.com/karlstav/cava
- Path: root/private_dot_config/cava
- Archived: no

### delta

- Project: https://github.com/dandavison/delta
- Path: root/private_dot_config/delta
- Archived: no

### dunst

- Project: https://github.com/dunst-project/dunst
- Path: root/private_dot_config/dunst
- Archived: no

### fastfetch

- Project: https://github.com/fastfetch-cli/fastfetch
- Path: root/private_dot_config/fastfetch
- Archived: no

### fd

- Project: https://github.com/sharkdp/fd
- Path: root/private_dot_config/fd
- Archived: no

### fzf

- Project: https://github.com/junegunn/fzf
- Path: root/private_dot_config/fzf
- Archived: no

Also applications can use `fzf-preview.bash` in `root/dot_scripts` directory.
It's recommended to check comments in the script in case of issues.

### Git

- Project: https://git-scm.com
- Path: root/private_dot_config/git
- Archived: no

### Helix

- Project: https://helix-editor.com
- Path: root/private_dot_config/helix
- Archived: **yes**

This editor is not used by me anymore (though it's pretty good and I like it),
so the configuration could be outdated.

### hyprwm

- Project: https://github.com/hyprwm
- Path: root/private_dot_config/hypr
- Archived: **yes**

Many projects of the hypr ecosystem are configured:

- Hyprland,
- hyprlock,
- hypridle,
- hyprcursor
- and grimblast.

Their configurations could be found in path specified above, as well as the
project links in the organization.

### Kanata

- Project: https://github.com/jtroo/kanata
- Path: root/private_dot_config/kanata
- Archived: no

### kitty

- Project: https://github.com/kovidgoyal/kitty
- Path: root/private_dot_config/kitty
- Archived: no

This configuration is tied to Neovim configuration. Check `scrollback.conf`.

### Kvantum

- Project: https://github.com/tsujan/Kvantum
- Path: root/private_dot_config/Kvantum
- Archived: no

### lazydocker

- Project: https://github.com/jesseduffield/lazydocker
- Path: root/private_dot_config/lazydocker
- Archived: no

Right now I don't use this application often, so this configuration is mostly a
copy of UI settings in lazygit config.

### lazygit

- Project: https://github.com/jesseduffield/lazygit
- Path: root/private_dot_config/lazygit
- Archived: no

### lf

- Project: https://github.com/gokcehan/lf
- Path: root/private_dot_config/lf
- Archived: **yes**

This terminal file manager is not used by me anymore (though it's good), so the
configuration could be outdated.

### mpd

- Project: https://www.musicpd.org/
- Path: root/private_dot_config/mpd
- Archived: no

Uses `~/Music` as a music directory path. Also, it requires many directories for
the state, playlists, etc., so parent directories should be made beforehand.

### Nushell

- Project: https://www.nushell.sh
- Path: root/private_dot_config/nushell
- Archived: no

### nvim

- Project: https://neovim.io
- Path: root/private_dot_config/nvim
- Archived: no

Check the [README](/root/private_dot_config/nvim/README.md).

### Oh My Posh

- Project: https://ohmyposh.dev
- Path: root/private_dot_config/oh-my-posh
- Archived: **yes**

Although I sometimes use zsh, the configuration probably won't be updated.

### pacman

- Project: https://pacman.archlinux.page
- Path: root/private_dot_config/pacman
- Archived: no

The configurations contains only some of the rules. Many changes are made in
`/etc` directory on the system, but I can't include this here.

Maybe other configuration will be in the repository in the format of a script.

### GnuPG

- Project: https://gnupg.org
- Path: root/private_dot_config/private_gnupg
- Archived: no

### rmpc

- Project: https://mierak.github.io/rmpc/
- Path: root/private_dot_config/rmpc
- Archived: no

Listens for mpd on the default port on localhost. Uses cava.

Config is made specifically for this setup:

- Forced Kitty Graphics Protocol usage
- In vertical split on 1920x1080 there is exactly one line for the queue
- Lyrics directory is the same as music directory in mpd
- mpd should be configured to output fifo file for cava

### Waybar

- Project: https://github.com/Alexays/Waybar
- Path: root/private_dot_config/waybar
- Archived: **yes**

The configuration contains cava module. It's bugged at the moment (screenshots
and toggling the bar are breaking the application), so you can choose to use it
or not: to use, you need to install a specific version of Waybar with cava
support. In AUR it's `waybar-cava` package.

Also, last configuration is done for Hyprland, because I stopped using Waybar
before switching to niri.

### Wofi

- Project: https://sr.ht/~scoopta/wofi
- Path: root/private_dot_config/wofi
- Archived: **yes**

### xdg-desktop

- Project: https://github.com/flatpak/xdg-desktop-portal
- Path: root/private_dot_config/xdg-desktop-portal
- Archived: **yes**

### yazi

- Project: https://yazi-rs.github.io
- Path: root/private_dot_config/yazi
- Archived: no

### zsh

- Project: https://www.zsh.org/
- Paths:
  - root/private_dot_config/dot_zshrc
  - root/private_dot_config/zsh
- Archived: no

Although I mainly use nushell, zsh is still updated.

### spotity-launcher

- Project: https://github.com/kpcyrd/spotify-launcher
- Path: root/private_dot_config/spotify-launcher.conf
- Archived: **yes**

Wayland flags.

### Electron

- Project: https://github.com/electron/electron
- Path: root/private_dot_config/electron-flags.conf
- Archived: **yes**

Wayland flags.

### VS Code

- Project: https://github.com/microsoft/vscode
- Path: root/private_dot_config/code-flags.conf
- Archived: **yes**

Wayland flags.

## Scripts

This directory is appended to 'path' environment variable. It contains scripts
or just executables that should be available to applications or the user
directly.

- [packages](root/dot_scripts/packages/README.md)

## Contributing

Although this is my personal configuration, it's great to share your setups and
workflows to other people, so contributions, bug reports and questions are
welcomed.

## License

This repository contains code from other people. If it's possible, I specify a
source link. All rights go to the respective authors, and check their license
(if present) before usage.

If the source is not specified, then it's either my own code or I couldn't
specify a source. Example of the latter situation is all Catppuccin theme files
in the repository.

My own code is licensed under the license in repository root. This license
doesn't "override" other licenses in situations described above.
