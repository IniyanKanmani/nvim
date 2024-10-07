return {
  { -- Nvim Neoclip: Store yank history
    'AckslD/nvim-neoclip.lua',

    dependencies = {
      'nvim-telescope/telescope.nvim',
    },

    lazy = true,

    keys = {
      {
        '<leader>sc',
        '<CMD>Telescope neoclip<CR>',
        mode = 'n',
        desc = '[S]earch Neo[C]lip',
      },
    },

    opts = {},
  },
}
