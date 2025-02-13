return { -- Mini Plugins
  { -- Mini AI: Better around and inside keymaps
    'echasnovski/mini.ai',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      mappings = {
        around_next = 'an',
        inside_next = 'in',
        around_last = 'al',
        inside_last = 'il',

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

  { -- Mini Comment: Comment in Neovim
    'echasnovski/mini.comment',
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
        toggle = '',
        split = 'gS',
        join = 'gJ',
      },
    },
  },
}
