return {
  { -- Harpoon: Faster way to switch between files
    'ThePrimeagen/harpoon',

    branch = 'harpoon2',

    dependencies = {
      'nvim-telescope/telescope.nvim',
    },

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {},

    config = function(_, opts)
      local harpoon = require 'harpoon'
      harpoon:setup(opts)

      vim.keymap.set('n', '<leader>h', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<leader>H', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-S-H>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-L>', function()
        harpoon:list():next()
      end)

      for i = 1, 9, 1 do
        vim.keymap.set('n', '<leader>' .. tostring(i), function()
          harpoon:list():select(i)
        end, { desc = 'Harpoon to file ' .. tostring(i) })
      end

      pcall(require('telescope').load_extension, 'harpoon')
    end,
  },
}
