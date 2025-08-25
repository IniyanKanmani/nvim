return {
  { -- Lazydev: configures Lua LSP for your Neovim config, runtime and plugins
    'folke/lazydev.nvim',

    lazy = true,

    ft = 'lua',

    opts = {
      library = {
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
