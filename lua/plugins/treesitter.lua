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
                    disable={"python"},
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
}



