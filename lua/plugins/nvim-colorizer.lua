return {
  { -- Nvim Colorizer: Visualize color
    'norcalli/nvim-colorizer.lua',

    lazy = true,

    event = 'BufReadPre',

    opts = {
      '*',
      css = {
        rgb_fn = true,
      },
    },
  },
}
