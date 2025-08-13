return {
  { -- LuaLine: Beautify status line
    'nvim-lualine/lualine.nvim',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    priority = 1001,

    lazy = false,

    opts = {},

    config = function()
      local lualine = require 'lualine'
      local lazy_status = require 'lazy.status'

      -- stylua: ignore
      local colors = {
        transparent        = '#00000000',
        purple             = '#D183E8',
        lavender           = '#7287FD',
        cyan               = '#00C9EB',
        red                = '#FF5189',
        emerald            = '#3AE69C',
        orange             = '#FF9E64',
        menu_grey          = '#3E4452',
        comment_grey       = '#697098',
        background_grey    = '#1A1B23',
        black              = '#292D3E',
        dark_black         = '#080808',
      }

      local bubbles_transparent_theme = {
        normal = {
          a = { fg = colors.dark_black, bg = colors.purple, gui = 'bold' },
          b = { fg = colors.purple, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.background_grey },
        },
        insert = {
          a = { fg = colors.dark_black, bg = colors.lavender, gui = 'bold' },
          b = { fg = colors.lavender, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.background_grey },
        },
        visual = {
          a = { fg = colors.dark_black, bg = colors.cyan, gui = 'bold' },
          b = { fg = colors.cyan, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.background_grey },
        },
        replace = {
          a = { fg = colors.dark_black, bg = colors.emerald, gui = 'bold' },
          b = { fg = colors.emerald, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.background_grey },
        },
        command = {
          a = { fg = colors.dark_black, bg = colors.red, gui = 'bold' },
          b = { fg = colors.red, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.background_grey },
        },
        inactive = {
          a = { fg = colors.comment_grey, bg = colors.black, gui = 'bold' },
          b = { fg = colors.black, bg = colors.black },
          c = { fg = colors.comment_grey, bg = colors.background_grey },
        },
      }

      local lualineTransparentThemeOpts = {
        options = {
          theme = bubbles_transparent_theme,
          component_separators = '',
          section_separators = { right = '', left = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = { 'filename', 'branch' },
          lualine_c = { 'diagnostics' },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = colors.orange },
            },
            'filetype',
          },
          lualine_y = { 'filesize', 'progress' },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = {
            { 'filename', separator = { left = '', right = '' }, right_padding = 2 },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            { 'location', separator = { left = '', right = '' }, left_padding = 2 },
          },
        },
        tabline = {},
        extensions = {},
      }

      lualine.setup(lualineTransparentThemeOpts)
    end,
  },
}
