return {
  { -- Blink Cmp: Autocompletion
    'saghen/blink.cmp',

    dependencies = {
      'L3MON4D3/LuaSnip',
    },

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile', 'CmdlineEnter' },

    version = '*',

    opts = {
      completion = {
        documentation = {
          auto_show = true,
        },
        menu = {
          draw = {
            columns = { { 'kind_icon' }, { 'label', gap = 1 }, { 'kind' } },
          },
        },
      },

      cmdline = {
        sources = { 'cmdline', 'buffer' },
        keymap = { preset = 'inherit' },
        completion = {
          menu = {
            auto_show = true,
          },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      snippets = {
        preset = 'luasnip',
      },

      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },

      signature = {
        enabled = true,
      },
    },
  },

  { -- LuaSnip: Snippet Engine
    'L3MON4D3/LuaSnip',

    lazy = true,

    build = (function()
      if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
        return
      end
      return 'make install_jsregexp'
    end)(),

    keys = {
      {
        '<C-l>',
        function()
          require('luasnip').jump(1)
        end,
        mode = { 'i', 's' },
        silent = true,
        desc = 'Move to the next entry in snippet',
      },
      {
        '<C-h>',
        function()
          require('luasnip').jump(-1)
        end,
        mode = { 'i', 's' },
        silent = true,
        desc = 'Move to the prev entry in snippet',
      },
      {
        '<C-k>',
        function()
          require('luasnip').expand()
        end,
        mode = 'i',
        silent = true,
        desc = 'Expand Docs for current snippet entry',
      },
      {
        '<C-e>',
        function()
          if require('luasnip').choice_active() then
            require('luasnip').change_choice(1)
          end
        end,
        mode = 'i',
        silent = true,
        desc = 'Expand Docs for current snippet entry',
      },
    },

    opts = {},
  },

  { -- Friendly Snippets: VS code style snippets
    'rafamadriz/friendly-snippets',

    lazy = true,

    event = 'InsertCharPre',

    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
}
