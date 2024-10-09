return {
  { -- Nvim Lint: Linter
    'mfussenegger/nvim-lint',

    dependencies = {
      'williamboman/mason.nvim',
    },

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
      linters_by_ft = {
        javascript = { 'eslint_d' },
        markdown = { 'vale' },
        python = { 'pylint' },
        text = { 'vale' },
      },
    },

    config = function()
      local lint = require 'lint'

      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = '[L]int buffer' })

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
