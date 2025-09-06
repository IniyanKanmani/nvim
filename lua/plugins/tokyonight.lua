return {
  { -- Tokyonight: Colorscheme
    'folke/tokyonight.nvim',

    lazy = false,

    priority = 1001,

    opts = {
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
    },

    config = function(_, opts)
      local tokyonight = require 'tokyonight'
      tokyonight.setup(opts)

      vim.cmd.colorscheme 'tokyonight-night'

      vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#1C1D27' })
      vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#1C1D27' })

      vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#16161E', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#3b4261', bg = 'NONE' })

      vim.api.nvim_set_hl(0, 'SpellBad', { underline = true, sp = 'red' }) -- Underline with red color
      vim.api.nvim_set_hl(0, 'SpellCap', { underline = true, sp = 'blue' }) -- Underline with blue color
      vim.api.nvim_set_hl(0, 'SpellRare', { underline = true, sp = 'purple' }) -- Underline with purple color
      vim.api.nvim_set_hl(0, 'SpellLocal', { underline = true, sp = 'yellow' }) -- Underline with yellow color
    end,
  },
}
