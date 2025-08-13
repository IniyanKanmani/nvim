return {
  { -- Tokyonight: Colorscheme
    'folke/tokyonight.nvim',

    lazy = false,

    priority = 1003,

    opts = {},

    config = function()
      local tokyonight = require 'tokyonight'

      local tokyoNightTransparentThemeOpts = {
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
          hl['@variable.parameter'] = { fg = '#E45A7C' }
        end,
        dim_inactive = false,
        lualine_bold = true,
        cache = true,
      }

      tokyonight.setup(tokyoNightTransparentThemeOpts)

      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'

      vim.api.nvim_set_hl(0, 'SpellBad', { underline = true, sp = 'red' }) -- Underline with red color
      vim.api.nvim_set_hl(0, 'SpellCap', { underline = true, sp = 'blue' }) -- Underline with blue color
      vim.api.nvim_set_hl(0, 'SpellRare', { underline = true, sp = 'purple' }) -- Underline with purple color
      vim.api.nvim_set_hl(0, 'SpellLocal', { underline = true, sp = 'yellow' }) -- Underline with yellow color
    end,
  },
}
