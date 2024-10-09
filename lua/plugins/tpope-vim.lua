return {
  { -- Vim Repeat: Use . to repeat previous commands
    'tpope/vim-repeat',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },
  },

  { -- Vim Sleuth: Detect and modify tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },
  },

  { -- Vim Speeddating: Fix increment and decrement on dates
    'tpope/vim-speeddating',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },
  },

  { -- Vim Surround: Intelligent surround over text-objects
    'tpope/vim-surround',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },
  },
}
