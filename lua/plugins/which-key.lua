return {
  { -- Which Key: Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',

    lazy = true,

    event = 'VeryLazy',

    opts = {
      preset = 'modern',
    },
  },
}
