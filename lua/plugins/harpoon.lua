return {
  { -- Harpoon: Faster way to switch between files
    'ThePrimeagen/harpoon',

    -- branch = 'harpoon2',

    dependencies = {
      'nvim-telescope/telescope.nvim',
    },

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    keys = {
      {
        '<leader>h',
        function()
          require('harpoon.ui').toggle_quick_menu()
        end,
        mode = 'n',
        desc = 'Harpoon toggle menu',
      },
      {
        '<leader>ht',
        function()
          require('harpoon.mark').toggle_file()
        end,
        mode = 'n',
        desc = 'Harpoon toggle file',
      },
      {
        '<leader>hc',
        function()
          require('harpoon.mark').clear_all()
        end,
        mode = 'n',
        desc = 'Harpoon clear all',
      },
    },

    opts = {},

    config = function()
      local ui = require 'harpoon.ui'

      for i = 1, 9, 1 do
        vim.keymap.set('n', '<leader>' .. tostring(i), function()
          ui.nav_file(i)
        end, { desc = 'Harpoon to file ' .. tostring(i) })
      end

      pcall(require('telescope').load_extension, 'harpoon')
    end,
  },
}
