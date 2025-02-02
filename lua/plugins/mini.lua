return { -- Mini Plugins
  { -- Mini AI: Better around and inside keymaps
    'echasnovski/mini.ai',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      mappings = {
        goto_left = '[e',
        goto_right = ']e',
      },

      n_lines = 500,
    },
  },

  { -- Mini Bracketed: Adds few bracket movements
    'echasnovski/mini.bracketed',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      buffer = { suffix = 'b', options = {} },
      conflict = { suffix = 'x', options = {} },
      indent = { suffix = 'n', options = {} },

      quickfix = { suffix = 'q', options = {} },
      treesitter = { suffix = 's', options = {} },
      yank = { suffix = 'y', options = {} },

      comment = { suffix = '', options = {} },
      diagnostic = { suffix = '', options = {} },
      file = { suffix = '', options = {} },
      jump = { suffix = '', options = {} },
      location = { suffix = '', options = {} },
      oldfile = { suffix = '', options = {} },
      undo = { suffix = '', options = {} },
      window = { suffix = '', options = {} },
    },
  },

  { -- Mini Move: Move Selection
    'echasnovski/mini.move',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      mappings = {
        left = 'H',
        up = 'K',
        right = 'L',
        down = 'J',

        line_left = '',
        line_right = '',
        line_down = '',
        line_up = '',
      },
    },
  },

  { -- Mini Operators: Perform operation on text
    'echasnovski/mini.operators',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      evaluate = {
        prefix = 'g=',
      },
      exchange = {
        prefix = 'ge',
      },
      multiply = {
        prefix = 'gm',
      },
      replace = {
        prefix = '',
      },
      sort = {
        prefix = 'gs',
      },
    },
  },

  { -- Mini SplitJoin: Brackets split and join
    'echasnovski/mini.splitjoin',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      mappings = {
        toggle = 'gT',
        split = 'gS',
        join = 'gJ',
      },
    },
  },

  { -- Mini Surround: Surround text objects
    'echasnovski/mini.surround',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      respect_selection_type = true,

      mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        replace = 'sr', -- Replace surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        update_n_lines = 'sn', -- Update `n_lines`

        suffix_last = 'N', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    },
  },
}
