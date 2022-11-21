#!/bin/bash
set -e

ln -f -s ~/dotfiles/gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/tmux.conf  ~/.tmux.conf
ln -f -s ~/dotfiles/zshrc  ~/.zshrc
ln -f -s ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/kitty
ln -f -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
mkdir -p ~/.config/alacritty
ln -f -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -f -s ~/dotfiles/openbox ~/.config/openbox
# Configure VIM

rm -rf ~/.vim
ln -f -s ~/dotfiles/vim ~/.vim
