return {
  { -- Nvim Lint: Linter
    'mfussenegger/nvim-lint',

    -- dependencies = {
    --   'rshkarin/mason-nvim-lint',
    -- },

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
    end,
  },
}
