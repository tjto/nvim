return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "bash", "clojure", "cmake", "comment", "commonlisp", "cpp", "css",
                    "diff", "dockerfile", "dot", "erlang", "groovy", "java", "jq", "json", "jsonnet",
                    "go", "gomod", "gosum", "c", "lua", "vim", "vimdoc", "query", "python",
                    "rust", "graphql", "regex", "typescript", "toml", "terraform", "xml", "yaml",
                    "markdown", "markdown_inline",
                },
                ignore_install = { "php", "phpdoc", "swift" },

                highlight = {
                    enable=true,
                    additional_vim_regex_highlighting = false,
                    use_languagetree = false,
                    disable = function(lang, bufnr)
                        local buf_name = vim.api.nvim_buf_get_name(bufnr)
                        local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
                        return file_size > 256 * 1024 or lang == "python"
                    end,
                },

                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                indent = {
                    enable = true
                }
            }
            ---WORKAROUND
            vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
                group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
                callback = function()
                    vim.opt.foldmethod     = 'expr'
                    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
                end
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    },
    {
        "m-demare/hlargs.nvim",
        requires = { 'nvim-treesitter/nvim-treesitter' },
        opts = {},
    },
    {
        'stevearc/aerial.nvim',
        opts = {
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
        },
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {
            enabled = false
        }
    }

}
