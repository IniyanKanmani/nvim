return {
  { -- Flutter Tools: Provides with flutter essentials
    'akinsho/flutter-tools.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'stevearc/dressing.nvim',
    },

    lazy = true,

    cmd = 'FlutterRun',

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
          project_config = true,
        },
      },
      debugger = {
        enabled = true,
      },
      widget_guides = {
        enabled = true,
      },
      dev_tools = {
        autostart = true,
        auto_open_browser = true,
      },
      outline = {
        auto_open = false,
      },
      lsp = {
        color = {
          enabled = true,
        },
        capabilities = function()
          local cmp_nvim_lsp = require 'cmp_nvim_lsp'
          cmp_nvim_lsp.default_capabilities()
        end,
      },
    },

    config = function(_, opts)
      local flutter_tools = require 'flutter-tools'
      flutter_tools.setup(opts)

      vim.keymap.set('n', '<leader>fs', '<CMD>FlutterRun<CR>', { desc = 'Flutter run' })
      vim.keymap.set('n', '<leader>fq', '<CMD>FlutterQuit<CR>', { desc = 'Flutter quit' })
      vim.keymap.set('n', '<leader>fl', '<CMD>FlutterReload<CR>', { desc = 'Flutter reload' })
      vim.keymap.set('n', '<leader>fr', '<CMD>FlutterRestart<CR>', { desc = 'Flutter restart' })
      vim.keymap.set('n', '<leader>flr', '<CMD>FlutterLspRestart<CR>', { desc = 'Flutter lsp restart' })
      vim.keymap.set('n', '<leader>fd', '<CMD>FlutterDevTools<CR>', { desc = 'Flutter open dev tools' })
    end,
  },
}
