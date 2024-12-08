return {
  { -- Snacks Nvim: Many QoL plugins
    'folke/snacks.nvim',

    lazy = true,

    event = 'VimEnter',

    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          local snacks = require 'snacks'

          _G.dd = function(...)
            snacks.debug.inspect(...)
          end
          _G.bt = function()
            snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
          snacks.toggle.diagnostics():map '<leader>ud'
          snacks.toggle.treesitter():map '<leader>ut'
          snacks.toggle.inlay_hints():map '<leader>uh'
          snacks.toggle.line_number():map '<leader>ul'
          snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
          snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
          snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        end,
      })
    end,

    keys = {
      {
        '<leader>;',
        function()
          require('snacks').scratch()
        end,
        mode = 'n',
        desc = 'Toggle Scratch Buffer',
      },
      {
        '<leader>s;',
        function()
          require('snacks.scratch').select()
        end,
        mode = 'n',
        desc = 'Select Scratch Buffer',
      },
      {
        '<leader>gb',
        function()
          require('snacks.git').blame_line()
        end,
        mode = 'n',
        desc = 'Git Blame Line',
      },
      {
        '<leader>lg',
        function()
          require('snacks').lazygit()
        end,
        mode = 'n',
        desc = 'Lazygit',
      },
      {
        '<leader>lgf',
        function()
          require('snacks.lazygit').log_file()
        end,
        mode = 'n',
        desc = 'Lazygit Current File History',
      },
      {
        '<leader>lgl',
        function()
          require('snacks.lazygit').log()
        end,
        mode = 'n',
        desc = 'Lazygit Log (cwd)',
      },
      {
        '<leader>sn',
        function()
          require('snacks.notifier').show_history()
        end,
        mode = 'n',
        desc = 'Show All Notifications',
      },
      {
        '<leader>dn',
        function()
          require('snacks.notifier').hide()
        end,
        mode = 'n',
        desc = 'Dismiss All Notifications',
      },
      {
        '<c-/>',
        function()
          require('snacks').terminal()
        end,
        mode = 'n',
        desc = 'Toggle Terminal',
      },
      {
        ']]',
        function()
          require('snacks.words').jump(vim.v.count1)
        end,
        mode = { 'n', 't' },
        desc = 'Next Reference',
      },
      {
        '[[',
        function()
          require('snacks.words').jump(-vim.v.count1)
        end,
        mode = { 'n', 't' },
        desc = 'Prev Reference',
      },
      {
        '<leader>N',
        desc = 'Neovim News',
        function()
          require('snacks.win').win {
            file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = 'yes',
              statuscolumn = ' ',
              conceallevel = 3,
            },
          }
        end,
      },
    },

    opts = {
      bigfile = {
        enabled = true,
      },

      bufdelete = {
        enabled = true,
      },

      dashboard = {
        enabled = false,
      },

      debug = {
        enabled = false,
      },

      git = {
        enabled = true,
      },

      gitbrowse = {
        enabled = false,
      },

      lazygit = {
        enabled = true,
      },

      notify = {
        enabled = true,
      },

      notifier = {
        enabled = true,
        timeout = 3000,
      },

      profiler = {
        enabled = false,
      },

      quickfile = {
        enabled = true,
      },

      rename = {
        enabled = false,
      },

      statuscolumn = {
        enabled = true,
      },

      terminal = {
        enabled = false,
      },

      toggle = {
        enabled = true,
      },

      win = {
        enabled = true,
      },

      words = {
        enabled = true,
      },

      styles = {
        notification = {
          wo = {
            wrap = true,
          },
        },
      },
    },
  },
}
