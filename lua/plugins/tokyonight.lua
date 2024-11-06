return {
  { -- Tokyonight: Colorscheme
    'folke/tokyonight.nvim',

    lazy = true,

    opts = {},

    config = function()
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
          hl['@variable.parameter'] = { fg = '#E45A7C' }
          -- hl['@variable.parameter'] = { fg = '#FC6086' }

          -- hl['@variable'] = { fg = '#FC6086' }
          -- hl['@variable.parameter'] = { fg = '#209FB5' }
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
          hl['@variable.parameter'] = { fg = '#E45A7C' }
          -- hl['@variable.parameter'] = { fg = '#FC6086' }

          -- hl['@variable'] = { fg = '#FC6086' }
          -- hl['@variable.parameter'] = { fg = '#209FB5' }
        end,
        dim_inactive = false,
        lualine_bold = true,
        cache = true,
      }

      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
