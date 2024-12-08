return {
  { -- Oil: File Explorer
    'stevearc/oil.nvim',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    cmd = { 'Oil' },

    keys = {
      {
        '<leader>.',
        function()
          vim.cmd 'Oil --float'
          vim.defer_fn(function()
            require('oil').open_preview()
          end, 125)
        end,
        mode = 'n',
        desc = 'Open parent directory',
      },
    },

    opts = {
      default_file_explorer = true,
      win_options = {
        wrap = true,
        signcolumn = 'yes:2',
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      watch_for_changes = true,
      keymaps = {
        ['<C-h>'] = false,
        ['<C-s>'] = false,
        ['..'] = 'actions.parent',
        ['-'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
        ['|'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
      },
      view_options = {
        show_hidden = true,
        natural_order = 'fast',
        case_insensitive = true,
        is_always_hidden = function(name, _)
          return name == '.'
        end,
      },
      float = {
        padding = 2,
        max_width = math.floor(vim.o.columns * 0.75),
        max_height = math.floor(vim.o.lines * 0.75),
        border = 'rounded',
        preview_split = 'right',
      },
      preview = {
        update_on_cursor_moved = true,
      },
    },
  },

  { -- Oil Git Status Nvim: Git status for oil nvim
    'refractalize/oil-git-status.nvim',

    lazy = true,

    ft = 'oil',

    opts = {
      show_ignored = true,
    },

    config = function(_, opts)
      local oil_git_status = require 'oil-git-status'
      oil_git_status.setup(opts)
    end,
  },
}
