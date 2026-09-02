# My Omarchy Dotfiles

My personal dotfiles for Omarchy.

I made this repository so I can quickly restore my setup after a fresh Omarchy installation. I'm also sharing it in case anyone wants to use the same setup or take parts of it for their own configuration.

## What's included

* Hyprland configuration
* Omarchy customization
* Fish shell configuration
* Neovim configuration
* Terminal configurations
* Rofi
* Waypaper
* Fastfetch
* btop
* tmux
* Lazygit
* Fcitx5
* Git configuration
* Some custom wallpapers and Omarchy files

Personal application data, browser profiles, caches, and other unnecessary files are not included.

## Installation

Clone the repository:

```bash
git clone https://github.com/AtikHD/My_Omarchy_DotFiles.git
```

Enter the directory:

```bash
cd My_Omarchy_DotFiles
```

You can first check what the installer will do:

```fish
./scripts/install.fish --dry-run
```

Then install:

```fish
./scripts/install.fish
```

The installer will ask for confirmation before making changes.

## Backup

If you already have configuration files, the installer creates a backup before replacing them.

The backup is stored at:

```text
~/.config-backup-before-omarchy-dotfiles
```

## Updating the dotfiles

If you make changes to your configuration and want to save them to the repository:

```fish
./scripts/backup.fish
```

Then:

```fish
git add -A
git commit -m "Update dotfiles"
git push
```

## Packages

`packages/pacman.txt` contains the packages from the official Arch repositories.

`packages/foreign.txt` contains packages installed from outside the official repositories.

Foreign packages are not automatically installed by the installer.

## Wallpapers

Some of my custom wallpapers are included.

The full Omarchy wallpaper collection is not included because it is too large and isn't necessary for restoring the configuration.

## Notes

These are my personal configurations, so you may want to look through them and make any changes needed for your own setup.

Omarchy and its configuration can change over time, so something may need to be adjusted after future updates.

Use anything here that you find useful.
