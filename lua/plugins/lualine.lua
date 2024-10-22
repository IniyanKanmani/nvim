return {
  { -- LuaLine: Beautify status line
    'nvim-lualine/lualine.nvim',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    opts = {},

    config = function()
      local lazy_status = require 'lazy.status'

      -- stylua: ignore
      local colors = {
        transparent     = '#00000000',
        purple          = '#D183E8',
        emerald         = '#43DDCA',
        cyan            = '#00C6E2',
        red             = '#FF5189',
        green           = '#C3E88D',
        orange          = '#FF9E64',
        menu_grey       = '#3E4452',
        comment_grey    = '#697098',
        black           = '#292D3E',
        dark_black      = '#080808',
      }

      local bubbles_normal_theme = {
        normal = {
          a = { fg = colors.dark_black, bg = colors.purple, gui = 'bold' },
          b = { fg = colors.purple, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.black },
        },
        insert = {
          a = { fg = colors.dark_black, bg = colors.emerald, gui = 'bold' },
          b = { fg = colors.emerald, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.black },
        },
        visual = {
          a = { fg = colors.dark_black, bg = colors.cyan, gui = 'bold' },
          b = { fg = colors.cyan, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.black },
        },
        replace = {
          a = { fg = colors.dark_black, bg = colors.green, gui = 'bold' },
          b = { fg = colors.green, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.black },
        },
        command = {
          a = { fg = colors.dark_black, bg = colors.red, gui = 'bold' },
          b = { fg = colors.red, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.black },
        },
        inactive = {
          a = { fg = colors.comment_grey, bg = colors.black, gui = 'bold' },
          b = { fg = colors.black, bg = colors.black },
          c = { fg = colors.comment_grey, bg = colors.black },
        },
      }

      local bubbles_transparent_theme = {
        normal = {
          a = { fg = colors.dark_black, bg = colors.purple, gui = 'bold' },
          b = { fg = colors.purple, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.transparent },
        },
        insert = {
          a = { fg = colors.dark_black, bg = colors.emerald, gui = 'bold' },
          b = { fg = colors.emerald, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.transparent },
        },
        visual = {
          a = { fg = colors.dark_black, bg = colors.cyan, gui = 'bold' },
          b = { fg = colors.cyan, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.transparent },
        },
        replace = {
          a = { fg = colors.dark_black, bg = colors.green, gui = 'bold' },
          b = { fg = colors.green, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.transparent },
        },
        command = {
          a = { fg = colors.dark_black, bg = colors.red, gui = 'bold' },
          b = { fg = colors.red, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.transparent },
        },
        inactive = {
          a = { fg = colors.comment_grey, bg = colors.black, gui = 'bold' },
          b = { fg = colors.black, bg = colors.black },
          c = { fg = colors.comment_grey, bg = colors.transparent },
        },
      }

      LualineNormalThemeOpts = {
        options = {
          theme = bubbles_normal_theme,
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

      LualineTransparentThemeOpts = {
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
    end,
  },
}
