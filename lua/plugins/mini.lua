return { -- Mini Plugins
  { -- Mini AI: Better around and inside keymaps
    'echasnovski/mini.ai',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      custom_textobjects = {
        f = false,
        s = function()
          return require('mini.ai').gen_spec.function_call()
        end,
      },

      mappings = {
        around_next = 'an',
        inside_next = 'in',
        around_last = 'al',
        inside_last = 'il',

        goto_left = '[e',
        goto_right = ']e',
      },

      n_lines = 100,
    },
  },

  { -- Mini Bracketed: Adds few bracket movements
    'echasnovski/mini.bracketed',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      conflict = { suffix = 'x', options = {} },
      oldfile = { suffix = 'b', options = {} },

      buffer = { suffix = '', options = {} },
      comment = { suffix = '', options = {} },
      diagnostic = { suffix = '', options = {} },
      file = { suffix = '', options = {} },
      indent = { suffix = '', options = {} },
      jump = { suffix = '', options = {} },
      location = { suffix = '', options = {} },
      quickfix = { suffix = '', options = {} },
      treesitter = { suffix = '', options = {} },
      undo = { suffix = '', options = {} },
      window = { suffix = '', options = {} },
      yank = { suffix = '', options = {} },
    },
  },

  { -- Mini Comment: Comment in Neovim
    'echasnovski/mini.comment',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },
  },

  -- { -- Mini Hipatterns: Set Highlight patterns in neovim
  --   'echasnovski/mini.hipatterns',
  --
  --   lazy = true,
  -- },

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
