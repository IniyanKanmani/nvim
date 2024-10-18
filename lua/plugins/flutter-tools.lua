return {
  { -- Flutter Tools: Provides with flutter essentials
    'akinsho/flutter-tools.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'hrsh7th/cmp-nvim-lsp',
      'stevearc/dressing.nvim',
    },

    lazy = true,

    cmd = 'FlutterRun',

    ft = 'dart',

    keys = {
      { '<leader>fs', '<CMD>FlutterRun<CR>', mode = 'n', desc = 'Flutter run' },
    },

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
        -- capabilities = function(_)
        --   local cmp_nvim_lsp = require 'cmp_nvim_lsp'
        --   return cmp_nvim_lsp.default_capabilities()
        -- end,
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          -- analysisExcludedFolders = { '~/development/flutter/' },
          renameFilesWithClasses = 'prompt', -- "always"
          enableSnippets = true,
          updateImportsOnRename = true,
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
        vim.api.nvim_command('echo "Turned ' .. (debugger_current_state and 'on' or 'off') .. ' Flutter Debugger"')
      end, { desc = '[F]lutter [T]oggle [D]ebugger' })

      vim.keymap.set('n', '<leader>fdt', '<CMD>FlutterDetach<CR>', { desc = '[F]lutter [D]e[T]ach' })
      vim.keymap.set('n', '<leader>flr', '<CMD>FlutterLspRestart<CR>', { desc = '[F]lutter [L]sp [R]estart' })

      vim.keymap.set(
        'n',
        '<leader>fcu',
        '<CMD>FlutterCopyProfilerUrl<CR><CMD>echo "Copied Flutter Profiler Url"<CR>',
        { desc = '[F]lutter [C]opy Profiler [U]rl' }
      )
      vim.keymap.set('n', '<leader>scf', '<CMD>Telescope flutter commands<CR>', { desc = '[S]earch [C]ommands [F]lutter' })
    end,
  },
}
