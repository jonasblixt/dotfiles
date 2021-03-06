set encoding=utf-8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=darkgrey

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1

set clipboard=unnamedplus

" basics
filetype plugin indent on
syntax on
colorscheme gruvbox
set number
set expandtab
set wrapscan
set hlsearch
" set termguicolors

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

" preferences
inoremap jk <ESC>
let mapleader = ","
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>s <esc>:w<CR>
map <Leader>. <esc>:tabnew<CR>


let g:gruvbox_contrast_dark = 'soft'
" let g:gruvbox_termcolors = 256
set background=dark

autocmd! bufwritepost ~/.vimrc source %

" Netrw configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

function! Tabtospace()
    1,$s/\t/    /g
endfunction

function! Removetrailingws()
%s/\s\+$//e
endfunction

map <Leader>t <esc>:call ToggleNetrw()<CR>

set complete=k**/*.[ch]
set bs=2
set hlsearch

" Show non-printable characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set list

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''
