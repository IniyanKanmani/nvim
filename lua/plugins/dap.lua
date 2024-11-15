return { -- Debug Adapter Protocol Plugins
  { -- Nvim Dap: Debugging code
    'mfussenegger/nvim-dap',

    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',

      'jay-babu/mason-nvim-dap.nvim',
    },

    lazy = true,

    keys = {
      {
        '<F5>',
        function()
          require('dap').continue()
        end,
        mode = 'n',
        desc = 'Debug: Start/Continue',
      },
    },

    opts = {},

    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })

      vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: Toggle Dap UI' })
      vim.keymap.set('n', '<F11>', dap.disconnect, { desc = 'Debug: Disconnect' })
      vim.keymap.set('n', '<F12>', dap.restart, { desc = 'Debug: Restart' })

      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })

      vim.keymap.set('n', '<leader>?', function()
        dapui.eval(nil, {
          context = 'repl', -- or 'watch', 'hover'
          width = 50,
          height = 20,
          enter = true,
        })
      end, { desc = 'Debug: Display current value of variable' })
    end,
  },
}
