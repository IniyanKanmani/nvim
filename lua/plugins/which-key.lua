return {
  { -- Which Key: Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',

    event = 'VimEnter', -- Sets the loading event to 'VimEnter'

    opts = {
      preset = 'modern',
      -- Document existing key chains
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
