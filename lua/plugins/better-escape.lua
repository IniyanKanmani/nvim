return {
  { -- Better Escape: Better escape keys
    'max397574/better-escape.nvim',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile', 'CmdlineEnter' },

    opts = {
      timeout = vim.o.timeoutlen,
      default_mappings = false,
      mappings = {
        i = {
          k = {
            j = '<Esc>',
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
