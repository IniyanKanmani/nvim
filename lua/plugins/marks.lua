return {
  { -- Marks: Better marks
    'chentoast/marks.nvim',

    lazy = true,

    event = 'BufReadPre',

    opts = {
      default_mapping = true,
    },
  },
}
