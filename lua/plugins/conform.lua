return {
  { -- Conform: Formatter
    'stevearc/conform.nvim',

    dependencies = {
      'williamboman/mason.nvim',
    },

    lazy = true,

    cmd = 'ConformInfo',

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
      notify_on_error = false,
      format_on_save = {
        async = false,
        timeout_ms = 250,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        dart = { 'dart' },
        javascript = { 'prettierd' },
        lua = { 'stylua' },
        markdown = { 'markdownlint-cli2', 'markdown-toc' },
        python = { 'isort', 'black' },
        yaml = { 'prettierd' },
      },
    },

    config = function(_, opts)
      local conform = require 'conform'
      conform.setup(opts)

      vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
        conform.format { async = true, lsp_fallback = true }
      end, { desc = '[F]ormat buffer' })
    end,
  },
}
