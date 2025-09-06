return {
  { -- Snacks Nvim: Many QoL plugins
    'folke/snacks.nvim',

    lazy = false,

    priority = 1000,

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
          require 'snacks.win' {
            file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
            width = 0.75,
            height = 0.75,
            border = 'rounded',
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
        enabled = false,
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
        enabled = false,
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
        refresh = 100,
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
        enabled = true,
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

    config = function(_, opts)
      local snacks = require 'snacks'
      snacks.setup(opts)

      _G.dd = function(...)
        snacks.debug.inspect(...)
      end
      _G.bt = function()
        snacks.debug.backtrace()
      end
      vim.print = _G.dd -- Override print to use snacks for `:=` command

      ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
      local progress = vim.defaulttable()
      vim.api.nvim_create_autocmd('LspProgress', {
        ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
          if not client or type(value) ~= 'table' then
            return
          end
          local p = progress[client.id]

          for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
              p[i] = {
                token = ev.data.params.token,
                msg = ('[%3d%%] %s%s'):format(
                  value.kind == 'end' and 100 or value.percentage or 100,
                  value.title or '',
                  value.message and (' **%s**'):format(value.message) or ''
                ),
                done = value.kind == 'end',
              }
              break
            end
          end

          local msg = {} ---@type string[]
          progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
          end, p)

          local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
          vim.notify(table.concat(msg, '\n'), 'info', {
            id = 'lsp_progress',
            title = client.name,
            opts = function(notif)
              ---@diagnostic disable-next-line: undefined-field
              notif.icon = #progress[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
          })
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

      snacks.toggle.scroll():map '<leader>uS'
      snacks.toggle.treesitter():map '<leader>ut'

      snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
      snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'

      vim.keymap.set('n', '<leader>um', function()
        if vim.o.mouse ~= '' then
          vim.cmd 'set mouse='
          vim.notify('Disabled Mouse', vim.log.levels.WARN)
        else
          vim.cmd 'set mouse=a'
          vim.notify('Enabled Mouse', vim.log.levels.INFO)
        end
      end, { desc = 'Toggle Mouse' })
    end,
  },
}
