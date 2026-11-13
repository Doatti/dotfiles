#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles from $DOTFILES_DIR..."

# Shell config
ln -sf "$DOTFILES_DIR/shell/.bashrc" ~/.bashrc

# Git config
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig

# SSH config
ln -sf "$DOTFILES_DIR/ssh/config" ~/.ssh/config
chmod 600 ~/.ssh/config

# VSCode settings
mkdir -p ~/.config/Code/User
ln -sf "$DOTFILES_DIR/vscode/settings.json" ~/.config/Code/User/settings.json

# Install VSCode extensions
if command -v code &> /dev/null; then
    echo "Installing VSCode extensions..."
    if [ -f "$DOTFILES_DIR/vscode/extensions.txt" ]; then
        while IFS= read -r ext; do
            [ -n "$ext" ] && code --install-extension "$ext"
        done < "$DOTFILES_DIR/vscode/extensions.txt"
    fi
else
    echo "⚠️  VSCode not found. Install extensions manually with: cat vscode/extensions.txt | xargs -L 1 code --install-extension"
fi

echo "✅ Dotfiles installed!"
