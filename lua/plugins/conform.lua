return {
  { -- Conform: Formatter
    'stevearc/conform.nvim',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = 'n',
        desc = '[F]ormat buffer',
      },
    },

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
        ['ruff'] = {
          append_args = { '--extend-select', 'I' },
        },
      },
      formatters_by_ft = {
        bash = { 'beautysh' },
        css = { 'prettierd' },
        dart = { lsp_format = 'fallback' },
        go = { 'goimports-reviser', 'gofumpt' },
        html = { 'prettierd' },
        javascript = { 'prettierd' },
        json = { 'prettierd' },
        lua = { 'stylua' },
        markdown = { 'prettierd' },
        php = { 'pint', 'php-cs-fixer' },
        python = { 'ruff', 'black' },
        sh = { 'beautysh' },
        sql = { 'sleek' },
        typescript = { 'prettierd' },
        zsh = { 'beautysh' },
        ['_'] = { 'trim_whitespace' },
      },
    },
  },
}
