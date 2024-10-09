return {
  { -- Auto Save: Auto save
    'okuuva/auto-save.nvim',

    lazy = true,

    cmd = 'ASToggle',

    keys = {
      { '<leader>as', '<CMD>ASToggle<CR>', mode = 'n', desc = 'Toggle auto save' },
    },

    opts = {},
  },
}
