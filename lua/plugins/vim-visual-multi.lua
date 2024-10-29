return {
  { -- Vim Visual Multi: Multi cursor edit
    'mg979/vim-visual-multi',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {},

    config = function()
      vim.g.VM_maps = {
        ['Undo'] = 'u',
        ['Redo'] = '<C-r>',
        ['Add Cursor Up'] = 'k',
        ['Add Cursor Down'] = 'j',
      }
    end,
  },
}
