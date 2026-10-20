#!/bin/bash
# Install dependencies, link dotfiles and make zsh the default shell.
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

PACKAGES=(
  zsh
  git
  curl
  tmux
  vim
  neovim
  fzf
  ripgrep
  bat
  xclip
  imagemagick
  vlock
)

if command -v apt-get > /dev/null; then
  sudo apt-get update
  sudo apt-get install -y "${PACKAGES[@]}"
elif command -v dnf > /dev/null; then
  sudo dnf install -y "${PACKAGES[@]/imagemagick/ImageMagick}"
elif command -v pacman > /dev/null; then
  sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
else
  echo "No supported package manager found, install manually: ${PACKAGES[*]}"
  exit 1
fi

# oh-my-zsh and vim plugins are git submodules
git -C "$DOTFILES" submodule update --init --recursive

# Link dotfiles
ln -f -s "$DOTFILES/gitconfig" ~/.gitconfig
ln -f -s "$DOTFILES/tmux.conf" ~/.tmux.conf
ln -f -s "$DOTFILES/zshrc" ~/.zshrc
ln -f -s "$DOTFILES/vimrc" ~/.vimrc
mkdir -p ~/.config/kitty
ln -f -s "$DOTFILES/kitty.conf" ~/.config/kitty/kitty.conf
mkdir -p ~/.config/alacritty
ln -f -s "$DOTFILES/alacritty.yml" ~/.config/alacritty/alacritty.yml
rm -rf ~/.config/openbox
ln -f -s "$DOTFILES/openbox" ~/.config/openbox
rm -rf ~/.vim
ln -f -s "$DOTFILES/vim" ~/.vim

ZSH_PATH="$(command -v zsh)"
if [ "$(getent passwd "$USER" | cut -d: -f7)" != "$ZSH_PATH" ]; then
  echo "Changing default shell to $ZSH_PATH"
  chsh -s "$ZSH_PATH"
  echo "Log out and back in for the shell change to take effect."
fi
