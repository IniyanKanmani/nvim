return {
  { -- Nvim Lint: Linter
    'mfussenegger/nvim-lint',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      linters_by_ft = {
        bash = { 'shellcheck' },
        css = { 'stylelint' },
        go = { 'golangci-lint' },
        html = { 'htmlhint' },
        javascript = { 'eslint_d' },
        json = { 'jsonlint' },
        markdown = { 'markdownlint-cli2' },
        php = { 'phpcs' },
        python = { 'ruff' },
        sh = { 'shellcheck' },
        -- sql = { 'sqlfluff' },
        typescript = { 'eslint_d' },
      },
    },

    config = function(_, opts)
      local lint = require 'lint'
      lint.linters_by_ft = opts.linters_by_ft

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

      vim.diagnostic.config {
        signs = {
          [vim.diagnostic.severity.ERROR] = { text = '', texthl = 'DiagnosticSignError' },
          [vim.diagnostic.severity.WARN] = { text = '', texthl = 'DiagnosticSignWarn' },
          [vim.diagnostic.severity.HINT] = { text = '󰠠', texthl = 'DiagnosticSignHint' },
          [vim.diagnostic.severity.INFO] = { text = '', texthl = 'DiagnosticSignInfo' },
        },
        virtual_text = {
          current_line = true,
        },
        -- virtual_lines = {
        --   current_line = true,
        -- },
      }
    end,
  },
}
