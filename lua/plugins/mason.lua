return {
  { -- Mason: Package manager for LSP, DAP, Formatters and Linters
    'williamboman/mason.nvim',

    dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },

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

    config = function(_, opts)
      local mason = require 'mason'
      mason.setup(opts)

      vim.keymap.set('n', '<leader>mn', '<CMD>Mason<CR>', { desc = 'Toggle Mason' })
    end,
  },

  { -- Mason Tool Installer: Mason bridge for LSP, DAP, nvim-lint, conform
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    opts = {
      ensure_installed = {
        -- LSP
        'lua-language-server',
        'marksman',
        'pyright',
        'typescript-language-server',
        'yaml-language-server',

        -- DAP
        'js-debug-adapter',

        -- nvim-lint
        'eslint_d',
        'markdownlint-cli2',
        'pylint',
        'vale',

        -- conform
        'black',
        'isort',
        'markdown-toc',
        'prettierd',
        'stylua',
      },
      auto_update = true,
    },
  },

  -- { -- Mason Lspconfig: Mason bridge for LSP
  --   'williamboman/mason-lspconfig.nvim',
  --
  --   opts = {
  --     ensure_installed = {
  --       'lus_ls',
  --       'pyright',
  --       'ts_ls',
  --       'yamlls',
  --     },
  --     automatic_installation = true,
  --   },
  -- },
  --
  -- { -- Mason Nvim Dap: Mason bridge for DAP
  --   'jay-babu/mason-nvim-dap.nvim',
  --
  --   opts = {
  --     ensure_installed = {
  --       'eslint_d',
  --       'pylint',
  --       'vale',
  --     },
  --     automatic_installation = true,
  --   },
  -- },
  --
  -- { -- Mason Nvim Lint: Mason bridge for nvim-lint
  --   'rshkarin/mason-nvim-lint',
  --
  --   opts = {
  --     ensure_installed = {
  --       'black',
  --       'isort',
  --       'prettierd',
  --       'stylua',
  --     },
  --     automatic_installation = true,
  --   },
  -- },
  --
  -- { -- Mason Conform: Mason bridge for conform
  --   'zapling/mason-conform.nvim',
  --
  --   opts = {
  --     ensure_installed = {},
  --     automatic_installation = true,
  --   },
  -- },
}
