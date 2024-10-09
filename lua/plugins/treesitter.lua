return {
  { -- Nvim Treesitter: Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',

    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },

    lazy = true,

    build = ':TSUpdate',

    main = 'nvim-treesitter.configs', -- Sets main module to use for opts

    event = { 'BufReadPre', 'BufNewFile' },

    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      auto_install = true,
      -- Must always be installed
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<backspace>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- Assignments
            ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
            ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
            ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side part of an assignment' },
            ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side part of an assignment' },

            -- Parameters
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },
            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },

            -- Conditionals
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },
            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },

            -- Loops
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },
            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },

            -- Function calls
            ['im'] = { query = '@call.inner', desc = 'Select inner part of a function call' },
            ['am'] = { query = '@call.outer', desc = 'Select outer part of a function call' },

            -- Functions
            ['if'] = { query = '@function.inner', desc = 'Select inner part of a function/method' },
            ['af'] = { query = '@function.outer', desc = 'Select outer part of a function/method' },

            -- Classes
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },

            -- Comments
            ['it'] = { query = '@comment.inner', desc = 'Select inner part of a comment' },
            ['at'] = { query = '@comment.outer', desc = 'Select outer part of a comment' },
          },
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_previous_start = {
            ['[='] = { query = '@assignment.outer', desc = 'Move to previous start of an assignment' },
            ['[a'] = { query = '@parameter.outer', desc = 'Move to previous start of a parameter/aurgument' },
            ['[i'] = { query = '@conditional.outer', desc = 'Move to previous start of a conditional' },
            ['[l'] = { query = '@loop.outer', desc = 'Move to previous start of a loop' },
            ['[m'] = { query = '@call.outer', desc = 'Move to previous start of a function call' },
            ['[f'] = { query = '@function.outer', desc = 'Move to previous start of a function/method' },
            ['[c'] = { query = '@class.outer', desc = 'Move to previous start of a class' },
            ['[t'] = { query = '@comment.outer', desc = 'Move to previous start of a comment' },
          },
          goto_previous_end = {
            ['[A'] = { query = '@parameter.outer', desc = 'Move to previous end of a parameter/aurgument' },
            ['[I'] = { query = '@conditional.outer', desc = 'Move to previous end of a conditional' },
            ['[L'] = { query = '@loop.outer', desc = 'Move to previous end of a loop' },
            ['[M'] = { query = '@call.outer', desc = 'Move to previous end of a function call' },
            ['[F'] = { query = '@function.outer', desc = 'Move to previous end of a function/method' },
            ['[C'] = { query = '@class.outer', desc = 'Move to previous end of a class' },
            ['[T'] = { query = '@comment.outer', desc = 'Move to previous end of a comment' },
          },
          goto_next_start = {
            [']='] = { query = '@assignment.outer', desc = 'Move to next start of an assignment' },
            [']a'] = { query = '@parameter.outer', desc = 'Move to next start of a parameter/aurgument' },
            [']i'] = { query = '@conditional.outer', desc = 'Move to next start of a conditional' },
            [']l'] = { query = '@loop.outer', desc = 'Move to next start of a loop' },
            [']m'] = { query = '@call.outer', desc = 'Move to next start of a function call' },
            [']f'] = { query = '@function.outer', desc = 'Move to next start of a function/method' },
            [']c'] = { query = '@class.outer', desc = 'Move to next start of a class' },
            [']t'] = { query = '@comment.outer', desc = 'Move to next start of a comment' },
          },
          goto_next_end = {
            [']A'] = { query = '@parameter.outer', desc = 'Move to next end of a parameter/aurgument' },
            [']I'] = { query = '@conditional.outer', desc = 'Move to next end of a conditional' },
            [']L'] = { query = '@loop.outer', desc = 'Move to next end of a loop' },
            [']M'] = { query = '@call.outer', desc = 'Move to next end of a function call' },
            [']F'] = { query = '@function.outer', desc = 'Move to next end of a function/method' },
            [']C'] = { query = '@class.outer', desc = 'Move to next end of a class' },
            [']T'] = { query = '@comment.outer', desc = 'Move to next end of a comment' },
          },
        },

        swap = {
          enable = true,
          swap_next = {
            -- Parameters
            ['tia'] = { query = '@parameter.inner', desc = 'Swap with next inner parameter/aurgument' },
            ['taa'] = { query = '@parameter.outer', desc = 'Swap with next outer parameter/aurgument' },

            -- Conditionals
            ['tii'] = { query = '@conditional.inner', desc = 'Swap with next inner conditional' },
            ['tai'] = { query = '@conditional.outer', desc = 'Swap with next outer conditional' },

            -- Loops
            ['til'] = { query = '@loop.inner', desc = 'Swap with next inner loop' },
            ['tal'] = { query = '@loop.outer', desc = 'Swap with next outer loop' },

            -- Function calls
            ['tim'] = { query = '@call.inner', desc = 'Swap with next inner functional call' },
            ['tam'] = { query = '@call.outer', desc = 'Swap with next outer functional call' },

            -- Functions
            ['tif'] = { query = '@function.inner', desc = 'Swap with next inner function/method' },
            ['taf'] = { query = '@function.outer', desc = 'Swap with next outer function/method' },

            -- Classes
            ['tic'] = { query = '@class.inner', desc = 'Swap with next inner class' },
            ['tac'] = { query = '@class.outer', desc = 'Swap with next outer class' },

            -- Comments
            ['tit'] = { query = '@comment.inner', desc = 'Swap with next inner comment' },
            ['tat'] = { query = '@comment.outer', desc = 'Swap with next outer comment' },
          },
          swap_previous = {
            -- Parameters
            ['Tia'] = { query = '@parameter.inner', desc = 'Swap with previous inner parameter/aurgument' },
            ['Taa'] = { query = '@parameter.outer', desc = 'Swap with previous outer parameter/aurgument' },

            -- Conditionals
            ['Tii'] = { query = '@conditional.inner', desc = 'Swap with previous inner conditional' },
            ['Tai'] = { query = '@conditional.outer', desc = 'Swap with previous outer conditional' },

            -- Loops
            ['Til'] = { query = '@loop.inner', desc = 'Swap with previous inner loop' },
            ['Tal'] = { query = '@loop.outer', desc = 'Swap with previous outer loop' },

            -- Function calls
            ['Tim'] = { query = '@call.inner', desc = 'Swap with previous inner functional call' },
            ['Tam'] = { query = '@call.outer', desc = 'Swap with previous outer functional call' },

            -- Functions
            ['Tif'] = { query = '@function.inner', desc = 'Swap with previous inner function/method' },
            ['Taf'] = { query = '@function.outer', desc = 'Swap with previous outer function/method' },

            -- Classes
            ['Tic'] = { query = '@class.inner', desc = 'Swap with previous inner class' },
            ['Tac'] = { query = '@class.outer', desc = 'Swap with previous outer class' },

            -- Comments
            ['Tit'] = { query = '@comment.inner', desc = 'Swap with previous inner comment' },
            ['Tat'] = { query = '@comment.outer', desc = 'Swap with previous outer comment' },
          },
        },
      },
    },

    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

      -- Key mappings for repeating last move
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move, { desc = 'Repeat last treesitter textobject move' })
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite, { desc = 'Repeat last treesitter textobject move opposite' })

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
    end,

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
