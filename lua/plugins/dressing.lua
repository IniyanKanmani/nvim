return {
  { -- Dressing: Better UI for input and output
    'stevearc/dressing.nvim',

    lazy = true,

    event = 'VeryLazy',

    opts = {
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
        backend = 'telescope',
      },
    },
  },
}
