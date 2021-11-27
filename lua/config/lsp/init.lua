require('config.lsp.lsp')

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

lsputils.clients['bashls'].setup {}

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
    end
}

lsputils.clients['graphql'].setup {}

lsputils.clients['jsonls'].setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

lsputils.clients['terraformls'].setup {}

lsputils.clients['tsserver'].setup {}

lsputils.clients['yamlls'].setup {
    settings = {
        yaml = {
            validate = false
        }
    }
}


local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "◍",
            server_pending = "◍",
            server_uninstalled = "◍"
        }
    }
})

