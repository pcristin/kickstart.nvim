return {
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle focus=false<CR>', desc = 'Diagnostics' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>', desc = 'Buffer diagnostics' },
      { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<CR>', desc = 'Document symbols' },
      { '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<CR>', desc = 'LSP definitions/references' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<CR>', desc = 'Location list' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<CR>', desc = 'Quickfix list' },
      { '<leader>xq', '<cmd>Trouble close<CR>', desc = 'Close Trouble' },
    },
    opts = {
      auto_preview = false,
      focus = false,
      restore = false,
    },
  },
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      opts = opts or {}
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { '<leader>x', group = 'Trouble' },
      })
      return opts
    end,
  },
}
