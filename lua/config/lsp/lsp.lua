local lsp = vim.lsp
local fn = vim.fn

-- Make LSP floating windows have borders
lsp.handlers["textDocument/hover"] = lsp.with(
    lsp.handlers.hover,
    { border = "single" }
)

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
    lsp.handlers.signature_help,
    {
        border = "rounded",
        close_events = {"CursorMoved", "BufHidden", "InsertCharPre"},
    }
)

-- Diagnostics configuration
-- Diagnostics
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 4,
            prefix = '~',
        },
        signs = {
            -- Use a function to dynamically turn signs off
            -- and on, using buffer local variables
            enable = function(bufnr, _)
                local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
                -- No buffer local variable set, so just enable by default
                if not ok then
                    return true
                end

                return result
            end,

            priority = 20
        },
        -- Don't update in insert
        update_in_insert = false,
    }
)

-- Diagnostic Signs
fn.sign_define('DiagnosticsSignError',
    { text = '✗', texthl = 'DiagnosticsSignError' })

fn.sign_define('DiagnosticsSignWarn',
    { text = '', texthl = 'DiagnosticsSignWarn' })

fn.sign_define('DiagnosticsSignInfo',
    { text = '', texthl = 'DiagnosticsSignInfo' })

fn.sign_define('DiagnosticsSignHint',
    { text = '', texthl = 'DiagnosticsSignHint' })

-- LSP Item Kinds
require('lspkind').init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    },
})
