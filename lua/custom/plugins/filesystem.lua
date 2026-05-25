return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-', '<cmd>Oil<CR>', desc = 'Open parent directory' },
      { '<leader>o', '<cmd>Oil --float<CR>', desc = 'Oil floating explorer' },
    },
    opts = {
      default_file_explorer = true,
      columns = { 'icon', 'permissions', 'size' },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = false,
      watch_for_changes = true,
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = 'unmodified',
      },
      view_options = {
        show_hidden = true,
        natural_order = 'fast',
        is_always_hidden = function(name)
          return name == '.DS_Store'
        end,
      },
      float = {
        border = 'rounded',
        max_width = 0.8,
        max_height = 0.8,
      },
    },
  },
}
