return {
  { -- Goto Preview: View LSP stuff in a floating window
    'rmagatti/goto-preview',

    lazy = true,

    -- event = { 'BufReadPost', 'BufNewFile' },

    keys = {
      {
        'gpd',
        "<lua>require('goto-preview').goto_preview_definition()<CR>",
        mode = 'n',
        desc = '[G]oto [P]review [D]efinition',
      },
      {
        'gpD',
        "<lua>require('goto_preview').goto_preview_declaration()<CR>",
        mode = 'n',
        desc = '[G]oto [P]review [D]eclaration',
      },
      {
        'gpr',
        "<lua>require('goto-preview').goto_preview_references()<CR>",
        mode = 'n',
        desc = '[G]oto [P]review [R]eferences',
      },
      {
        'gpi',
        "<lua>require('goto-preview').goto_preview_implementation()<CR>",
        mode = 'n',
        desc = '[G]oto [P]review [I]mplementation',
      },
      {
        'gpt',
        "<lua>require('goto-preview').goto_preview_type_definition()<CR>",
        mode = 'n',
        desc = '[G]oto [P]review [T]ype Definition',
      },
      {
        'gpc',
        "<lua>require('goto-preview').close_all_win()<CR>",
        mode = 'n',
        desc = '[G]oto [P]review [C]lose all windows',
      },
    },

    opts = {
      default_mappings = true,
      opacity = 0,
      focus_on_open = true,
      dismiss_on_move = false,
      stack_floating_preview_windows = true,
      preview_window_title = { enable = true, position = 'left' },
      zindex = 1,
    },

    config = function(_, opts)
      local goto_preview = require 'goto-preview'
      goto_preview.setup(opts)

      -- vim.keymap.set('n', 'gpd', goto_preview.goto_preview_definition, { desc = '[G]oto [P]review [D]efinition' })
      -- vim.keymap.set('n', 'gpD', goto_preview.goto_preview_declaration, { desc = '[G]oto [P]review [D]eclaration' })
      -- vim.keymap.set('n', 'gpr', goto_preview.goto_preview_references, { desc = '[G]oto [P]review [R]eferences' })
      -- vim.keymap.set('n', 'gpi', goto_preview.goto_preview_implementation, { desc = '[G]oto [P]review [I]mplementation' })
      -- vim.keymap.set('n', 'gpt', goto_preview.goto_preview_type_definition, { desc = '[G]oto [P]review [T]ype Definition' })
      -- vim.keymap.set('n', 'gpc', goto_preview.close_all_win, { desc = '[G]oto [P]review [C]lose all windows' })
    end,
  },
}
