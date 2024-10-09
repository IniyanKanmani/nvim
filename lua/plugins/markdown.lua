return { -- Markdown Plugins
  { -- Render Markdown: Render inline markdown
    'MeanderingProgrammer/render-markdown.nvim',

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-web-devicons',
    },

    lazy = true,

    ft = 'markdown',

    opts = {},
  },

  { -- Markdown Preview: Preview markdown in a browser
    'iamcco/markdown-preview.nvim',

    lazy = true,

    cmd = 'MarkdownPreviewToggle',

    build = function()
      vim.fn['mkdp#util#install']()
    end,

    opts = {},
  },
}
