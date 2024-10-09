return {
  { -- Marks: Better marks
    'chentoast/marks.nvim',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
      default_mapping = true,
      cyclic = true,
      refresh_interval = 2000,
    },
  },
}
