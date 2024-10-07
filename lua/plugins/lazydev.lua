return {
  { -- Lazydev: configures Lua LSP for your Neovim config, runtime and plugins
    'folke/lazydev.nvim',

    dependencies = {
      'Bilal2453/luvit-meta',
    },

    lazy = true,

    ft = 'lua',

    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        {
          path = 'luvit-meta/library',
          words = {
            'vim%.uv',
          },
        },
      },
    },
  },
}
