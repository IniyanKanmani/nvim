return {
  { -- Oil: File Explorer
    'stevearc/oil.nvim',

    -- url = 'https://github.com/stevearc/oil.nvim/pull/467/head',
    -- This PR fixes the error when fast switching preview
    commit = '60fe23050f5b93550262f5c96ab00b5c51b60830',

    dependencies = {
      'refractalize/oil-git-status.nvim',
      'nvim-tree/nvim-web-devicons',
    },

    event = 'VimEnter',

    cmd = 'Oil',

    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      win_options = {
        wrap = true,
        signcolumn = 'yes:2',
      },
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
        natural_order = true,
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

    config = function(_, opts)
      local oil = require 'oil'
      oil.setup(opts)

      vim.keymap.set('n', '<leader>-', function()
        oil.open_float()
        vim.defer_fn(function()
          oil.open_preview()
        end, 100)
      end, { desc = 'Open parent directory' })
    end,
  },

  { -- Oil Git Status Nvim: Git status for oil nvim
    'refractalize/oil-git-status.nvim',

    -- Don't modify this
    lazy = false,

    opts = {
      show_ignored = true,
    },

    -- Don't modify this
    config = function(_, opts)
      local oil_git_status = require 'oil-git-status'
      oil_git_status.setup(opts)
    end,
  },
}
