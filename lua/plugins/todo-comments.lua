return {
  { -- Todo Comments: Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
      signs = false,
    },

    config = function(_, opts)
      local todo_comments = require 'todo-comments'
      todo_comments.setup(opts)

      vim.keymap.set('n', '<leader>st', '<CMD>TodoTelescope<CR>', { desc = '[S]earch [T]odos' })
    end,
  },
}
