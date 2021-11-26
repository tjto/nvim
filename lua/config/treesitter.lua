-- Tree-sitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'c',
        'cpp',
        'python',
        'gdscript',
        'rust',
        'bash',
        'lua',
        'toml',
        'latex',
        'dockerfile',
        'go',
        'gomod',
        'graphql',
        'hcl',
        'java',
        'json',
        'kotlin',
        'tsx',
        'typescript',
        'yaml',
        'vim'
    },
    highlight = {
        enable = true,
        disable = {},
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
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                ["iF"] = {
                    python = "(function_definition) @function",
                    cpp = "(function_definition) @function",
                    c = "(function_definition) @function",
                    java = "(method_declaration) @function",
                },
            },
        },
    },
}

