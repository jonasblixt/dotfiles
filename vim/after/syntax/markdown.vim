" Table rendering on top of the stock markdown syntax.
"
" Pipes are concealed as box-drawing characters and the delimiter row as a
" solid rule, so with conceallevel >= 1 an aligned table renders as
"
"   │ Name │ Value │
"   ├──────┼───────┤
"   │ foo  │ 1     │
"
" Every concealed character is replaced by exactly one character, so column
" alignment is kept. For the same reason the inline markup inside cells is
" highlighted without concealing its markers (hidden ** would shift columns).

" Rows are lines starting with a pipe. A row followed by a delimiter row is the
" header. Later definitions win, so header and delimiter come after the row.
syn match mdTableRow /^\s*|.*$/ contains=mdTablePipe,@mdTableInline
syn match mdTableHeader /^\s*|.*\ze\n\s*|[-:| \t]*-[-:| \t]*$/ contains=mdTablePipe,@mdTableInline
syn match mdTableDelimRow /^\s*|[-:| \t]*-[-:| \t]*$/ contains=mdTableDelimDash,mdTableDelimSpace,mdTableDelimInner,mdTableDelimLeft,mdTableDelimRight

syn match mdTablePipe /\\\@<!|/ contained conceal cchar=│

syn match mdTableDelimDash /-/ contained conceal cchar=─
syn match mdTableDelimSpace /\%(^\s*\)\@<!\s\ze.*|/ contained conceal cchar=─
syn match mdTableDelimInner /|/ contained conceal cchar=┼
syn match mdTableDelimLeft /^\s*\zs|/ contained conceal cchar=├
syn match mdTableDelimRight /|\ze\s*$/ contained conceal cchar=┤

syn cluster mdTableInline contains=mdTableCode,mdTableBold,mdTableItalic,mdTableEscape
syn match mdTableCode /`[^`|]\+`/ contained
syn match mdTableBold /\*\*[^*|]\+\*\*\|__[^_|]\+__/ contained
syn match mdTableItalic /\*\@<!\*[^*| ][^*|]*\*\*\@!/ contained
syn match mdTableEscape /\\|/ contained

hi def mdTableHeader term=bold cterm=bold gui=bold
hi def link mdTableDelimRow Comment
hi def link mdTableCode markdownCode
hi def link mdTableBold markdownBold
hi def link mdTableItalic markdownItalic
hi def link mdTableEscape Special
