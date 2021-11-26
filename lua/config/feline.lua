local exec = vim.api.nvim_exec

-- Setup feline.nvim
require('feline').setup {
    preset = 'noicon',
    colors = {
        bg = '#EAEAEA',
        fg = 'NONE',
        lightgray = '#323232',
        gray = '#131619',
        blue = '#506275',
        green = '#5E9274',
        cyan = '#51AAAB',
        purple = '#78558C',
    },
    vi_mode_colors = {
        ['NORMAL'] = 'green',
        ['OP'] = 'green',
        ['INSERT'] = 'red',
        ['VISUAL'] = 'oceanblue',
        ['LINES'] = 'oceanblue',
        ['BLOCK'] = 'oceanblue',
        ['REPLACE'] = 'purple',
        ['V-REPLACE'] = 'purple',
        ['ENTER'] = 'cyan',
        ['MORE'] = 'cyan',
        ['SELECT'] = 'orange',
        ['COMMAND'] = 'green',
        ['SHELL'] = 'green',
        ['TERM'] = 'green',
        ['NONE'] = 'yellow'
    }
}

