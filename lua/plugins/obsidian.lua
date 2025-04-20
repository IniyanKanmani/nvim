return {
  { -- Obsidian: Note taking
    'epwalsh/obsidian.nvim',

    version = '*', -- recommended, use latest release instead of latest commit

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    lazy = true,

    event = {
      'BufReadPost ' .. vim.fn.expand '~' .. '/vault/**/*.md',
      'BufNewFile ' .. vim.fn.expand '~' .. '/vault/**/*.md',
    },

    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/vault/personal',
        },
        {
          name = 'work',
          path = '~/vault/work',
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      ui = {
        enable = false, -- using render-markdown.nvim instead
      },
    },
  },
}
