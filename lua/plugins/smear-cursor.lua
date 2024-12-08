return {
  { -- Smear-Cursor: Neovide Cursor Animation
    'sphamba/smear-cursor.nvim',

    lazy = true,

    event = 'VimEnter',

    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      legacy_computing_symbols_support = true,

      transparent_bg_fallback_color = '#000000',

      time_interval = 17,
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      trailing_exponent = 1.7,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
    },

    config = function(_, opts)
      local smear_cursor = require 'smear_cursor'
      smear_cursor.setup(opts)

      vim.keymap.set('n', '<leader>ct', '<CMD>SmearCursorToggle<CR>', { desc = '[T]oggle Smear [C]ursor' })
    end,
  },
}
