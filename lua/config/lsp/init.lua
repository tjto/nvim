require('config.lsp.lsp')
local util = require("lspconfig.util")

require'nvim-lightbulb'.update_lightbulb {
    sign = {
        enabled = true,
        -- Priority of the gutter sign
        priority = 20,
    },
    float = {
        enabled = true,
        -- Text to show in the popup float
        text = "",
        win_opts = {},
    },
    virtual_text = {
        enabled = false,
        -- Text to show at virtual text
        text = "",
    }
}

-- Change Lightbulb sign
vim.fn.sign_define('LightBulbSign', { text = "" })

require('utility').create_augroup({
    {'CursorHold,CursorHoldI', '*', 'lua require("nvim-lightbulb").update_lightbulb()'}
}, 'nvim-lightbulb')

require('symbols-outline').setup {
    highlight_hovered_item = true,
    show_guides = true,
}

local bind = vim.api.nvim_buf_set_keymap
local lsputils = require('config.lsp.utility')

lsputils.clients['rust_analyzer'].setup {
    cmd = {
        "/Users/tung.bui/.local/share/nvim/lsp_servers/rust/rust-analyzer"
    },

    on_attach = function(client, bufnr)
        lsputils.default_on_attach(client, bufnr)

        local opts = { noremap = true, silent = true }

        lsputils.client_add_binds(
            bufnr,
            {{'n', '<Leader>lR', '<cmd>CargoReload<CR>', opts}},
            { R = 'Reload workspace' },
            { prefix = '<leader>l' }
        )
    end,
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}

lsputils.clients['gopls'].setup {
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

lsputils.clients['pyright'].setup {
    on_attach = function(client, bufnr)
        lsputils.default_on_attach(client, bufnr)

        bind(
            bufnr, 'n', '<Leader>lo',
            '<cmd>PyrightOrganizeImports<CR>',
            { noremap = true, silent = true }
        )
    end,
    settings = {
        python = {
            analysis = {
                extraPaths = {"."}
            }
        }
    }
}

lsputils.clients['tsserver'].setup {
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}

-- lsputils.clients['ccls'].setup {
--     root_dir = util.root_pattern(".ccls", "compile_commands.json", ".git"),
--     init_options = {
--         compilationDatabaseDirectory = "build";
--         index = {
--             threads = 0;
--         };
--         clang = {
--             extraArgs = { "-std=c++17" };
--             excludeArgs = { "-frounding-math" } ;
--         };
--     }
-- }

lsputils.clients['clangd'].setup{
    cmd = {
        "/Users/tung.bui/.local/share/nvim/lsp_servers/clangd/clangd/bin/clangd",
        "--background-index",
        "--suggest-missing-includes",
        '--query-driver="/usr/local/opt/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-gcc"'
    },
    init_options = {
        compilationDatabasePath="cmake-build",
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    root_dir = util.root_pattern("compile_flags.txt", "compile_commands.json", ".git") or dirname,
}
