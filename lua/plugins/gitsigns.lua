return {
  { -- GitSigns: Provides git stuff
    'lewis6991/gitsigns.nvim',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },

    config = function(_, opts)
      local gitsigns = require 'gitsigns'
      gitsigns.setup(opts)

      -- Navigation
      vim.keymap.set('n', '[g', function()
        if vim.wo.diff then
          vim.cmd.normal { '[g', bang = true }
        else
          gitsigns.prev_hunk()
        end
      end, { desc = 'Jump to previous [g]it change' })

      vim.keymap.set('n', ']g', function()
        if vim.wo.diff then
          vim.cmd.normal { ']g', bang = true }
        else
          gitsigns.next_hunk()
        end
      end, { desc = 'Jump to next [g]it change' })

      -- Actions (Visual Mode)
      vim.keymap.set('n', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Stage git hunk' })

      vim.keymap.set('n', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Reset git hunk' })

      -- Actions (Normal Mode)
      vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git [s]tage hunk' })
      vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git [r]eset hunk' })
      vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Git [S]tage buffer' })
      vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Git [u]ndo stage hunk' })
      vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Git [R]eset buffer' })
      vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Git [p]review hunk' })
      vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = 'Git [b]lame line' })
      vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
      vim.keymap.set('n', '<leader>gD', function()
        gitsigns.diffthis '@'
      end, { desc = 'Git [D]iff against last commit' })

      -- Toggles
      vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
      vim.keymap.set('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
    end,
  },
}
