return {
  { -- Nvim Lint: Linter
    'mfussenegger/nvim-lint',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    keys = {
      {
        '<leader>l',
        function()
          require('lint').try_lint()
        end,
        mode = 'n',
        desc = '[L]int buffer',
      },
    },

    opts = {
      linters_by_ft = {
        javascript = { 'eslint_d' },
        markdown = { 'markdownlint' },
        python = { 'pylint' },
        text = { 'vale' },
      },
    },

    config = function()
      local lint = require 'lint'
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
