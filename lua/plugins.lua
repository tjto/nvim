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

-- Tabline
use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

-- Git
use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

-- Statusline
use 'famiu/feline.nvim'

-- Delimit characters automatically
use 'Raimondi/delimitMate'

-- buffer delete
use 'famiu/bufdelete.nvim'

-- Comments
use 'b3nj5m1n/kommentary'

use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
}


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



-- Which Key
use { 'folke/which-key.nvim' }

use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        vim.opt.list = true
        vim.opt.listchars:append("space:?")
        vim.opt.listchars:append("eol:?")
        require("indent_blankline").setup {
            show_end_of_line = true,
            space_char_blankline = " ",
        }
    end
}
