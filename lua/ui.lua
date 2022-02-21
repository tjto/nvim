-- Set background color
vim.opt.background = 'dark'

-- Set colorscheme
-- vim.cmd('colorscheme PaperColor')
-- vim.cmd('colorscheme codedark')
-- vim.cmd('colorscheme pencil')

-- vim.g.sonokai_style='espresso'
-- vim.g.sonokai_enable_italic=1
-- vim.g.sonokai_disable_italic_comment=1
-- vim.cmd('colorscheme sonokai')

-- vim.cmd('colorscheme kanagawa')
--
local catppuccin = require('catppuccin')
catppuccin.setup({
    transparent_background = false,
    term_colors = false,
    styles = {
        comments = "italic",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "italic",
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        lsp_trouble = false,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = false,
        },
        which_key = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = true,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = false,
        hop = false,
        notify = true,
        telekasten = true,
    }
})

vim.cmd[[colorscheme catppuccin]]
-- vim.cmd[[colorscheme iceberg]]
