return {
  { -- Lsp Lines: Linting with lines
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
      local lsp_lines = require 'lsp_lines'
      lsp_lines.setup()

      vim.diagnostic.config {
        virtual_text = false,
        virtual_lines = { highlight_whole_line = false },
      }

      -- vim.diagnostic.config {
      --   virtual_text = true,
      --   virtual_lines = { only_current_line = true, highlight_whole_line = false },
      -- }

      vim.keymap.set('n', '<leader>ll', function()
        local state = lsp_lines.toggle()
        vim.diagnostic.config { virtual_text = not state }
      end, { desc = 'Toggle [L]sp [L]ines' })
    end,
  },
}
