#!/bin/bash
# Install dependencies, link dotfiles and make zsh the default shell.
#
# Usage: ./install.sh [--link-only] [--desktop]
#   --link-only  skip package installation, only link dotfiles
#   --desktop    also install the openbox desktop packages
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

LINK_ONLY=0
DESKTOP=0
for arg in "$@"; do
  case "$arg" in
    --link-only) LINK_ONLY=1 ;;
    --desktop) DESKTOP=1 ;;
    *) echo "Usage: $0 [--link-only] [--desktop]"; exit 2 ;;
  esac
done

PACKAGES=(
  zsh
  git
  curl
  tmux
  vim
  fzf
  ripgrep
  bat
  xclip
  imagemagick
  vlock
)

# obamenu is Debian only, other distros need an equivalent menu generator
DESKTOP_PACKAGES=(
  openbox
  hsetroot
)

if [ "$DESKTOP" -eq 1 ]; then
  PACKAGES+=("${DESKTOP_PACKAGES[@]}")
fi

if [ "$LINK_ONLY" -eq 0 ]; then
  if command -v apt-get > /dev/null; then
    [ "$DESKTOP" -eq 1 ] && PACKAGES+=(obamenu)
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
fi

# oh-my-zsh and vim plugins are git submodules
git -C "$DOTFILES" submodule update --init --recursive

# Symlink $1 to $2, moving any existing file or directory out of the way
link() {
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] && [ ! -L "$2" ]; then
    echo "Backing up $2 to $2.bak"
    mv "$2" "$2.bak"
  fi
  ln -f -s -n "$1" "$2"
}

link "$DOTFILES/gitconfig" ~/.gitconfig
link "$DOTFILES/tmux.conf" ~/.tmux.conf
link "$DOTFILES/zshrc" ~/.zshrc
link "$DOTFILES/vimrc" ~/.vimrc
link "$DOTFILES/vim" ~/.vim
link "$DOTFILES/kitty.conf" ~/.config/kitty/kitty.conf
link "$DOTFILES/alacritty.toml" ~/.config/alacritty/alacritty.toml
link "$DOTFILES/openbox" ~/.config/openbox

# alacritty.yml was replaced by alacritty.toml
if [ -L ~/.config/alacritty/alacritty.yml ]; then
  rm ~/.config/alacritty/alacritty.yml
fi

ZSH_PATH="$(command -v zsh)"
if [ "$(getent passwd "$USER" | cut -d: -f7)" != "$ZSH_PATH" ]; then
  echo "Changing default shell to $ZSH_PATH"
  chsh -s "$ZSH_PATH"
  echo "Log out and back in for the shell change to take effect."
fi
