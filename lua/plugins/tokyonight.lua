return {
  { -- Tokyonight: Colorscheme
    'folke/tokyonight.nvim',

    priority = 1000, -- Make sure to load this before all the other start plugins.

    event = 'VimEnter',

    init = function()
      vim.cmd.colorscheme 'tokyonight-night'

      vim.cmd.hi 'Comment gui=none'
    end,

    opts = {
      style = 'night',
      transparent = false,
      styles = {
        floats = 'normal',
      },
    },
  },
}
