local fn = vim.fn
local cmd = vim.cmd

-- Set mapleader to space
vim.g.mapleader = ' '

-- Set localleader to comma
vim.g.maplocalleader = ','

-- Sensible defaults
require('default')

vim.g.python_host_prog="~/.asdf/shims/python"
vim.g.python3_host_prog="~/.asdf/shims/python3"
vim.g.go_gopls_enabled = 0
vim.g.rustfmt_autosave=1

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

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight-day]]
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "dstein64/vim-startuptime",
        -- lazy-load on a command
        cmd = "StartupTime",
        -- init is called during startup. Configuration for vim plugins typically should be set in an init function
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
})



require('kb')

