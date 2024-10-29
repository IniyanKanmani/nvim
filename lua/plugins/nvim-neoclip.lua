return {
  { -- Nvim Neoclip: Store yank history
    'AckslD/nvim-neoclip.lua',

    dependencies = {
      'nvim-telescope/telescope.nvim',
    },

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {},

    config = function(_, opts)
      local neoclip = require 'neoclip'
      neoclip.setup(opts)

      pcall(require('telescope').load_extension, 'neoclip')
    end,
  },
}
