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
use 'kyazdani42/nvim-web-devicons'
use {
    'lewis6991/gitsigns.nvim',
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
