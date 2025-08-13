return {
  { -- Auto Pairs: Auto close brackets and quotes
    'windwp/nvim-autopairs',

    lazy = true,

    event = 'InsertCharPre',

    opts = {
      check_ts = true,
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
      },
    },
  },
}
