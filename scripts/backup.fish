#!/usr/bin/env fish

set -l REPO (realpath (dirname (dirname (status filename))))
echo "Backing up configuration..."

set -l configs btop fastfetch fcitx5 fish foot ghostty git gtk-3.0 hypr kitty lazygit nvim nautilus omarchy rofi tmux waypaper

for config in $configs
    if test -e "$HOME/.config/$config"
        rm -rf "$REPO/.config/$config"
        cp -r "$HOME/.config/$config" "$REPO/.config/"
        echo "  ✓ $config"
    end
end

for file in mimeapps.list starship.toml
    if test -e "$HOME/.config/$file"
        cp "$HOME/.config/$file" "$REPO/.config/$file"
        echo "  ✓ $file"
    end
end

rm -rf "$REPO/.config/omarchy/backgrounds"
rm -f "$REPO/.config/omarchy/shell.json"
rm -f "$REPO/.config/omarchy/shell.json.bak."*

pacman -Qqe > "$REPO/packages/pacman.txt"
pacman -Qqm > "$REPO/packages/foreign.txt"

echo ""
echo "Backup complete."
