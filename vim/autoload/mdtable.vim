" Align GitHub-flavoured markdown tables.
"
" mdtable#Align()     aligns the table under the cursor
" mdtable#AlignAll()  aligns every table in the buffer, skipping fenced code
"
" Cells are split on unescaped pipes (as GFM does, also inside code spans) and
" padded to the display width of the widest cell in the column, honouring the
" :--, :-: and --: alignment markers of the delimiter row.

let s:pipe = '\\\@<!|'
let s:delim = '^\s*|\=\s*:\=-\+:\=\s*\%(|\s*:\=-\+:\=\s*\)*|\=\s*$'
let s:fence = '^\s*\%(```\|\~\~\~\)'

function! s:IsRow(line) abort
  return a:line =~ s:pipe && a:line !~ '^\s*$'
endfunction

function! s:IsDelim(line) abort
  return a:line =~ s:delim && a:line =~ '|'
endfunction

function! s:Cells(line) abort
  let l:s = substitute(a:line, '^\s*|\=', '', '')
  let l:s = substitute(l:s, s:pipe . '\s*$', '', '')
  return map(split(l:s, s:pipe, 1), 'trim(v:val)')
endfunction

function! s:Pad(text, width, align) abort
  let l:gap = a:width - strdisplaywidth(a:text)
  if a:align ==# 'r'
    return repeat(' ', l:gap) . a:text
  elseif a:align ==# 'c'
    return repeat(' ', l:gap / 2) . a:text . repeat(' ', l:gap - l:gap / 2)
  endif
  return a:text . repeat(' ', l:gap)
endfunction

function! s:DelimCell(width, align) abort
  if a:align ==# 'c'
    return ':' . repeat('-', a:width - 2) . ':'
  elseif a:align ==# 'r'
    return repeat('-', a:width - 1) . ':'
  elseif a:align ==# 'l'
    return ':' . repeat('-', a:width - 1)
  endif
  return repeat('-', a:width)
endfunction

" Align lines first..last, where first is the header row and first + 1 the
" delimiter row.
function! s:AlignRange(first, last) abort
  let l:lines = getline(a:first, a:last)
  let l:indent = matchstr(l:lines[0], '^\s*')
  let l:rows = map(copy(l:lines), 's:Cells(v:val)')
  let l:ncols = max(map(copy(l:rows), 'len(v:val)'))

  let l:aligns = []
  for l:d in l:rows[1]
    call add(l:aligns, l:d =~ '^:.*:$' ? 'c' : l:d =~ ':$' ? 'r' : l:d =~ '^:' ? 'l' : '')
  endfor

  let l:widths = repeat([3], l:ncols)
  for l:i in range(len(l:rows))
    call extend(l:rows[l:i], repeat([''], l:ncols - len(l:rows[l:i])))
    if l:i != 1
      for l:c in range(l:ncols)
        let l:widths[l:c] = max([l:widths[l:c], strdisplaywidth(l:rows[l:i][l:c])])
      endfor
    endif
  endfor
  call extend(l:aligns, repeat([''], l:ncols - len(l:aligns)))

  let l:out = []
  for l:i in range(len(l:rows))
    let l:cells = []
    for l:c in range(l:ncols)
      if l:i == 1
        call add(l:cells, s:DelimCell(l:widths[l:c], l:aligns[l:c]))
      else
        call add(l:cells, s:Pad(l:rows[l:i][l:c], l:widths[l:c], l:aligns[l:c]))
      endif
    endfor
    call add(l:out, l:indent . '| ' . join(l:cells, ' | ') . ' |')
  endfor

  if l:out !=# l:lines
    call setline(a:first, l:out)
  endif
endfunction

function! s:InFence(lnum) abort
  let l:in = 0
  for l:line in getline(1, a:lnum)
    if l:line =~ s:fence
      let l:in = !l:in
    endif
  endfor
  return l:in
endfunction

function! mdtable#Align() abort
  let l:lnum = line('.')
  if !s:IsRow(getline(l:lnum)) || s:InFence(l:lnum)
    echo 'Not in a table'
    return
  endif

  let l:first = l:lnum
  while l:first > 1 && s:IsRow(getline(l:first - 1))
    let l:first -= 1
  endwhile
  let l:last = l:lnum
  while l:last < line('$') && s:IsRow(getline(l:last + 1))
    let l:last += 1
  endwhile

  " The header is the row right above the first delimiter row in the block
  let l:header = l:first
  while l:header < l:last && !s:IsDelim(getline(l:header + 1))
    let l:header += 1
  endwhile
  if l:header >= l:last
    echo 'Not in a table'
    return
  endif

  call s:AlignRange(l:header, l:last)
endfunction

function! mdtable#AlignAll() abort
  let l:view = winsaveview()
  let l:in_fence = 0
  let l:lnum = 1
  while l:lnum < line('$')
    let l:line = getline(l:lnum)
    if l:line =~ s:fence
      let l:in_fence = !l:in_fence
    elseif !l:in_fence && s:IsRow(l:line) && s:IsDelim(getline(l:lnum + 1))
      let l:last = l:lnum + 1
      while l:last < line('$') && s:IsRow(getline(l:last + 1))
        let l:last += 1
      endwhile
      call s:AlignRange(l:lnum, l:last)
      let l:lnum = l:last
    endif
    let l:lnum += 1
  endwhile
  call winrestview(l:view)
endfunction
