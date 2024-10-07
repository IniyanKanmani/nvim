return {
  { -- Auto Save: Auto save
    'okuuva/auto-save.nvim',

    enabled = false,

    lazy = true,

    cmd = { 'ASToggle' },

    event = { 'InsertLeave', 'TextChanged' },

    keys = {
      { '<leader>as', '<CMD>ASToggle<CR>', mode = 'n', desc = 'Toggle auto save' },
    },

    opts = {},
  },
}
