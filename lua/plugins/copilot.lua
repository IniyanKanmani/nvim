return {
  { -- Copilot Lua: Get Github Copilot in Neovim
    'zbirenbaum/copilot.lua',

    lazy = true,

    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
        auto_trigger = false,
        keymap = {
          accept = '<M-l>',
          accept_word = false,
          accept_line = false,
          prev = '<M-[>',
          next = '<M-]>',
          dismiss = '<M-h>',
        },
      },
    },

    config = function(_, opts)
      local copilot = require 'copilot'
      copilot.setup(opts)

      vim.keymap.set('n', '<leader>ts', function()
        require('copilot.suggestion').toggle_auto_trigger()
        vim.g.copilot_suggestion_auto_trigger = not vim.g.copilot_suggestion_auto_trigger
        vim.notify('Copilot suggestion auto-trigger: ' .. (vim.g.copilot_suggestion_auto_trigger and 'enabled' or 'disabled'), vim.log.levels.INFO)
      end, { desc = 'Toggle Copilot suggestion auto-trigger' })
    end,
  },
}
