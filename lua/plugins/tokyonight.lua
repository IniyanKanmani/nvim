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
        on_highlights = function(hl, _)
          hl['@variable'] = { fg = '#209FB5' }
          hl['@variable.parameter'] = { fg = '#FC6086' }
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
          hl['@variable'] = { fg = '#209FB5' }
          hl['@variable.parameter'] = { fg = '#FC6086' }
        end,
        dim_inactive = false,
        lualine_bold = true,
        cache = true,
      }

      local function set_transparency_mode()
        local transparency = vim.g.is_transparent
        tokyonight.setup(transparency and TokyoNightTransparentThemeOpts or TokyoNightNormalThemeOpts)
        lualine.setup(transparency and LualineTransparentThemeOpts or LualineNormalThemeOpts)

        vim.cmd.colorscheme 'tokyonight-night'
      end

      ReadTransparencyFile()
      set_transparency_mode()

      function ExecuteOnTransparencyFileChange(value)
        SetIsTransparent(value)
        set_transparency_mode()
      end

      vim.keymap.set('n', '<leader>bc', function()
        ReadTransparencyFile()
        set_transparency_mode()
      end, { desc = 'Check Background Transparency' })

      vim.keymap.set('n', '<leader>bt', function()
        vim.g.is_transparent = not vim.g.is_transparent

        WriteTransparencyFile()
      end, { desc = 'Toggle Background Transparency' })
    end,
  },
}
