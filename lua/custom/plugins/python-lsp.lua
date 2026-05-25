return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    lazy = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, 'pyright') then
        table.insert(opts.ensure_installed, 'pyright')
      end
      if not vim.tbl_contains(opts.ensure_installed, 'ruff') then
        table.insert(opts.ensure_installed, 'ruff')
      end
      return opts
    end,
  },
}
