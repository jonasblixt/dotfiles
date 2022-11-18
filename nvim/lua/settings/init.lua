local set = vim.opt

set.encoding = 'utf-8'
set.clipboard = unnamedplus
set.expandtab = true

set.number = true
set.expandtab = true
set.wrapscan = true
set.hlsearch = true

set.incsearch=true
set.ignorecase=true
set.smartcase=true
set.tabstop=4
set.softtabstop=0
set.shiftwidth=4
set.expandtab=true
set.matchpairs=""
set.swapfile = false
set.hlsearch = false
set.backup = false
-- Do not wrap text if buffer with is smaller than terminal window or tmux pane
vim.wo.wrap = false 
-- Display trailing white spaces and end of line
set.listchars="eol:$,tab:>-,trail:~,extends:>,precedes:<"
set.list = true

-- Highlight column 80
-- set.colorcolumn=80
vim.cmd("set colorcolumn=80")

-- Key mappings
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ','
keymap('', '<Leader>.', "<esc>:tabnew<CR>", {})
keymap('', '<Leader>m', "<esc>:tabnext<CR>", {})
keymap('', '<Leader>n', "<esc>:tabprevious<CR>", {})
keymap('', '<Leader>s', "<esc>:w<CR>", {})
keymap('', '<Leader>t', "<esc>:NvimTreeToggle<CR>", {})
keymap('', '<Leader>f', "<esc>:Files<CR>", {})
keymap('', '<Leader>,', "<esc>:GFiles<CR>", {})

-- Stay in indent mode
keymap("v", "<", "<gv", {})
keymap("v", ">", ">gv", {})

-- Use 'kj' seqence escape insert and visual mode
keymap('i', 'kj', '<esc>', {noremap=true})
keymap('v', 'kj', '<esc>', {noremap=true})

-- Small helper functions
--
-- vim.cmd("function! Tabtospace() 1,$s/\t/    /g endfunction")
-- vim.cmd("function! Removetrailingws() %s/\s\+$//e endfunction")
