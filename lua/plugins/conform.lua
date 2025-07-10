return {
  { -- Conform: Formatter
    'stevearc/conform.nvim',

    dependencies = {
      'zapling/mason-conform.nvim',
    },

    lazy = true,

    cmd = 'ConformInfo',

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      notify_on_error = false,
      format_on_save = {
        lsp_fallback = 'fallback',
        timeout_ms = 1000,
      },
      formatters = {
        ['markdown-toc'] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find '<!%-%- toc %-%->' then
                return true
              end
            end
          end,
        },
        ['markdownlint-cli2'] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == 'markdownlint'
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      formatters_by_ft = {
        dart = { 'dart' },
        javascript = { 'prettierd' },
        lua = { 'stylua' },
        markdown = { 'prettierd', 'markdownlint-cli2' },
        python = { 'black' },
        typescript = { 'prettierd' },
        yaml = { 'prettierd' },
        ['_'] = { 'trim_whitespace' },
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
