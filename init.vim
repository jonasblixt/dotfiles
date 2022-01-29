set encoding=utf-8
source ~/dotfiles/plug.vim

call plug#begin('~/.config/nvim/bundle')
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
call plug#end()

autocmd! bufwritepost ~/.config/nvim/init.vim source %
set clipboard^=unnamed,unnamedplus

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" basics
filetype plugin indent on
syntax on
set number
" set relativenumber
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
set matchpairs=""

let mapleader = ","
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>s <esc>:w<CR>
map <Leader>t <esc>:NERDTreeToggle<CR>
map <Leader>. <esc>:tabnew<CR>

syntax enable
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme gruvbox
set expandtab
set wrapscan
set hlsearch

