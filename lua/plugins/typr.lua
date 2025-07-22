return {
  { -- Typr : Monkey Type like in neovim
    'nvzone/typr',

    dependencies = 'nvzone/volt',

    lazy = true,

    cmd = { 'Typr', 'TyprStats' },

    opts = {
      mode = 'phrases', -- words, phrases
      winlayout = 'responsive',
      kblayout = 'qwerty',
      wpm_goal = 80,
      numbers = true,
      symbols = true,
      random = false,
      phrases = nil, -- can be a table of strings
      insert_on_start = false,
      stats_filepath = vim.fn.stdpath 'data' .. '/typrstats',
      mappings = nil,
      on_attach = function(buf)
        vim.b[buf].copilot_disable = true
        vim.b[buf].auto_save_toggle = true
        vim.b[buf].better_escape_disable = true
        vim.b[buf].gitsigns_disable = true
        vim.b[buf].tabout_disable = true
        vim.b[buf].ufo_preview_disable = true

        vim.diagnostic.enable(false, { bufnr = buf })

        local cmp = require 'cmp'
        cmp.setup.buffer { enabled = false }

        local autopairs = require 'nvim-autopairs'
        autopairs.disable()
      end,
    },
  },
}
