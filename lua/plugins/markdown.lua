return { -- Markdown Plugins
  { -- Render Markdown: Render inline markdown
    'MeanderingProgrammer/render-markdown.nvim',

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-web-devicons',
    },

    lazy = true,

    ft = 'markdown',

    opts = {
      completions = {
        blink = {
          enabled = true,
        },
      },
      file_types = { 'markdown' },
    },

    config = function(_, opts)
      local render_markdown = require 'render-markdown'
      render_markdown.setup(opts)

      local function update_markdown_toc(heading2, heading3)
        local path = vim.fn.expand '%'
        local bufnr = 0
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local toc_exists = false
        local frontmatter_end = 0
        for i, line in ipairs(lines) do
          if i == 1 and line:match '^---$' then
            for j = i + 1, #lines do
              if lines[j]:match '^---$' then
                frontmatter_end = j
                break
              end
            end
          end
          if line:match '^%s*<!%-%-%s*toc%s*%-%->%s*$' then
            toc_exists = true
            break
          end
        end
        if not toc_exists then
          local insertion_line = 1
          if frontmatter_end > 0 then
            for i = frontmatter_end + 1, #lines do
              if lines[i]:match '^#%s+' then
                insertion_line = i + 1
                break
              end
            end
          else
            for i, line in ipairs(lines) do
              if line:match '^#%s+' then
                insertion_line = i + 1
                break
              end
            end
          end
          vim.api.nvim_buf_set_lines(bufnr, insertion_line, insertion_line, false, { heading2, heading3, '<!-- toc -->' })
        end
        vim.cmd 'silent write'
        vim.fn.system('markdown-toc --bullets "-" -i ' .. path)
        vim.cmd 'edit!'
        vim.cmd 'silent write'
        vim.notify('TOC updated and file saved', vim.log.levels.INFO)
      end

      vim.keymap.set('n', '<leader>mt', function()
        update_markdown_toc('## Contents', '### Table of Contents')
      end, { desc = 'Insert/update Markdown TOC' })
    end,
  },

  { -- Markdown Preview: Preview markdown in a browser
    'iamcco/markdown-preview.nvim',

    lazy = true,

    build = function(plugin)
      if vim.fn.executable 'npx' then
        vim.cmd('!cd ' .. plugin.dir .. ' && cd app && npx --yes yarn install')
      else
        vim.cmd [[Lazy load markdown-preview.nvim]]
        vim.fn['mkdp#util#install']()
      end
    end,

    cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' },

    keys = {
      {
        '<leader>mp',
        '<CMD>MarkdownPreviewToggle<CR>',
        mode = 'n',
        desc = 'Toggle Markdown Preview',
      },
    },

    -- opts = {},

    config = function()
      if vim.fn.executable 'npx' then
        vim.g.mkdp_filetypes = { 'markdown' }
      end

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

      for _, cmd in pairs { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' } do
        vim.api.nvim_create_user_command(cmd, load_then_exec(cmd), {})
      end
    end,
  },
}
