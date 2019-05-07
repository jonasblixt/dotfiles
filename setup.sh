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

## Install deoplete
#cp -R ~/dotfiles/deoplete.nvim/autoload ~/.vim
#cp -R ~/dotfiles/deoplete.nvim/plugin ~/.vim
#cp -R ~/dotfiles/deoplete.nvim/doc ~/.vim
#cp -R ~/dotfiles/vim-hug-neovim-rpc/autoload ~/.vim

# Install clang_complete
#cp -R ~/dotfiles/clang_complete/bin ~/.vim/
#cp -R ~/dotfiles/clang_complete/doc ~/.vim/
#cp -R ~/dotfiles/clang_complete/plugin ~/.vim/

# Vim theme
cp -R ~/dotfiles/gruvbox ~/.vim/pack/default/start/
