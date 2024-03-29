set encoding=utf-8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=darkgrey

set clipboard=unnamedplus

" basics
filetype plugin indent on
syntax on

set background=dark
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
inoremap kj <ESC>
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
map <Leader>, <esc>:Buffers<CR>
map <Leader>t <esc>:Tags<CR>
map <Leader>l <esc>:GFiles --recurse-submodules<CR>


let g:gruvbox_contrast_dark = 'soft'
" let g:gruvbox_termcolors = 256
set background=dark

autocmd! bufwritepost ~/.vimrc source %

" Netrw configuration
let g:netrw_liststyle = 5
let g:netrw_banner = 0

" Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1

function! Tabtospace()
    1,$s/\t/    /g
endfunction

function! Removetrailingws()
%s/\s\+$//e
endfunction

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

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" This was needed to disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" vim-tmux clipboard (from https://github.com/roxma/vim-tmux-clipboard)
func! s:TmuxBufferName()
    let l:list = systemlist('tmux list-buffers -F"#{buffer_name}"')
    if len(l:list)==0
        return ""
    else
        return l:list[0]
    endif
endfunc

func! s:TmuxBuffer()
    return system('tmux show-buffer')
endfunc

func! s:Enable()

    if $TMUX==''
        " not in tmux session
        return
    endif

    let s:lastbname=""

    " if support TextYankPost
    if exists('##TextYankPost')==1
        " @"
        augroup vimtmuxclipboard
            autocmd!
            autocmd FocusLost * call s:update_from_tmux()
            autocmd	FocusGained   * call s:update_from_tmux()
            autocmd TextYankPost * silent! call system('tmux loadb -',join(v:event["regcontents"],"\n"))
        augroup END
        let @" = s:TmuxBuffer()
    else
        " vim doesn't support TextYankPost event
        " This is a workaround for vim
        augroup vimtmuxclipboard
            autocmd!
            autocmd FocusLost     *  silent! call system('tmux loadb -',@")
            autocmd	FocusGained   *  let @" = s:TmuxBuffer()
        augroup END
        let @" = s:TmuxBuffer()
    endif

endfunc

func! s:update_from_tmux()
    let buffer_name = s:TmuxBufferName()
    if s:lastbname != buffer_name
        let @" = s:TmuxBuffer()
    endif
    let s:lastbname=s:TmuxBufferName()
endfunc

call s:Enable()

set exrc
set secure
