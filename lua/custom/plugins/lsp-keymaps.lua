return {
  {
    'neovim/nvim-lspconfig',
    event = 'LspAttach',
    init = function()
      local lsp_augroup = vim.api.nvim_create_augroup('custom-lsp-keymaps', { clear = true })
      vim.api.nvim_create_autocmd('LspAttach', {
        group = lsp_augroup,
        callback = function(event)
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          vim.keymap.set('n', 'grd', function()
            local has_definition_provider = false
            for _, client in ipairs(vim.lsp.get_clients { bufnr = event.buf }) do
              if client_supports_method(client, vim.lsp.protocol.Methods.textDocument_definition, event.buf) then
                has_definition_provider = true
                break
              end
            end

            if has_definition_provider then
              require('telescope.builtin').lsp_definitions()
            else
              vim.notify('No attached LSP supports go-to-definition for this buffer', vim.log.levels.WARN)
            end
          end, { buffer = event.buf, desc = 'LSP: [G]oto [D]efinition' })
        end,
      })
    end,
  },
}
