return {
  { -- Auto Pairs: Auto close brackets and quotes
    'windwp/nvim-autopairs',

    dependencies = {
      'hrsh7th/nvim-cmp',
    },

    lazy = true,

    event = { 'InsertEnter' },

    opts = {
      check_ts = true,
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
      },
    },

    config = function(_, opts)
      local autopairs = require 'nvim-autopairs'
      autopairs.setup(opts)

      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
