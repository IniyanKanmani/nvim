return {
  { -- UndoTree: Undo Tree
    'mbbill/undotree',

    lazy = true,

    cmd = 'UndotreeToggle',

    keys = {
      {
        '<leader>u',
        '<CMD>UndotreeToggle<CR>',
        mode = 'n',
        desc = 'Toggle undo tree',
      },
    },
  },
}
