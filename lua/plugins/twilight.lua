return {
  { -- Twilight: Focus on small parts of text
    'folke/twilight.nvim',

    lazy = true,

    cmd = { 'Twilight' },

    keys = {
      { '<leader>tt', '<CMD>Twilight<CR>', mode = { 'n', 'v' }, desc = 'Toggle Twilight' },
    },

    opts = {},
  },
}
