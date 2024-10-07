return {
  { -- Mason: Package manager for LSP, DAP, Formatters and Linters
    'williamboman/mason.nvim',

    event = 'VimEnter',

    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  { -- Mason Lspconfig: Mason bridge for LSP
    'williamboman/mason-lspconfig.nvim',

    lazy = true,

    opts = {
      ensure_installed = {
        'lua_ls',
        'pyright',
        'ts_ls',
        'yamlls',
      },
      automatic_installation = true,
    },
  },

  { -- Mason Nvim Dap: Mason bridge for DAP
    'jay-babu/mason-nvim-dap.nvim',

    lazy = true,

    opts = {
      automatic_installation = true,
    },
  },
}
