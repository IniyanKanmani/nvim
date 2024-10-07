return {
  { -- UndoTree: Undo Tree
    'mbbill/undotree',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, mode = 'n', desc = 'Toggle undo tree' },
    },
  },
}
