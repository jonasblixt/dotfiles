#!/bin/sh

ln ~/.tmux.conf -s ~/dotfiles/tmux.conf  2> /dev/null
ln ~/.vimrc -s ~/dotfiles/vimrc  2> /dev/null

# Configure VIM

rm -rf ~/.vim
mkdir -p ~/.vim

cp -R ~/dotfiles/vim-airline/autoload ~/.vim
cp -R ~/dotfiles/vim-airline/plugin ~/.vim
cp -R ~/dotfiles/vim-airline/doc ~/.vim
mkdir -p ~/.vim/pack/default/start/

cp -R ~/dotfiles/gruvbox ~/.vim/pack/default/start/
