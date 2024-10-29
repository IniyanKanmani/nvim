return {
  { -- Nvim Notify: Better Notifications
    'rcarriga/nvim-notify',

    lazy = true,

    opts = {
      stages = 'fade_in_slide_out',
      timeout = 2500,
      background_colour = '#000000',
      max_width = math.floor(vim.o.columns * 0.75),
      max_height = math.floor(vim.o.lines * 0.75),
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },

    config = function(_, opts)
      local notify = require 'notify'
      notify.setup(opts)

      vim.keymap.set('n', '<leader>dn', function()
        notify.dismiss { silent = true, pending = true }
      end, { desc = 'Dismiss All Notifications' })
    end,
  },
}
