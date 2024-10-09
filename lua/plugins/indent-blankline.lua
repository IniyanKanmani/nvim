return {
  { -- Indent Blankline: Add indent lines
    'lukas-reineke/indent-blankline.nvim',

    enabled = false,

    lazy = true,

    main = 'ibl',

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
      indent = { char = '┊' },
    },
  },
}
