" Reading-friendly settings for markdown buffers.

" Soft-wrap prose at word boundaries, keeping list continuation lines indented
setlocal wrap linebreak breakindent breakindentopt=list:-1
" The global eol/trailing-space markers and the 80 column ruler are noise here
setlocal nolist colorcolumn=
" Render emphasis, links and table borders; the cursor line shows the source
setlocal conceallevel=2 concealcursor=

" ,a aligns the table under the cursor, ,A every table in the buffer
command! -buffer -bar MdTableAlign call mdtable#Align()
command! -buffer -bar MdTableAlignAll call mdtable#AlignAll()
nnoremap <buffer> <silent> <Leader>a :MdTableAlign<CR>
nnoremap <buffer> <silent> <Leader>A :MdTableAlignAll<CR>
" ,w toggles wrapping, for tables wider than the window
nnoremap <buffer> <silent> <Leader>w :setlocal wrap!<CR>

let b:undo_ftplugin = get(b:, 'undo_ftplugin', '') .
      \ '|setl wrap< lbr< bri< briopt< list< cc< cole< cocu<' .
      \ '|delc MdTableAlign|delc MdTableAlignAll' .
      \ '|sil! nunmap <buffer> <Leader>a|sil! nunmap <buffer> <Leader>A' .
      \ '|sil! nunmap <buffer> <Leader>w'
