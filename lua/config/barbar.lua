local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

require"barbar".setup{
    -- Enable/disable animations
    animation = true,

    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = true,

    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = true,

    -- Enable/disable close button
    closable = true,

    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,

    -- Excludes buffers from the tabline
    exclude_ft = {'fugitive', 'qf'},
    -- exclude_name = {'package.json'},
    --
    --
    icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = false,
        buffer_number = false,
        button = '',
        -- Enables / disables diagnostic symbols
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
            [vim.diagnostic.severity.WARN] = {enabled = false},
            [vim.diagnostic.severity.INFO] = {enabled = false},
            [vim.diagnostic.severity.HINT] = {enabled = true},
        },
        gitsigns = {
            added = {enabled = true, icon = '+'},
            changed = {enabled = true, icon = '~'},
            deleted = {enabled = true, icon = '-'},
        },
        filetype = {
            -- Sets the icon's highlight group.
            -- If false, will use nvim-web-devicons colors
            custom_colors = false,

            -- Requires `nvim-web-devicons` if `true`
            enabled = true,
        },
        separator = {left = '▎', right = ''},

        -- If true, add an additional separator at the end of the buffer list
        separator_at_end = true,

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = {button = '●'},
        pinned = {button = '', filename = true},

        -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
        preset = 'default',

        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        alternate = {filetype = {enabled = false}},
        current = {buffer_index = true},
        inactive = {button = '×'},
        visible = {modified = {buffer_number = false}},
    },

    -- If true, new buffers will be inserted at the end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = true,

    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 4,

    -- Sets the maximum buffer name length.
    maximum_length = 30,

    -- If set, the letters for each buffer in buffer-pick mode will be
    -- assigned based on their name. Otherwise or in case all letters are
    -- already assigned, the behavior is to assign letters in order of
    -- usability (see order below)
    semantic_letters = true,

    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustement
    -- for other layouts.
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

    -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
    -- where X is the buffer number. But only a static string is accepted here.
    no_name_title = nil,
}

-- Move to previous/next
map('n', '<Leader>bp', ':BufferPrevious<CR>', opts)
map('n', '<Leader>bn', ':BufferNext<CR>', opts)
-- Close buffer
map('n', '<Leader>bd', ':BufferClose<CR>', opts)
map('n', '<A-c>', ':w | %bd | e# | bd#<CR>', opts)
-- Magic buffer-picking mode
map('n', '<Leader>bc', ':BufferPick<CR>', opts)
-- Re-order to previous/next
map('n', '<Leader>bmp', ':BufferMovePrevious<CR>', opts)
map('n', '<Leader>bmn', ':BufferMoveNext<CR>', opts)
-- Sort automatically by...
map('n', '<Leader>bob', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Leader>bod', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Leader>bol', ':BufferOrderByLanguage<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)

require('which-key').register(
    {
        b = {
            name = '+buffer',
            p = 'Previous Buffer',
            n = 'Next Buffer',
            d = 'Close Buffer',
            c = 'Pick Buffer',
            m = {
                name = '+move',
                p = 'Previous',
                n = 'Next'
            },
            o = {
                name = '+order-by',
                b = 'Bufnr',
                d = 'Directory',
                l = 'Language'
            }
        }
    },
    { prefix = '<leader>' }
)
