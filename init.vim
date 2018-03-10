set encoding=utf8

source ~/dotfiles/plug.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Airline config
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let mapleader = ","
let g:mapleader = ","



" Key mappings
nnoremap <leader>s :exe ":w"<cr>
nnoremap <leader>n :exe ":tabNext"<cr>
nnoremap <leader>m :exe ":tabprevious"<cr>
nnoremap <leader>t :exe ":NERDTreeToggle"<cr>

" Common configuration
set ruler
set number

syntax on
set autoindent
set guioptions-=r
set guifont=Hack\ Nerd:h16
set background="dark"
set fillchars=vert:\ 
