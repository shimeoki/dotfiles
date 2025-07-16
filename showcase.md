# Showcase

The wallpaper used in all following images is from
[The NOexistenceN of you AND me](https://store.steampowered.com/app/2873080/The_NOexistenceN_of_you_AND_me/).

Right now only images are present. Because of that, crucial parts (such as
animations in Hyprland config) are missing.

## Hyprland

Hyprland config is very simple. Right now I don't even use a taskbar (Waybar).
Nevertheless, there are some images as the reference for gaps, terminal
transparency, overall look and feel.

![hyprland-01-no-bar](./showcase/hyprland/01-no-bar.png)

On the screenshot above fastfetch is opened on the left, and Neovim on the right
with the screenshot's Hyprland configuration.

![hyprland-02-waybar](./showcase/hyprland/02-waybar.png)

In comparison to the previous screenshot, this has Waybar enabled.

![hyprland-03-blur+group+floating](./showcase/hyprland/03-blur+group+floating.png)

The configuration changed: this has blur enabled. Also, bar for grouped windows
and a floating windows are present.

![hyprland-04-hyprexpo](./showcase/hyprland/04-hyprexpo.png)

With Waybar disabled, hyprexpo plugin is my main method of navigation between
workspaces to see them visually. 1st has two terminals open with btop and
fastfetch, 5th has one terminal in a fullscreen mode with yazi opened (and yazi
itself is previewing a fullscreened image), and 9th has Neovim open.

## Neovim

![nvim-01-start](./showcase/nvim/01-start.png)

My configuration doesn't have a fancy greeter plugin, and furthermore, disables
default Neovim greeter, so you have this view at the start. At the bottom
lualine can be seen. '?' refers to a new buffer, when a file wasn't written to a
disk yet.

![nvim-02-telescope-horizontal](./showcase/nvim/02-telescope-horizontal.png)

Telescope is the main tool for navigation in a pair with yazi plugin. Right now
it looks like this. Also, the syntax highlighting in preview is broken (probably
because of the new treesitter, and I need to change something).

![nvim-03-telescope-vertical](./showcase/nvim/03-telescope-vertical.png)

When the width of the window is not sufficient, Telescope has alternative
layout. I tuned this value to trigger at split terminal in half.

![nvim-04-split](./showcase/nvim/04-split.png)

Buffers split horizontally look like this. Inactive buffers have different
lualine styling. Also, inlay hints are present.

![nvim-05-completion-transparent](./showcase/nvim/05-completion-transparent.png)

Completions look like this.

![nvim-06-completion-opaque](./showcase/nvim/06-completion-opaque.png)

The popup color is not very contrast, so maybe you want to fullscreen the
terminal or disable transparency.

![nvim-07-symbol-info](./showcase/nvim/07-symbol-info.png)

There is a symbol info popup in a buffer with inlay hints disabled.

![nvim-08-cmdline](./showcase/nvim/08-cmdline.png)

Command line is not the default, and not the Noice plugin default, to match
other popups. Also, completions are present. Preselect is not enabled, so input
is untouched before Ctrl+j or Ctrl+k.

![nvim-09-lazy-profile](./showcase/nvim/09-lazy-profile.png)

Startup time was less before treesitter and lspconfig updates (because almost
every plugin is lazy-loaded), but even now on a SSD with no encryption on Ryzen
5 5600G startup averages 25-26ms.

## Shell

Right now, I mainly use Nushell, but Zsh is also still supported. Below are some
differences and just visuals for the shells.

![shell-01-git-prompt](./showcase/shell/01-git-prompt.png)

Git prompts are very simple. Nushell one is self-made and only shows current
branch, while Zsh shows branch status as well (are there new files in the index
or not), powered by Oh My Posh.

![shell-02-fzf-file-vertical](./showcase/shell/02-fzf-file-vertical.png)

Zsh uses built-in fzf integration, while Nushell uses custom binds. My custom
bind doesn't include directories while opening something with fzf, so output is
different. Nushell has custom vertical layout (like Telescope in Neovim).

![shell-03-fzf-dir-horizontal](./showcase/shell/03-fzf-dir-horizontal.png)

And one more example with different split and mode for changing CWD.
