return {
  { -- Otter Nvim: LSP features for embedded code
    'jmbuhr/otter.nvim',

    lazy = true,

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },

    cmd = { 'OtterActivate' },

    keys = {
      {
        '<leader>oa',
        '<CMD>OtterActivate<CR>',
        mode = 'n',
        desc = 'Activate Otter for this buffer',
      },
    },

    opts = {},
  },
}
