local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    "folke/tokyonight.nvim", -- theme
    "nvim-lualine/lualine.nvim",  -- status bar
    "nvim-tree/nvim-tree.lua",  -- document tree
    "nvim-tree/nvim-web-devicons", -- icons for document tree
    "christoomey/vim-tmux-navigator", -- navigate window through <leader>hjkl
    "nvim-treesitter/nvim-treesitter", -- grammar highlight 
    "p00f/nvim-ts-rainbow", -- with treesitter, rainbow colors for brackets
    "hrsh7th/nvim-cmp", -- auto completetion
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets engine for auto completetion
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path", -- file path
    "numToStr/Comment.nvim", -- gcc & gc comment
    "windwp/nvim-autopairs",
    "akinsho/bufferline.nvim",
    "lewis6991/gitsigns.nvim",
    'norcalli/nvim-colorizer.lua', -- color highlight
    'yamatsum/nvim-cursorline',
    'h-hg/fcitx.nvim', -- better input method
    -- 'sefeng211/jk.vim',

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- as a bridge between mason.nvim and lspconfig
        "neovim/nvim-lspconfig"
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5', -- file search
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    {
        'goolord/alpha-nvim', -- dashboard
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

}


local opts = {}
require("lazy").setup(plugins, opts)
