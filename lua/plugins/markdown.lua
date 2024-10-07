return { -- Markdown Plugins
  { -- Markdown Preview: Preview markdown in a browser
    'iamcco/markdown-preview.nvim',

    lazy = true,

    cmd = 'MarkdownPreviewToggle',

    ft = 'markdown',

    build = function()
      vim.fn['mkdp#util#install']()
    end,

    opts = {},
  },

  { -- Render Markdown: Render inline markdown
    'MeanderingProgrammer/render-markdown.nvim',

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons',
    },

    lazy = true,

    ft = 'markdown',

    opts = {},
  },
}
