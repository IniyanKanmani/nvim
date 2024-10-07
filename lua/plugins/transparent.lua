return {
  { -- Transparent: Transparent background
    'xiyaowong/transparent.nvim',

    lazy = true,

    keys = {
      { '<leader>bt', '<CMD>TransparentToggle<CR>', mode = 'n', desc = 'Toggle Background' },
    },

    opts = {},
  },
}
