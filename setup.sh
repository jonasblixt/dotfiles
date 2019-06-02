#!/bin/sh

ln -f -s ~/dotfiles/tmux.conf  ~/.tmux.conf
ln -f -s ~/dotfiles/zshrc  ~/.zshrc
ln -f -s ~/dotfiles/vimrc ~/.vimrc
ln -f -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
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
