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

-- Colorscheme Paper-theme
use 'cocopon/iceberg.vim'

-- some candy stuff
use 'kyazdani42/nvim-web-devicons'
use {
    'lewis6991/gitsigns.nvim',
}

-- treesitter

use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
}
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod     = 'expr'
        vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    end
})
use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function() require('hlargs').setup() end
}

---ENDWORKAROUND

-- telescope
use "nvim-lua/plenary.nvim"
use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
}

use {
    'nvim-telescope/telescope-fzy-native.nvim',
    requires = { {'nvim-telescope/telescope.nvim'} },
    config = function()
        require('telescope').setup {
            extensions = {
                fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                }
            }
        }
        require('telescope').load_extension('fzy_native')
    end
}
