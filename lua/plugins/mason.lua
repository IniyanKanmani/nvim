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

  -- { -- Mason Lspconfig: Mason bridge for LSP
  --   'williamboman/mason-lspconfig.nvim',
  --
  --   lazy = true,
  --
  --   opts = {
  --     ensure_installed = {
  --       'bashls',
  --       'gopls',
  --       'html',
  --       'jsonls',
  --       'lua_ls',
  --       'marksman',
  --       'postgres_lsp',
  --       'pyright',
  --       'ruff',
  --       'tailwindcss',
  --       'ts_ls',
  --       'zk',
  --     },
  --     automatic_installation = true,
  --   },
  -- },

  -- { -- Mason Nvim Dap: Mason bridge for DAP
  --   'jay-babu/mason-nvim-dap.nvim',
  --
  --   lazy = true,
  --
  --   opts = {
  --     ensure_installed = {
  --       'js',
  --     },
  --     automatic_installation = true,
  --   },
  -- },

  -- { -- Mason Nvim Lint: Mason bridge for nvim-lint
  --   'rshkarin/mason-nvim-lint',
  --
  --   lazy = true,
  --
  --   opts = {
  --     ensure_installed = {
  --       'eslint_d',
  --       -- 'golangci-lint', -- Leave it commented
  --       'htmlhint',
  --       'jsonlint',
  --       -- 'markdownlint-cli2', -- Leave it commented
  --       'ruff',
  --       'shellcheck',
  --       -- 'sqlfluff',
  --       'stylelint',
  --     },
  --     automatic_installation = true,
  --     quiet_mode = true,
  --   },
  -- },

  -- { -- Mason Conform: Mason bridge for conform
  --   'zapling/mason-conform.nvim',
  --
  --   lazy = true,
  --
  --   opts = {
  --     ensure_installed = {
  --       'beautysh',
  --       'black',
  --       'gofumpt',
  --       'goimports-reviser',
  --       'isort',
  --       'markdown-toc',
  --       'markdownlint-cli2',
  --       'prettierd',
  --       'ruff',
  --       'sleek',
  --       -- 'sqlfmt',
  --       'stylua',
  --     },
  --     automatic_installation = true,
  --   },
  -- },
}
