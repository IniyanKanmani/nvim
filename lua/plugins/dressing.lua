return {
  { -- Dressing: Better UI for input and output
    'stevearc/dressing.nvim',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {},
  },
}
