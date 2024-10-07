return {
  { -- Oil: File Explorer
    'stevearc/oil.nvim',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    event = 'VimEnter',

    cmd = { 'Oil' },

    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      win_options = {
        wrap = true,
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

      vim.keymap.set('n', '<leader>-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })
    end,
  },
}
