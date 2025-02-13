return {
  { -- Better Escape: Better escape keys
    'max397574/better-escape.nvim',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile', 'CmdlineEnter' },

    opts = {
      timeout = 300,
      default_mappings = false,
      mappings = {
        i = {
          k = {
            j = '<Esc>',
          },
          j = {
            k = '<Esc>',
          },
        },
        v = {
          k = {
            j = '<Esc>',
          },
        },
        x = {
          k = {
            j = '<Esc>',
          },
        },
        c = {
          k = {
            j = '<Esc>',
          },
        },
        o = {
          k = {
            j = '<Esc>',
          },
        },
        s = {
          k = {
            j = '<Esc>',
          },
        },

        -- t = {
        --   k = {
        --     j = '<C-\\><C-n>',
        --   },
        -- },
      },
    },
  },
}
