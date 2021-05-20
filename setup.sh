#!/bin/sh

ln -f -s ~/dotfiles/tmux.conf  ~/.tmux.conf
ln -f -s ~/dotfiles/zshrc  ~/.zshrc
ln -f -s ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/i3
ln -f -s ~/dotfiles/i3.conf ~/.config/i3/config
mkdir -p ~/.config/kitty
ln -f -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
mkdir -p ~/.config/alacritty
ln -f -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -f -s ~/dotfiles/openbox ~/.config/openbox
ln -f -s ~/dotfiles/tint2 ~/.config/tint2
# Configure VIM

rm -rf ~/.vim
mkdir -p ~/.vim

cp -R ~/dotfiles/vim-airline/autoload ~/.vim
cp -R ~/dotfiles/vim-airline/plugin ~/.vim
cp -R ~/dotfiles/vim-airline/doc ~/.vim
cp -R ~/dotfiles/vim-tmux-clipboard/plugin ~/.vim
cp -R ~/dotfiles/vim-tmux-focus-events/plugin ~/.vim
cp -R ~/dotfiles/vim-tmux-focus-events/autoload ~/.vim
mkdir -p ~/.vim/pack/default/start/

# Vim theme
cp -R ~/dotfiles/gruvbox ~/.vim/pack/default/start/
