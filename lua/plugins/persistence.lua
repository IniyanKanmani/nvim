return {
  { -- Persistence: Automated session management
    'folke/persistence.nvim',

    lazy = true,

    event = 'VeryLazy',

    opts = {
      dir = vim.fn.stdpath 'state' .. '/sessions/', -- directory where session files are saved
      need = 1,
      branch = true,
    },

    config = function(_, opts)
      local persistence = require 'persistence'
      persistence.setup(opts)

      vim.keymap.set('n', '<leader>ql', persistence.load, { desc = 'Load session for cwd' })
      vim.keymap.set('n', '<leader>qS', persistence.select, { desc = 'Select a session to load' })
      vim.keymap.set('n', '<leader>qr', function()
        persistence.load { last = true }
      end, { desc = 'Load recent session' })
      vim.keymap.set('n', '<leader>qd', persistence.stop, { desc = 'Stop saving sessions' })
    end,
  },
}
