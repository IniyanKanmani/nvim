return {
  { -- Persistence: Automated session management
    'folke/persistence.nvim',

    lazy = true,

    event = 'VeryLazy',

    keys = {
      {
        '<leader>ql',
        function()
          require('persistence').load()
        end,
        mode = 'n',
        desc = 'Load session for cwd',
      },
      {
        '<leader>qS',
        function()
          require('persistence').select()
        end,
        mode = 'n',
        desc = 'Select a session to load',
      },
      {
        '<leader>qr',
        function()
          require('persistence').load { last = true }
        end,
        mode = 'n',
        desc = 'Load recent session',
      },
      {
        '<leader>qd',
        function()
          require('persistence').stop()
        end,
        mode = 'n',
        desc = 'Stop saving sessions',
      },
    },

    opts = {
      dir = vim.fn.stdpath 'state' .. '/sessions/', -- directory where session files are saved
      need = 1,
      branch = true,
    },
  },
}
