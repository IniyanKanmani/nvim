return {
  { -- LuaLine: Beautify status line
    'nvim-lualine/lualine.nvim',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    event = 'VimEnter',

    opts = {},

    config = function()
      local lualine = require 'lualine'

      -- stylua: ignore
      local colors = {
        vertsplit       = '#181A1F',
        special_grey    = '#3B4048',
        menu_grey       = '#3E4452',
        cursor_grey     = '#2C323C',
        gutter_fg_grey  = '#4B5263',
        blue            = '#80a0ff',
        dark_red        = '#BE5046',
        white           = '#BFC7D5',
        green           = '#C3E88D',
        purple          = '#D183E8',
        yellow          = '#FFCB6B',
        light_red       = '#FF869A',
        red             = '#FF5189',
        dark_yellow     = '#F78C6C',
        cyan            = '#89DDFF',
        comment_grey    = '#697098',
        black           = '#292D3E',
        dark_black      = '#080808',
      }

      local bubbles_theme = {
        normal = {
          a = { fg = colors.dark_black, bg = colors.purple, gui = 'bold' },
          b = { fg = colors.purple, bg = colors.menu_grey },
          c = { fg = colors.comment_grey, bg = colors.black },
        },
        insert = {
          a = { fg = colors.dark_black, bg = colors.blue, gui = 'bold' },
          b = { fg = colors.blue, bg = colors.menu_grey },
        },
        visual = {
          a = { fg = colors.dark_black, bg = colors.cyan, gui = 'bold' },
          b = { fg = colors.cyan, bg = colors.menu_grey },
        },
        replace = {
          a = { fg = colors.dark_black, bg = colors.green, gui = 'bold' },
          b = { fg = colors.green, bg = colors.menu_grey },
        },
        command = {
          a = { fg = colors.dark_black, bg = colors.red, gui = 'bold' },
          b = { fg = colors.red, bg = colors.menu_grey },
        },
        inactive = {
          a = { fg = colors.comment_grey, bg = colors.black, gui = 'bold' },
          b = { fg = colors.dark_black, bg = colors.black },
          c = { fg = colors.dark_black, bg = colors.black },
        },
      }

      lualine.setup {
        options = {
          theme = bubbles_theme,
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { 'filename', 'branch' },
          lualine_c = {
            'diagnostics',
          },
          lualine_x = { 'filetype' },
          lualine_y = { 'filesize', 'progress' },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}
