-- Tree-sitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "php", "phpdoc" },
    highlight = {
        enable = true,
        disable = {"python"},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    },
    indent = {
        enable = true
    },
    -- textobjects = {
    --     select = {
    --         enable = true,
    --         keymaps = {
    --             ["af"] = "@function.outer",
    --             ["if"] = "@function.inner",
    --             ["ac"] = "@class.outer",
    --             ["ic"] = "@class.inner",

    --             ["iF"] = {
    --                 python = "(function_definition) @function",
    --                 cpp = "(function_definition) @function",
    --                 c = "(function_definition) @function",
    --                 java = "(method_declaration) @function",
    --             },
    --         },
    --     },
    -- },
}
