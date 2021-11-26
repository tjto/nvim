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

-- Which Key
use { 'folke/which-key.nvim' }

use {
	"SmiteshP/nvim-gps",
	requires = "nvim-treesitter/nvim-treesitter"
}

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
