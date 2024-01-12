return {
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { 
                    "ansiblels",
                    "bashls",
                    "clangd",
                    "gopls",
                    "graphql",
                    "html",
                    "jsonls",
                    "terraformls",
                    "yamlls"
                },
            }
        end
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { { "prettierd", "prettier" } },
                go = { { "goimports", "gofmt" } }
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                go = {"golangcilint",},
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/nvim-cmp",
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        opts = {},
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()

            local dap, dapui =require("dap"),require("dapui")
            dap.listeners.after.event_initialized["dapui_config"]=function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"]=function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"]=function()
                dapui.close()
            end

            vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
            vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})


            vim.keymap.set('n', '<leader>dc', require 'dap'.continue)
            vim.keymap.set('n', '<leader>do', require 'dap'.step_over)
            vim.keymap.set('n', '<leader>di', require 'dap'.step_into)
            vim.keymap.set('n', '<leader>ds', require 'dap'.step_out)
            vim.keymap.set('n', '<leader>db', require 'dap'.toggle_breakpoint)
        end
    }
}
