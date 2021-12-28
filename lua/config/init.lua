require('config.wk')
require('config.project')
require('config.kommentary')
require('config.treesitter')
require('config.git')
require('config.barbar')
require('config.complete')
require('config.lsp')
require('config.nvim-tree')
require('config.indent')

require('trim').setup({
    -- if you want to ignore markdown file.
    -- you can specify filetypes.
    disable = {"markdown", "python", "yaml"},

})
