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

require("lazy").setup("plugins")

require('kb')
