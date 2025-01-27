return {
  { -- Mason: Package manager for LSP, DAP, Formatters and Linters
    'williamboman/mason.nvim',

    event = 'VimEnter',

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

  { -- Mason Lspconfig: Mason bridge for LSP
    'williamboman/mason-lspconfig.nvim',

    lazy = true,

    opts = {
      ensure_installed = {
        'lua_ls',
        'marksman',
        'pyright',
        'sqls',
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
      ensure_installed = {
        'js',
      },
      automatic_installation = true,
    },
  },

  { -- Mason Nvim Lint: Mason bridge for nvim-lint
    'rshkarin/mason-nvim-lint',

    lazy = true,

    opts = {
      ensure_installed = {
        'eslint_d',
        'markdownlint-cli2',
        'mypy',
        'ruff',
        'sqlfluff',
        'vale',
      },
      automatic_installation = true,
      quiet_mode = true,
    },
  },

  { -- Mason Conform: Mason bridge for conform
    'zapling/mason-conform.nvim',

    lazy = true,

    opts = {
      ensure_installed = {
        'black',
        'markdown-toc',
        'prettierd',
        'sqlfmt',
        'stylua',
      },
      automatic_installation = true,
    },
  },
}
