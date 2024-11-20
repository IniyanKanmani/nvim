return {
  { -- Lsp Lines: Linting with lines
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
      local lsp_lines = require 'lsp_lines'
      lsp_lines.setup()

      vim.api.nvim_create_augroup('CurrentLineLspLines', { clear = true })

      local function update_diagnostics()
        local current_line = vim.api.nvim_win_get_cursor(0)[1] - 1
        local diagnostics = vim.diagnostic.get(0, { lnum = current_line })

        if #diagnostics > 0 then
          vim.diagnostic.config {
            virtual_text = false,
            virtual_lines = { only_current_line = true, highlight_whole_line = false },
          }
        else
          vim.diagnostic.config {
            virtual_text = true,
            virtual_lines = false,
          }
        end
      end

      local toggle_lsp_lines = function(state)
        if state then
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = 'CurrentLineLspLines',
            callback = update_diagnostics,
          })
        else
          vim.api.nvim_clear_autocmds {
            group = 'CurrentLineLspLines',
          }

          vim.diagnostic.config {
            virtual_text = true,
            virtual_lines = false,
          }
        end
      end

      local state = true
      toggle_lsp_lines(state)
      update_diagnostics()

      vim.keymap.set('n', '<leader>ll', function()
        state = not state
        toggle_lsp_lines(state)
      end, { desc = 'Toggle [L]sp [L]ines' })
    end,
  },
}
