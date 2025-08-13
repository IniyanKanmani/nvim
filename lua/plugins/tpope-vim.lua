return {
  { -- Vim Abolish: Work with text cases
    'tpope/vim-abolish',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },
  },

  { -- Vim Repeat: Use . to repeat previous commands
    'tpope/vim-repeat',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },
  },

  { -- Vim Surround: Surround text objects
    'tpope/vim-surround',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },
  },
}
