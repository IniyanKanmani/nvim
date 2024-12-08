return {
  { -- Tabout: Get out of brackets and quotes
    'abecodes/tabout.nvim',

    lazy = true,

    event = { 'InsertCharPre' },

    opts = {
      act_as_tab = true,
      act_as_shift_tab = true,
      completion = false,
      ignore_beginning = false,
    },
  },
}
