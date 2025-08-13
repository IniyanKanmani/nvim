return {
  { -- Flash: Faster way to move
    'folke/flash.nvim',

    lazy = true,

    event = 'VeryLazy',

    keys = {
      {
        's',
        function()
          require('flash').jump()
        end,
        mode = { 'n', 'x', 'o' },
        desc = 'Flash Search',
      },
      {
        'S',
        function()
          require('flash').treesitter()
        end,
        mode = { 'n', 'x', 'o' },
        desc = 'Flash Treesitter',
      },
      {
        'r',
        function()
          require('flash').remote()
        end,
        mode = 'o',
        desc = 'Remote Flash',
      },
      {
        'R',
        function()
          require('flash').treesitter_search()
        end,
        mode = { 'o', 'x' },
        desc = 'Treesitter Search',
      },
      {
        '<C-s>',
        function()
          require('flash').toggle()
        end,
        mode = 'c',
        desc = 'Toggle Flash Search',
      },
    },

    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },

    -- config = function(_, opts)
    --   local flash = require 'flash'
    --   flash.setup(opts)
    --
    --   vim.keymap.set({ 'n', 'x', 'o' }, 's', flash.jump, { desc = 'Flash' })
    --   vim.keymap.set({ 'n', 'x', 'o' }, 'S', flash.treesitter, { desc = 'Flash Treesitter' })
    --   vim.keymap.set('o', 'r', flash.remote, { desc = 'Remote Flash' })
    --   vim.keymap.set({ 'o', 'x' }, 'R', flash.treesitter_search, { desc = 'Treesitter Search' })
    --   vim.keymap.set('c', '<c-s>', flash.toggle, { desc = 'Toggle Flash Search' })
    -- end,
  },
}
