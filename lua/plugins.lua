local packer = require('packer')
local g = vim.g
local use = packer.use

packer.reset()
packer.init {
    git = {
        clone_timeout = -1
    }
}

-- Packer
use 'wbthomason/packer.nvim'

use 'wakatime/vim-wakatime'
use { 
    "iamcco/markdown-preview.nvim", 
    run = "cd app && npm install", 
    setup = function() 
        vim.g.mkdp_filetypes = { "markdown" } 
    end, 
    ft = { "markdown" }, 
}
-- eyecandy
use 'cocopon/iceberg.vim'
use { "catppuccin/nvim", as = "catppuccin" }
use 'kyazdani42/nvim-web-devicons'
use {
    'lewis6991/gitsigns.nvim',
}
use {
    'f-person/git-blame.nvim',
}

use {
    'romgrk/barbar.nvim', 
    requires = {'kyazdani42/nvim-web-devicons'},
}
use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'},
}

use {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opt = {}
}

use {
    "tomtom/tcomment_vim"
}

use {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup {}
    end
}

-- treesitter

use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
}
use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function() require('hlargs').setup() end
}

-- telescope
use "nvim-lua/plenary.nvim"
use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} },
}
use {
    'nvim-telescope/telescope-fzy-native.nvim',
    requires = { {'nvim-telescope/telescope.nvim'} },
}

-- which-key
use {
  "folke/which-key.nvim",
}

--- lsp
use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'
use { 
    'williamboman/mason.nvim',
}
use {
    'williamboman/mason-lspconfig.nvim',
    requires= { { 'williamboman/mason.nvim' } }
}

use {
    'hashivim/vim-terraform'
}

use 'fatih/vim-go'

-- use 'olexsmir/gopher.nvim'

use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
