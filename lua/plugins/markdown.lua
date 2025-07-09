return { -- Markdown Plugins
  { -- Nvim Markdown: Markdown specific features
    'ixru/nvim-markdown',

    lazy = true,

    ft = { 'markdown' },

    -- opts = {},
  },

  { -- Render Markdown: Render inline markdown
    'MeanderingProgrammer/render-markdown.nvim',

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-web-devicons',
    },

    lazy = true,

    ft = { 'markdown', 'Avante' },

    opts = {
      file_types = { 'markdown', 'Avante' },
    },
  },

  { -- Markdown Preview: Preview markdown in a browser
    'iamcco/markdown-preview.nvim',

    enabled = vim.fn.executable 'npm' == 1,

    lazy = true,

    cmd = {
      'MarkdownPreview',
      'MarkdownPreviewToggle',
    },

    build = function(plugin)
      if vim.fn.executable 'npx' then
        vim.cmd('!cd ' .. plugin.dir .. ' && cd app && npx --yes yarn install')
      else
        vim.cmd [[Lazy load markdown-preview.nvim]]
        vim.fn['mkdp#util#install']()
      end
    end,

    init = function()
      if vim.fn.executable 'npx' then
        vim.g.mkdp_filetypes = { 'markdown' }
      end

      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_command_for_global = 1
      vim.g.mkdp_combine_preview = 1

      local function load_then_exec(cmd)
        return function()
          vim.cmd.delcommand(cmd)
          require('lazy').load { plugins = { 'markdown-preview.nvim' } }
          vim.api.nvim_exec_autocmds('BufEnter', {}) -- commands appear only after BufEnter
          vim.cmd(cmd)
        end
      end

      ---Fixes "No command :MarkdownPreview"
      ---https://github.com/iamcco/markdown-preview.nvim/issues/585#issuecomment-1724859362
      for _, cmd in pairs { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' } do
        vim.api.nvim_create_user_command(cmd, load_then_exec(cmd), {})
      end

      vim.keymap.set('n', '<leader>mt', '<CMD>MarkdownPreviewToggle<CR>', { desc = 'Toggle markdown preview' })
    end,

    -- opts = {},
  },
}
