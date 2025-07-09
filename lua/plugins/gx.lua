return {
  { -- GX: To open links
    'chrishrb/gx.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    lazy = true,

    init = function()
      vim.g.netrw_nogx = 1
    end,

    cmd = 'Browse',

    keys = {
      { 'gx', '<CMD>Browse<CR>', mode = { 'n', 'x' }, desc = 'Browse links' },
    },

    opts = {
      handler_options = {
        search_engine = 'https://search.brave.com/search?q=',
      },
    },
  },
}
