return {
  { -- Oil: File Explorer
    'stevearc/oil.nvim',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    lazy = true,

    event = 'VeryLazy',

    cmd = 'Oil',

    keys = {
      {
        '<leader>.',
        function()
          local buf_type = vim.bo.filetype
          local ignore_buf_types = { 'alpha' }

          vim.cmd 'Oil --float'
          vim.defer_fn(function()
            for _, buf in ipairs(ignore_buf_types) do
              if buf == buf_type then
                return
              end
            end

            require('oil').open_preview()
          end, 250)
        end,
        mode = 'n',
        desc = 'Open parent directory floating preview',
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
        ['_'] = false,
        ['-'] = 'actions.open_cwd',
        ['..'] = 'actions.parent',
        ['<C-x>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
        ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
        ['<leader>kj'] = 'actions.close',
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
        max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.75),
        max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.75),
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

      vim.api.nvim_create_autocmd('User', {
        pattern = 'OilActionsPost',
        callback = function(event)
          if event.data.actions.type == 'move' then
            require('snacks').rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
          end
        end,
      })
    end,
  },

  { -- Oil Git Status Nvim: Git status for oil nvim
    'refractalize/oil-git-status.nvim',

    lazy = true,

    ft = { 'oil' },

    opts = {
      show_ignored = true,
    },
  },
}
