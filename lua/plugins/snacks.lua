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

          vim.api.nvim_create_autocmd('User', {
            pattern = 'OilActionsPost',
            callback = function(event)
              if event.data.actions.type == 'move' then
                Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
              end
            end,
          })

          -- Create some toggle mappings
          snacks.toggle.option('cursorline', { name = 'Cursor Line' }):map '<leader>uc'
          snacks.toggle.option('cursorcolumn', { name = 'Cursor Column' }):map '<leader>uC'

          snacks.toggle.diagnostics():map '<leader>ud'
          snacks.toggle.indent():map '<leader>ui'
          snacks.toggle.inlay_hints():map '<leader>uh'

          snacks.toggle.line_number():map '<leader>ul'
          snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'

          snacks.toggle.scroll():map '<leader>us'
          snacks.toggle.treesitter():map '<leader>ut'

          snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>uS'
          snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'

          vim.keymap.set('n', '<leader>um', function()
            if vim.o.mouse ~= '' then
              vim.cmd 'set mouse='
              vim.notify('Disabled Mouse', vim.log.levels.INFO)
            else
              vim.cmd 'set mouse=a'
              vim.notify('Enabled Mouse', vim.log.levels.INFO)
            end
          end, { desc = 'Toggle Mouse' })
        end,
      })
    end,

    keys = {
      {
        '<leader>bd',
        function()
          require 'snacks.bufdelete'()
        end,
        mode = 'n',
        desc = 'Delete Buffer',
      },
      {
        '<leader>bda',
        function()
          require('snacks.bufdelete').all()
        end,
        mode = 'n',
        desc = 'Delete all Buffers',
      },
      {
        '<leader>bdo',
        function()
          require('snacks.bufdelete').other()
        end,
        mode = 'n',
        desc = 'Delete other than current Buffer',
      },
      {
        '<leader>e',
        function()
          require 'snacks.explorer'()
        end,
        mode = 'n',
        desc = 'Open File Explorer',
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
          require 'snacks.lazygit'()
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
        '<leader>;',
        function()
          require 'snacks.scratch'()
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
        enabled = true,
      },

      dim = {
        enabled = false,
      },

      explorer = {
        enabled = true,
        replace_netrw = false,
      },

      git = {
        enabled = true,
      },

      gitbrowse = {
        enabled = false,
      },

      image = {
        enabled = false,
      },

      indent = {
        enabled = false,
      },

      input = {
        enabled = false,
      },

      layout = {
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

      picker = {
        enabled = false,
      },

      profiler = {
        enabled = false,
      },

      quickfile = {
        enabled = true,
      },

      rename = {
        enabled = true,
      },

      scope = {
        enabled = false,
      },

      scratch = {
        enabled = true,
      },

      scroll = {
        enabled = false,
      },

      statuscolumn = {
        enabled = true,
        left = { 'mark', 'sign' },
        right = { 'fold', 'git' },
        folds = {
          open = true, -- show open fold icons
          git_hl = false, -- use Git Signs hl for fold icons
        },
        git = {
          patterns = { 'GitSign', 'MiniDiffSign' },
        },
        refresh = 100, -- refresh at most every 50ms
      },

      terminal = {
        enabled = false,
      },

      toggle = {
        enabled = true,
      },

      util = {
        enabled = false,
      },

      win = {
        enabled = false,
      },

      words = {
        enabled = false,
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
