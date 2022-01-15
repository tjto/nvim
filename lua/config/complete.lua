-- nvim-cmp configuration
local api = vim.api
local fn = vim.fn
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local has_words_before = function()
    local line, col = unpack(api.nvim_win_get_cursor(0))
    return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),

    --     ['<Tab>'] = cmp.mapping(cmp.mapping(
    --         function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_next_item()
    --             elseif luasnip.expand_or_jumpable() then
    --                 luasnip.expand_or_jump()
    --             elseif has_words_before() then
    --                 cmp.complete()
    --             else
    --                 fallback()
    --             end
    --         end
    --         ), { "i", "s" }
    --     ),

    --     ['<S-Tab>'] = cmp.mapping(cmp.mapping(
    --         function()
    --             if cmp.visible() then
    --                 cmp.select_prev_item()
    --             elseif luasnip.jumpable(-1) then
    --                 luasnip.jump(-1)
    --             else
    --                 fallback()
    --             end
    --         end
    --         ), { 'i', 's' }
    --     ),
    },

    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer'},
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'calc' }
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            vim_item.menu = ({
                buffer = "[Buffer]",
                path = "[Path]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                luasnip = "[LuaSnip]",
                calc = "[Calc]",
            })[entry.source.name]
            return vim_item
        end,
    },

}
