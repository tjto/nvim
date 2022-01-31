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

-- tpope plugins
use 'tpope/vim-fugitive'
use 'tpope/vim-surround'
use 'tpope/vim-repeat'
use 'tpope/vim-unimpaired'
use 'tpope/vim-endwise'
use 'tpope/vim-eunuch'

-- Tabline
use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

-- Git
use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

-- Delimit characters automatically
use 'Raimondi/delimitMate'

-- buffer delete
use 'famiu/bufdelete.nvim'

-- Comments
use 'b3nj5m1n/kommentary'

-- Tresitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use 'nvim-treesitter/nvim-treesitter-textobjects'

-- Better quickfix window
use 'kevinhwang91/nvim-bqf'

-- Project management
use 'ahmedkhalf/project.nvim'

-- Telescope
use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
}

use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-- Colorscheme Paper-theme
use 'NLKNguyen/papercolor-theme'
use 'tomasiser/vim-code-dark'
use 'preservim/vim-colors-pencil'
use 'sainnhe/sonokai'
use 'rebelot/kanagawa.nvim'
use 'catppuccin/nvim'
use 'cocopon/iceberg.vim'

-- Which Key
use { 'folke/which-key.nvim' }

-- use {
-- 	'SmiteshP/nvim-gps',
-- 	requires = 'nvim-treesitter/nvim-treesitter'
-- }

use {
  'yamatsum/nvim-nonicons',
  requires = {'kyazdani42/nvim-web-devicons'}
}

use {
    'ojroques/nvim-hardline',
    config = function()
        require('hardline').setup {}
    end
}

-- LSP
use 'neovim/nvim-lspconfig' -- Configuration
use 'ray-x/lsp_signature.nvim' -- Signature Help
use 'kosayoda/nvim-lightbulb' -- Lightbulb on Code Action
use 'simrat39/symbols-outline.nvim' -- Symbols list
use 'onsails/lspkind-nvim' -- LSP Completion Item Icons

-- Completion and snippets
use 'L3MON4D3/LuaSnip'
use {
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-calc',
        'saadparwaiz1/cmp_luasnip',
    }
}

use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
}

use { 'williamboman/nvim-lsp-installer'}

use {'wakatime/vim-wakatime'}

use {'lukas-reineke/indent-blankline.nvim', requires = {'Yggdroot/indentLine'}}

use { 'cappyzawa/trim.nvim' }

use { 'rust-lang/rust'}

-- use { 'ellisonleao/glow.nvim',
--     config = function()
--         require('hardline').setup {}
--     end
-- }
--
use 'sbdchd/neoformat'

use 'fatih/vim-go'
