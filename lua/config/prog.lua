local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local utils = require('../utility')

lspconfig.lua_ls.setup({})

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup {
    ensure_installed = { 
        "pyright",
        "lua_ls",
        "ansiblels",
        "bashls",
        "clangd",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "terraformls",
        "tflint",
        "yamlls",
    },
}


lspconfig.gopls.setup {
    cmd = {'gopls', 'serve'},
    filetypes = {'go', 'gomod'},
    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
    settings = {
        gopls = {
            codelenses = {
                tidy = true,
                upgrade_dependency = true,
                generate = false,
                gc_details = false,
                test = false,
                vendor = false,
            },
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}


require('go').setup()
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

-- function go_org_imports(wait_ms)
--     local params = vim.lsp.util.make_range_params()
--     params.context = {only = {"source.organizeImports"}}
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--     for cid, res in pairs(result or {}) do
--         for _, r in pairs(res.result or {}) do
--             if r.edit then
--                 local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--                 vim.lsp.util.apply_workspace_edit(r.edit, enc)
--             end
--         end
--     end
-- end

lspconfig.terraformls.setup{}

-- vim.cmd('autocmd BufWritePre *.go lua go_org_imports(1000)')
-- vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
-- vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
-- -- vim.cmd([[let g:terraform_fmt_on_save=1]])
-- vim.cmd([[let g:terraform_align=1]])
-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--   pattern = {"*.tf", "*.tfvars"},
--   callback = vim.lsp.buf.formatting_sync(),
-- })
--
--
--
-- require("gopher").setup {
--   commands = {
--     go = "go",
--     gomodifytags = "gomodifytags",
--     gotests = "~/go/bin/gotests", -- also you can set custom command path
--     impl = "impl",
--     iferr = "iferr",
--   },
-- }
--
--
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  layout = {
    -- These control the width of the aerial window.
    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a list of mixed types.
    -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
    max_width = { 40, 0.3 },
    width = nil,
    min_width = 20,

    -- key-value pairs of window-local options for aerial window (e.g. winhl)
    win_opts = {},

    -- Determines the default direction to open the aerial window. The 'prefer'
    -- options will open the window in the other direction *if* there is a
    -- different buffer in the way of the preferred direction
    -- Enum: prefer_right, prefer_left, right, left, float
    default_direction = "prefer_right",

    -- Determines where the aerial window will be opened
    --   edge   - open aerial at the far right/left of the editor
    --   window - open aerial to the right/left of the current window
    placement = "window",

    -- When the symbols change, resize the aerial window (within min/max constraints) to fit
    resize_to_content = true,

    -- Preserve window size equality with (:help CTRL-W_=)
    preserve_equality = false,
  },
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")


vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
