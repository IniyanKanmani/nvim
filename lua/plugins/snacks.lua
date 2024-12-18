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
        '<leader>bd',
        function()
          require 'snacks.bufdelete'()
        end,
        mode = 'n',
        desc = 'Delete Buffer',
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
      animate = {
        enabled = false,
      },

      bigfile = {
        enabled = true,
      },

      bufdelete = {
        enabled = true,
      },

      dashboard = {
        enabled = false,
        -- preset = {
        --   keys = {
        --     { icon = ' ', key = 'n', desc = 'New File', action = '<CMD>ene <BAR> startinsert <CR>' },
        --     { icon = ' ', key = 'f', desc = 'Find File', action = '<leader>sf' },
        --     { icon = ' ', key = 'g', desc = 'Find Text', action = '<leader>sg' },
        --     { icon = ' ', key = 'r', desc = 'Recent Files', action = '<leader><leader>' },
        --     { icon = ' ', key = 's', desc = 'Recent CWD Session', action = '<leader>ql' },
        --     { icon = ' ', key = 's', desc = 'Recent Session', action = '<leader>qr' },
        --     { icon = ' ', key = 'c', desc = 'Config', action = "<CMD>lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>" },
        --     { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        --   },
        -- },
        -- sections = {
        --   { section = 'terminal', cmd = 'cowsay neovim btw', hl = 'header', padding = 1, indent = 10 },
        --   { title = 'Recent Files', section = 'recent_files', cwd = true, padding = 1 },
        --   { title = 'Sessions', section = 'projects', padding = 1 },
        --   { title = 'Keys', section = 'keys', padding = 1 },
        --   -- { section = 'startup' },
        -- },
      },

      debug = {
        enabled = false,
      },

      dim = {
        enabled = false,
      },

      git = {
        enabled = true,
      },

      gitbrowse = {
        enabled = false,
      },

      indent = {
        enabled = false,
      },

      input = {
        enabled = false,
      },

      lazygit = {
        enabled = true,
      },

      notifier = {
        enabled = true,
        timeout = 3000,
      },

      notify = {
        enabled = true,
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

      scroll = {
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

      zen = {
        enabled = false,
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
