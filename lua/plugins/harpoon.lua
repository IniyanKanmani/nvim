return {
  { -- Harpoon: Faster way to switch between files
    'ThePrimeagen/harpoon',

    lazy = true,

    keys = {
      {
        '<leader>ht',
        function()
          require('harpoon.mark').toggle_file()
        end,
        mode = 'n',
        desc = 'Harpoon toggle file',
      },
    },

    opts = {},

    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      -- vim.keymap.set('n', '<leader>ht', mark.toggle_file, { desc = 'Harpoon toggle file' })
      vim.keymap.set('n', '<leader>hc', mark.clear_all, { desc = 'Harpoon clear all' })
      vim.keymap.set('n', '<leader>hm', ui.toggle_quick_menu, { desc = 'Harpoon toggle menu' })
    end,
  },
}
