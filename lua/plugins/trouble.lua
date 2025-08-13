return {
  { -- Trouble: Diagnostics view
    'folke/trouble.nvim',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    lazy = true,

    keys = {
      {
        '<leader>xx',
        '<CMD>Trouble diagnostics toggle<CR>',
        mode = 'n',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<CMD>Trouble diagnostics toggle filter.buf=0<CR>',
        mode = 'n',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<CMD>Trouble symbols toggle focus=false<CR>',
        mode = 'n',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<CMD>Trouble lsp toggle focus=false win.position=right<CR>',
        mode = 'n',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<CMD>Trouble loclist toggle<CR>',
        mode = 'n',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<CMD>Trouble qflist toggle<CR>',
        mode = 'n',
        desc = 'Quickfix List (Trouble)',
      },
    },

    opts = {}, -- required
  },
}
