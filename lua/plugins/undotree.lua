return {
  { -- UndoTree: Undo Tree
    'mbbill/undotree',

    lazy = true,

    keys = {
      {
        '<leader>u',
        vim.cmd.UndotreeToggle,
        mode = 'n',
        desc = 'Toggle undo tree',
      },
    },
  },
}
