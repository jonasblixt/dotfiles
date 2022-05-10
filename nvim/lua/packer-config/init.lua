return require'packer'.startup(function()
        use 'wbthomason/packer.nvim'
        use 'morhetz/gruvbox'
        use 'neovim/nvim-lspconfig'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'
        use 'L3MON4D3/LuaSnip'
        use 'nvim-lualine/lualine.nvim'
        use 'roxma/vim-tmux-clipboard'
        use 'kyazdani42/nvim-web-devicons'
        use 'kyazdani42/nvim-tree.lua'
end)
