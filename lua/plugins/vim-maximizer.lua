return {
  { -- Vim Maximizer: Maximize / Minimize splits
    'szw/vim-maximizer',

    lazy = true,

    keys = {
      {
        '<C-w>f',
        '<CMD>MaximizerToggle<CR>',
        mode = 'n',
        desc = 'Max/Min split size',
      },
    },

    -- opts = {},
  },
}
