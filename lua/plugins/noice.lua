return {
  { -- Noice: Better looking command mode
    'folke/noice.nvim',

    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },

    event = 'VimEnter',

    opts = {
      routes = {
        {
          filter = { event = 'notify', find = 'No information available' },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        progress = {
          enabled = false,
        },
      },
    },
  },
}