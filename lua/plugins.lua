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

use 'feline-nvim/feline.nvim'
use {
    'romgrk/barbar.nvim', 
    requires = {'kyazdani42/nvim-web-devicons'},
}
use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'},
}

use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() 
        require("indent_blankline").setup {
            show_current_context = true,
            show_current_context_start = true,
            show_end_of_line = true,
            space_char_blankline = " ",
        }
    end
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
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
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

use 'fatih/vim-go'
