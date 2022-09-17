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

-- Colorscheme Paper-theme
use 'NLKNguyen/papercolor-theme'
use 'tomasiser/vim-code-dark'
use 'preservim/vim-colors-pencil'
use 'sainnhe/sonokai'
use 'rebelot/kanagawa.nvim'
use 'catppuccin/nvim'
use 'cocopon/iceberg.vim'

-- some candy stuff
use 'feline-nvim/feline.nvim'
use 'kyazdani42/nvim-web-devicons'
use {
  'lewis6991/gitsigns.nvim',
}

