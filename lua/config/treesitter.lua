
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
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

