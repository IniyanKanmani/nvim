return {
  { -- LazyGit: Git wrapper
    'kdheepak/lazygit.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    lazy = true,

    cmd = { 'LazyGit' },

    keys = {
      { '<leader>lg', '<CMD>LazyGit<CR>', mode = 'n', desc = 'LazyGit' },
    },

    opts = {},
  },
}
