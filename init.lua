local fn = vim.fn
local cmd = vim.cmd

-- Set mapleader to space
vim.g.mapleader = ' '

-- Set localleader to comma
vim.g.maplocalleader = ','

-- Sensible defaults
require('default')

-- Configuration to load after loading plugins
function _G.load_post_plugin_config()
    require('plugins')
    require('ui')
    require('kb')
    require('config')
end

-- If Packer is not installed, download it and all plugins and reload config
-- If Packer is installed, load configuration as usual
local packer_install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_install_path)) > 0
then
    -- Download Packer and add it
    cmd('!git clone https://github.com/wbthomason/packer.nvim '..packer_install_path)
    cmd('packadd packer.nvim')

    -- -- Load plugins
    require('plugins')
    package.loaded['plugins'] = nil

    -- Automatically sync packer and load the rest of the config
    cmd('PackerSync')
    require('utility').create_augroup({
        {'User', 'PackerComplete', '++once', 'call v:lua.load_post_plugin_config()'}
    }, 'load_post_plugin_config')
else
    _G.load_post_plugin_config()
end

vim.g.python_host_prog="/Users/tungbui/.asdf/shims/python"
vim.g.python3_host_prog="/Users/tungbui/.asdf/shims/python3"
vim.g.go_gopls_enabled = 0
vim.g.rustfmt_autosave=1
