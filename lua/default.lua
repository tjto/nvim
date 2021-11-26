local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
local bind = vim.api.nvim_set_keymap
local utils = require('utility')

vim.o.completeopt = "menuone,noinsert,noselect"

-- Set encoding
opt.encoding = 'utf-8'

-- Default grep command
-- Prefer ripgrep and ag over grep
if vim.fn.executable('rg') == 1 then
    opt.grepprg = 'rg --vimgrep --smart-case'
elseif vim.fn.executable('ag') == 1 then
    opt.grepprg = 'ag --nogroup --nocolor'
else
    opt.grepprg = 'grep -nH'
end

-- Wildmenu
opt.wildmode = {'longest', 'list', 'full'}
opt.wildmenu = true

-- Hidden buffers to switch buffers without saving
opt.hidden = true

-- Enable mouse support
opt.mouse = 'a'

-- Project specific vimrc with secure
opt.exrc = true
opt.secure = true

-- GUI cursor
opt.guicursor = {
    'n-v-c:block',
    'i-ci-ve:ver25',
    'r-cr:hor20',
    'o:hor50',
    'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor',
    'sm:block-blinkwait175-blinkoff150-blinkon175'
}

-- Persistent undo
opt.undofile = true

-- Auto read file changes
opt.autoread = true

-- Backspace
opt.backspace = {'indent', 'eol', 'start'}

-- Make last window always have a status line
opt.laststatus = 2

-- Indent
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Listchars
opt.listchars = {tab = '> ', trail = '-', extends = '>', precedes = '<', nbsp = '+'}

-- Linebreak and wrap behavior
opt.linebreak = true
opt.breakindent = true

-- Fill column
opt.textwidth = 100
opt.colorcolumn = '+1'

-- Make Terminal use GUI colors
opt.termguicolors = true

-- Line numbers
opt.number = true
opt.relativenumber = false

-- Folding (with Treesitter)
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true

-- Incremental command
opt.inccommand = 'nosplit'

-- Completion
opt.completeopt = {'menuone', 'preview', 'noselect'}
opt.shortmess:append('c')

-- Split options
opt.splitbelow = true
opt.splitright = true

-- Faster update time
opt.updatetime = 100
opt.signcolumn = 'auto:4'

-- Highlight current line
opt.cursorline = true

-- Scroll offsets
opt.scrolloff = 10
opt.sidescrolloff = 5

-- Clipboard
opt.clipboard = {'unnamed', 'unnamedplus'}

-- Disable using netrw for 'gx' and set it manually
g.netrw_nogx = 1
bind('n', 'gx', '<cmd>!xdg-open <cfile><CR>', { noremap = true })

-- Use LaTeX as default tex flavor
g.tex_flavor = "latex"

-- Enable filetype plugin
cmd 'filetype plugin on'

-- Enable filetype indent
cmd 'filetype indent on'

-- Highlight text on yank
utils.create_augroup({
    {'TextYankPost', '*', 'silent!', 'lua vim.highlight.on_yank()'}
}, 'highlight_on_yank')

-- Enable syntax highlighting
cmd 'syntax enable'

utils.create_augroup({
    { 'BufReadPost', '*', 'lua require("utility").RestoreCursor()' }
}, 'RestoreCursorOnOpen')


utils.create_augroup({
    { 'BufWritePre', '*', 'lua require("utility").create_file_directory_structure()' }
}, 'MkdirOnSave')

utils.create_augroup({
    {'FileType', 'go', 'setlocal', 'ts=8 sts=8 sw=8 noexpandtab indentkeys-=0# indentkeys-=<:>'}
}, 'yaml-file-type')