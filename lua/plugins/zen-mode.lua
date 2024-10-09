return {
  { -- Zen Mode: No distraction mode
    'folke/zen-mode.nvim',

    lazy = true,

    cmd = 'ZenMode',

    keys = {
      { '<leader>z', '<CMD>ZenMode<CR>', mode = 'n', desc = 'Toggle zenmode' },
    },

    opts = {},
  },
}
