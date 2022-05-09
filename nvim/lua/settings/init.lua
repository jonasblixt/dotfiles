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
-- set.nohlsearch=true
set.tabstop=4
set.softtabstop=0
set.shiftwidth=4
set.expandtab=true
-- set.nobackup=true
-- set.noswapfile=true
-- set.nowrap=true
set.matchpairs=""

-- Key mappings
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = ','
keymap('', '<Leader>.', "<esc>:tabnew<CR>", {})
keymap('', '<Leader>m', "<esc>:tabnext<CR>", {})
keymap('', '<Leader>n', "<esc>:tabprevious<CR>", {})
keymap('', '<Leader>s', "<esc>:w<CR>", {})

-- Stay in indent mode
keymap("v", "<", "<gv", {})
keymap("v", ">", ">gv", {})

-- Use 'kj' seqence escape insert mode
keymap('i', 'kj', '<esc>', {noremap=true})



