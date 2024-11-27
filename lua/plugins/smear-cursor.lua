return {
  { -- Smear-Cursor: Neovide Cursor Animation
    'sphamba/smear-cursor.nvim',

    lazy = true,

    event = 'VimEnter',

    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      use_floating_windows = true,

      time_interval = 17,
      stiffness = 0.7,
      trailing_stiffness = 0.5,
      trailing_exponent = 0,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
    },
  },
}
