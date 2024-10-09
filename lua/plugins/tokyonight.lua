return {
  { -- Tokyonight: Colorscheme
    'folke/tokyonight.nvim',

    dependencies = {
      'nvim-lualine/lualine.nvim',
    },

    priority = 1000, -- Make sure to load this before all the other start plugins.

    event = 'VimEnter',

    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,

    opts = {},

    config = function()
      local tokyonight = require 'tokyonight'
      local lualine = require 'lualine'

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
        dim_inactive = false,
        lualine_bold = true,
        cache = true,
      }

      local function set_transparency(transparancy)
        tokyonight.setup(transparancy and TokyoNightTransparentThemeOpts or TokyoNightNormalThemeOpts)
        lualine.setup(transparancy and LualineTransparentThemeOpts or LualineNormalThemeOpts)

        vim.cmd.colorscheme 'tokyonight-night'
      end

      set_transparency(vim.g.is_transparent)

      vim.keymap.set('n', '<leader>bt', function()
        vim.g.is_transparent = not vim.g.is_transparent
        set_transparency(vim.g.is_transparent)
      end, { desc = 'Toggle transparancy' })
    end,
  },
}
