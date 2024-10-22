return {
  { -- Better Escape: Better escape keys
    'max397574/better-escape.nvim',

    lazy = true,

    event = { 'InsertEnter' },

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
        c = {
          k = {
            j = '<Esc>',
          },
        },
        s = {
          k = {
            j = '<Esc>',
          },
        },
      },
    },
  },
}
