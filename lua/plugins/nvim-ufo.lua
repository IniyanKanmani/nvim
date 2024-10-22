return {
  { -- Nvim Ufo: Code Folds
    'kevinhwang91/nvim-ufo',

    dependencies = {
      'kevinhwang91/promise-async',
    },

    enabled = false,

    lazy = true,

    event = 'BufReadPre',

    opts = {
      provider_selector = function(_, _, _, _)
        return { 'lsp', 'indent' }
      end,
    },

    config = function(_, opts)
      local ufo = require 'ufo'
      ufo.setup(opts)

      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
      vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
      vim.keymap.set('n', 'zK', function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = 'Peek folded lines' })
    end,
  },
}
