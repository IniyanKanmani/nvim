return {
  { -- Nvim Lint: Linter
    'mfussenegger/nvim-lint',

    dependencies = {
      'rshkarin/mason-nvim-lint',
    },

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      linters_by_ft = {
        javascript = { 'eslint_d' },
        markdown = { 'markdownlint-cli2' },
        python = { 'mypy', 'ruff' },
        typescript = { 'eslint_d' },
        text = { 'vale' },
      },
    },

    config = function(_, opts)
      local lint = require 'lint'
      lint.linters_by_ft = opts.linters_by_ft

      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = '[L]int buffer' })

      vim.g.linting_enabled = true

      function ToggleLinting()
        vim.g.linting_enabled = not vim.g.linting_enabled
        if vim.g.linting_enabled then
          vim.notify('Linting Enabled', vim.log.levels.INFO)
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        else
          vim.notify('Linting Disabled', vim.log.levels.INFO)
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end
      end

      vim.keymap.set('n', '<leader>tl', '<CMD>lua ToggleLinting()<CR>', { desc = '[T]oggle [L]inting' })

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
