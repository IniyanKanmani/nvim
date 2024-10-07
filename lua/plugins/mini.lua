return { -- Mini Plugins
  { -- Mini AI: Better around and inside keymaps
    'echasnovski/mini.ai',

    lazy = true,

    event = 'BufReadPre',

    opts = {
      mappings = {
        goto_left = '[e',
        goto_right = ']e',
      },

      n_lines = 500,
    },
  },

  { -- Mini Move: Move Selection
    'echasnovski/mini.move',

    lazy = true,

    event = 'BufReadPre',

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

    event = 'BufReadPre',

    opts = {
      exchange = {
        prefix = 'ge',
      },
    },
  },

  { -- Mini SplitJoin: Brackets split and join
    'echasnovski/mini.splitjoin',

    lazy = true,

    event = 'BufReadPre',

    opts = {
      mappings = {
        toggle = 'gT',
        split = 'gS',
        join = 'gJ',
      },
    },
  },
}
