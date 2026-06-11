#!/bin/bash

echo "🚀 Instalando dotfiles..."

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Starship
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/ghostty.config ~/.config/ghostty/config

echo "✅ Listo! Reiniciá la terminal."
