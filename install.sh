#!/bin/bash

echo "🚀 Instalando dotfiles..."

OS="$(uname)"

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Starship
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Dependencias según OS
if [ "$OS" = "Linux" ]; then
  sudo apt install -y zsh-autosuggestions zsh-syntax-highlighting zoxide
  echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
  echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi

# Symlinks
ln -sf ~/dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/ghostty.config ~/.config/ghostty/config

echo "✅ Listo! Reiniciá la terminal."
