return {
  { -- Tokyonight: Colorscheme
    'folke/tokyonight.nvim',

    dependencies = {
      'nvim-lualine/lualine.nvim',
      {
        dir = '/Users/apple/workspace/neovim/plugins/term-transparency.nvim',
      },
    },

    priority = 1000, -- Make sure to load this before all the other start plugins.

    event = 'VimEnter',

    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,

    opts = {},

    config = function()
      local term_transparency = require 'term_transparency'

      TokyoNightNormalThemeOpts = {
        style = 'night',
        transparent = false,
        terminal = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = 'normal',
          floats = 'normal',
        },
        on_highlights = function(hl, _)
          hl['@variable'] = { fg = '#FC6086' }
          hl['@variable.parameter'] = { fg = '#209FB5' }
        end,
        dim_inactive = false,
        lualine_bold = true,
        cache = true,
      }

      TokyoNightTransparentThemeOpts = {
        style = 'night',
        transparent = true,
        terminal = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = 'transparent',
          floats = 'transparent',
        },
        on_highlights = function(hl, _)
          hl['@variable'] = { fg = '#FC6086' }
          hl['@variable.parameter'] = { fg = '#209FB5' }
        end,
        dim_inactive = false,
        lualine_bold = true,
        cache = true,
      }

      term_transparency.opts.on_transparency_change()
    end,
  },
}
