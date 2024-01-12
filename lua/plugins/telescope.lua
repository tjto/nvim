return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 
        'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'make' , 
        dependencies = {'nvim-telescope/telescope.nvim'},
        config = function()
            require('telescope').load_extension('fzf')
            require("telescope").load_extension("noice")
        end,
    }
}
