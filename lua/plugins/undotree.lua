return {
  { -- UndoTree: Undo Tree
    'mbbill/undotree',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, mode = 'n', desc = 'Toggle undo tree' },
    },
  },
}
