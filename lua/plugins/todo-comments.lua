return {
  { -- Todo Comments: Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    lazy = true,

    event = 'BufReadPre',

    opts = {
      signs = false,
    },
  },
}
