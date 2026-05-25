return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
      { '<leader>tc', '<cmd>TSContext toggle<CR>', desc = '[T]oggle code [C]ontext' },
    },
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 20,
      multiline_threshold = 3,
      mode = 'cursor',
      separator = '-',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        move = {
          set_jumps = true,
        },
      }

      local select = require 'nvim-treesitter-textobjects.select'
      local move = require 'nvim-treesitter-textobjects.move'
      local swap = require 'nvim-treesitter-textobjects.swap'

      vim.keymap.set({ 'x', 'o' }, 'af', function()
        select.select_textobject('@function.outer', 'textobjects')
      end, { desc = 'Outer function' })
      vim.keymap.set({ 'x', 'o' }, 'if', function()
        select.select_textobject('@function.inner', 'textobjects')
      end, { desc = 'Inner function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', function()
        select.select_textobject('@class.outer', 'textobjects')
      end, { desc = 'Outer class' })
      vim.keymap.set({ 'x', 'o' }, 'ic', function()
        select.select_textobject('@class.inner', 'textobjects')
      end, { desc = 'Inner class' })
      vim.keymap.set({ 'x', 'o' }, 'aa', function()
        select.select_textobject('@parameter.outer', 'textobjects')
      end, { desc = 'Outer argument' })
      vim.keymap.set({ 'x', 'o' }, 'ia', function()
        select.select_textobject('@parameter.inner', 'textobjects')
      end, { desc = 'Inner argument' })

      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
        move.goto_next_start('@function.outer', 'textobjects')
      end, { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
        move.goto_previous_start('@function.outer', 'textobjects')
      end, { desc = 'Previous function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
        move.goto_next_end('@function.outer', 'textobjects')
      end, { desc = 'Next function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
        move.goto_previous_end('@function.outer', 'textobjects')
      end, { desc = 'Previous function end' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']a', function()
        move.goto_next_start('@parameter.inner', 'textobjects')
      end, { desc = 'Next argument' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[a', function()
        move.goto_previous_start('@parameter.inner', 'textobjects')
      end, { desc = 'Previous argument' })

      vim.keymap.set('n', '<leader>na', function()
        swap.swap_next '@parameter.inner'
      end, { desc = 'Swap with next argument' })
      vim.keymap.set('n', '<leader>nA', function()
        swap.swap_previous '@parameter.inner'
      end, { desc = 'Swap with previous argument' })
    end,
  },
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      opts = opts or {}
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { '<leader>n', group = 'Code navigation' },
      })
      return opts
    end,
  },
}
