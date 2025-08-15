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
        '<leader>cl',
        '<CMD>Trouble lsp toggle focus=true win.position=bottom<CR>',
        mode = 'n',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
    },

    opts = {
      auto_preview = false,
    },
  },
}
