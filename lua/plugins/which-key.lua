return {
  { -- Which Key: Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',

    lazy = true,

    event = 'VeryLazy',

    opts = {
      preset = 'modern',
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>g', group = '[G]it', mode = 'n' },
        { '<leader>h', group = '[H]arpoon', mode = 'n' },
        { '<leader>s', group = '[S]earch Telescope', mode = 'n' },
        { '<leader>t', group = '[T]oggle', mode = 'n' },
        { '<leader>u', group = '[U] Snacks', mode = 'n' },
      },
    },
  },
}
