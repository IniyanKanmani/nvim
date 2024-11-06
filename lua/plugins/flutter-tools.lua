return {
  { -- Flutter Tools: Provides with flutter essentials
    'nvim-flutter/flutter-tools.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'hrsh7th/cmp-nvim-lsp',
      'stevearc/dressing.nvim',
    },

    lazy = true,

    ft = 'dart',

    opts = {
      ui = {
        border = 'rounded',
      },
      decorations = {
        statusline = {
          app_version = false,
          device = true,
          project_config = false,
        },
      },
      debugger = {
        enabled = false,
        evaluate_to_string_in_debug_views = true,
      },
      widget_guides = {
        enabled = false,
      },
      closing_tags = {
        enabled = true,
      },
      dev_log = {
        enabled = true,
        notify_errors = true,
      },
      dev_tools = {
        autostart = true,
        auto_open_browser = false,
      },
      outline = {
        auto_open = false,
      },
      lsp = {
        color = {
          enabled = false,
        },
        capabilities = Capabilities,
        on_attach = function(client, bufnr)
          return OnAttach(client, bufnr)
        end,
        settings = {
          showTodos = true,
          enableSnippets = true,
          completeFunctionCalls = true,
          updateImportsOnRename = true,
          renameFilesWithClasses = 'prompt', -- "always"
          analysisExcludedFolders = {
            vim.fn.expand '~' .. '/.pub-cache/',
            vim.fn.expand '~' .. '/development/flutter/',
          },
        },
      },
    },

    config = function(_, opts)
      local flutter_tools = require 'flutter-tools'
      flutter_tools.setup(opts)

      local debugger_current_state = opts.debugger.enabled

      vim.keymap.set('n', '<leader>fr', '<CMD>FlutterRun<CR>', { desc = '[F]lutter [R]un' })
      vim.keymap.set('n', '<leader>fq', '<CMD>FlutterQuit<CR><CMD>echo "Ending Flutter Session..."<CR>', { desc = '[F]lutter [Q]uit' })

      vim.keymap.set('n', '<leader>fd', '<CMD>FlutterDevices<CR>', { desc = '[F]lutter [D]evices' })
      vim.keymap.set('n', '<leader>fe', '<CMD>FlutterEmulators<CR>', { desc = '[F]lutter [E]mulators' })

      vim.keymap.set('n', '<leader>fl', '<CMD>FlutterReload<CR><CMD>echo "Performing Reload..."<CR>', { desc = '[F]lutter Re[L]oad' })
      vim.keymap.set('n', '<leader>fs', '<CMD>FlutterRestart<CR><CMD>echo "Performing Restart..."<CR>', { desc = '[F]lutter Re[S]tart' })

      vim.keymap.set('n', '<leader>ftd', function()
        debugger_current_state = not debugger_current_state
        opts.debugger.enabled = debugger_current_state

        flutter_tools.setup(opts)
        vim.cmd(string.format('echo %s Flutter Debugger', debugger_current_state and 'on' or 'off'))
      end, { desc = '[F]lutter [T]oggle [D]ebugger' })

      vim.keymap.set('n', '<leader>fdt', '<CMD>FlutterDetach<CR>', { desc = '[F]lutter [D]e[T]ach' })
      vim.keymap.set('n', '<leader>fcu', '<CMD>FlutterCopyProfilerUrl<CR>', { desc = '[F]lutter [C]opy Profiler [U]rl' })
      vim.keymap.set('n', '<leader>sfc', '<CMD>Telescope flutter commands<CR>', { desc = '[S]earch [F]lutter [C]ommands' })

      pcall(require('telescope').load_extension, 'flutter')
    end,
  },
}
