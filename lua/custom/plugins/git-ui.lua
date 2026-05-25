return {
  {
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewFileHistory',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
      'DiffviewToggleFiles',
    },
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Git diff view' },
      { '<leader>gD', '<cmd>DiffviewOpen HEAD~1<CR>', desc = 'Git diff last commit' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', desc = 'Current file history' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<CR>', desc = 'Repository history' },
      { '<leader>gq', '<cmd>DiffviewClose<CR>', desc = 'Close diff view' },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = 'diff2_horizontal' },
        merge_tool = { layout = 'diff3_horizontal', disable_diagnostics = true, winbar_info = true },
        file_history = { layout = 'diff2_horizontal' },
      },
      file_panel = {
        listing_style = 'tree',
        win_config = { position = 'left', width = 35 },
      },
    },
  },
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>Neogit<CR>', desc = 'Neogit status' },
    },
    opts = {},
  },
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      opts = opts or {}
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { '<leader>g', group = 'Git' },
      })
      return opts
    end,
  },
}
