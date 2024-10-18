return {
  { -- Vim Maximizer: Maximize / Minimize splits
    'szw/vim-maximizer',

    lazy = true,

    keys = {
      {
        '<C-f>',
        '<CMD>MaximizerToggle<CR>',
        mode = 'n',
        desc = 'Maximize split size',
      },
    },

    -- opts = {},
  },
}
