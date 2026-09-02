#!/usr/bin/env fish

set -l REPO (realpath (dirname (dirname (status filename))))
set -l DRY_RUN false
set -l BACKUP_DIR "$HOME/.config-backup-before-omarchy-dotfiles"

if contains -- --dry-run $argv
    set DRY_RUN true
end

echo "======================================"
echo " My Omarchy DotFiles Installer"
echo "======================================"
echo ""
echo "Repository: $REPO"
echo ""

if test "$DRY_RUN" = true
    echo "DRY RUN — nothing will be changed."
    echo ""
end

if not test -d "$REPO/.config"
    echo "ERROR: .config directory not found."
    exit 1
end

set -l configs btop fastfetch fcitx5 fish foot ghostty git gtk-3.0 hypr kitty lazygit nvim nautilus omarchy rofi tmux waypaper

echo "Configuration files:"
for config in $configs
    if test -d "$REPO/.config/$config"
        echo "  ✓ $config"
    end
end

for file in mimeapps.list starship.toml
    if test -f "$REPO/.config/$file"
        echo "  ✓ $file"
    end
end

if test "$DRY_RUN" = true
    echo ""
    echo "Dry run complete."
    exit 0
end

echo ""
read -P "Continue with installation? [y/N] " answer

if not string match -qi "y*" "$answer"
    echo "Cancelled."
    exit 0
end

echo ""
echo "Installing official packages..."
if test -f "$REPO/packages/pacman.txt"
    sudo pacman -S --needed - < "$REPO/packages/pacman.txt"
end

echo ""
echo "Installing configuration files..."
mkdir -p "$BACKUP_DIR"
mkdir -p "$HOME/.config"

for config in $configs
    if test -d "$REPO/.config/$config"
        if test -e "$HOME/.config/$config"
            rm -rf "$BACKUP_DIR/$config"
            cp -r "$HOME/.config/$config" "$BACKUP_DIR/"
        end
        rm -rf "$HOME/.config/$config"
        cp -r "$REPO/.config/$config" "$HOME/.config/"
        echo "  ✓ $config"
    end
end

for file in mimeapps.list starship.toml
    if test -f "$REPO/.config/$file"
        if test -e "$HOME/.config/$file"
            cp "$HOME/.config/$file" "$BACKUP_DIR/$file"
        end
        cp "$REPO/.config/$file" "$HOME/.config/$file"
        echo "  ✓ $file"
    end
end

echo ""
echo "Installation complete!"
