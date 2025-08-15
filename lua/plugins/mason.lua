return {
  { -- Mason: Package manager for LSP, DAP, Formatters and Linters
    'williamboman/mason.nvim',

    lazy = true,

    event = 'VeryLazy',

    keys = {
      {
        '<leader>mn',
        '<CMD>Mason<CR>',
        mode = 'n',
        desc = 'Toggle Mason',
      },
    },

    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
}
